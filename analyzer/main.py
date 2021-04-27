#!/usr/bin/env python
import click as ck
import arvados
from arvados.collection import CollectionReader
import os
import gzip
from Bio import SeqIO
import urllib
import getpass
import json
import yaml
import socket
import subprocess
import tempfile
import logging


ARVADOS_API_HOST = os.environ.get('ARVADOS_API_HOST', 'cborg.cbrc.kaust.edu.sa')
ARVADOS_API_TOKEN = os.environ.get('ARVADOS_API_TOKEN', '')

def run_workflow(api, parent_project, workflow_uuid, name, inputobj):
    project = api.groups().create(body={
        "group_class": "project",
        "name": name,
        "owner_uuid": parent_project,
    }, ensure_unique_name=True).execute()

    with tempfile.NamedTemporaryFile() as tmp:
        tmp.write(json.dumps(inputobj, indent=2).encode('utf-8'))
        tmp.flush()
        cmd = ["arvados-cwl-runner",
               "--submit",
               "--no-wait",
               "--project-uuid=%s" % project["uuid"],
               "arvwf:%s" % workflow_uuid,
               tmp.name]
        logging.info("Running %s" % ' '.join(cmd))
        proc = subprocess.run(cmd, capture_output=True)
    return project, proc

def get_cr_state(api, cr):
    if cr['container_uuid'] is None:
        return cr['state']
    c = api.containers().get(uuid=cr['container_uuid']).execute()
    if cr['state'] == 'Final' and c['state'] != 'Complete':
        return 'Cancelled'
    elif c['state'] in ['Locked', 'Queued']:
        if c['priority'] == 0:
            return 'On hold'
        else:
            return 'Queued'
    elif c['state'] == 'Complete' and c['exit_code'] != 0:
        return 'Failed'
    elif c['state'] == 'Running':
        if c['runtime_status'].get('error', None):
            return 'Failing'
        elif c['runtime_status'].get('warning', None):
            return 'Warning'
    return c['state']


def submit_new_request(
        api, workflows_project, workflow_uuid, sample_id,
        portable_data_hash, is_paired, is_exome):
    inputobj = {
        "files": []
    }
    inputobj["files"].append({
        "class": "File",
        "location": "keep:%s/reads1.fastq.gz" % portable_data_hash
    })
    if is_paired:
        inputobj["files"].append({
            "class": "File",
            "location": "keep:%s/reads2.fastq.gz" % portable_data_hash
        })
    
    name = f'Generate FASTA for {sample_id}'
    project, proc = run_workflow(
        api, workflows_project, workflow_uuid, name, inputobj)
    status = 'error'
    container_request = None
    if proc.returncode != 0:
        logging.error(proc.stderr.decode('utf-8'))
    else:
        output = proc.stderr.decode('utf-8')
        lines = output.splitlines()
        if lines[-2].find('container_request') != -1:
            container_request = lines[-2].split()[-1]
            status = 'submitted'
    return container_request, status


    
@ck.command()
@ck.option('--uploader-project', '-up', default='cborg-j7d0g-20hfcsh2q2269gf', help='Uploader project uuid')
@ck.option('--workflows-project', '-wp', default='cborg-j7d0g-yqf13st3gfnlydg', help='Workflows project uuid')
@ck.option('--wgs-workflow-uuid', '-wgs', default='cborg-7fd4e-ya7ogrz152z19ry', help='Whole genome workflow uuid')
@ck.option('--wes-workflow-uuid', '-wes', default='cborg-7fd4e-ldc7wy1xx6oca42', help='Whole exome workflow uuid')
@ck.option('--trio-workflow-uuid', '-trio', default='cborg-7fd4e-rke71pmedcc4k97', help='Trio workflow uuid')
def main(uploader_project, workflows_project, wgs_workflow_uuid, wes_workflow_uuid, trio_workflow_uuid):  
    api = arvados.api('v1', host=ARVADOS_API_HOST, token=ARVADOS_API_TOKEN)
    col = arvados.collection.Collection(api_client=api)
    state = {}
    if os.path.exists('state.json'):
        state = json.loads(open('state.json').read())
    reads = [] # arvados.util.list_all(api.collections().list, filters=[["owner_uuid", "=", uploader_project]])
    subprojects = arvados.util.list_all(api.groups().list, filters=[["owner_uuid", "=", uploader_project]])
    for sp in subprojects:
        subreads = arvados.util.list_all(api.collections().list, filters=[["owner_uuid", "=", sp['uuid']]])
        reads += subreads
    print('Total number of uploaded sequences:', len(reads))
    for it in reads:
        col = api.collections().get(uuid=it['uuid']).execute()
        if 'id' not in it['properties']:
            continue
        sample_id = it['properties']['id']
        if 'analysis_complete' in it['properties']:
            continue
        if sample_id not in state:
            state[sample_id] = {
                'status': 'new',
                'container_request': None,
                'output_collection': None,
            }
        sample_state = state[sample_id]
        if sample_state['status'] == 'new':
            if it['properties']['is_exome']:
                workflow_uuid = wes_workflow_uuid
            else:
                workflow_uuid = wgs_workflow_uuid
                
            container_request, status = submit_new_request(
                api, workflows_project, workflow_uuid, sample_id,
                it['portable_data_hash'], it['properties']['is_paired'],
                it['properties']['is_exome'])
            sample_state['status'] = status
            sample_state['container_request'] = container_request
            print(f'Submitted analysis request for {sample_id}')
                
        elif sample_state['status'] == 'submitted':
            # TODO: check container request status
            if sample_state['container_request'] is None:
                raise Exception("Container request cannot be empty when status is submitted")
            cr = api.container_requests().get(
                uuid=sample_state["container_request"]).execute()
            cr_state = get_cr_state(api, cr)
            print(f'Container request for {sample_id} is {cr_state}')
            if cr_state == 'Complete':
                out_col = api.collections().get(uuid=cr["output_uuid"]).execute()
                sample_state['output_collection'] = cr["output_uuid"]
                sample_state['status'] = 'complete'
                # Copy output files to reads collection
                it['properties']['analysis_complete'] = True
                api.collections().update(
                    uuid=it['uuid'],
                    body={"properties": it["properties"]}).execute()
            elif cr_state == 'Failed':
                state[sample_id] = {
                    'status': 'new',
                    'container_request': None,
                    'output_collection': None,
        
                }
        elif sample_state['status'] == 'complete':
            # TODO: do nothing
            pass
    
    with open('state.json', 'w') as f:
        f.write(json.dumps(state))


if __name__ == '__main__':
    main()
