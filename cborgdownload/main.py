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

@ck.command()
@ck.option('--uploader-project', '-up', default='cborg-j7d0g-nyah4ques5ww7pk', help='Uploader project uuid')
@ck.option('--output_file', '-of', default='uploads_latest_seqs.tsv', help='Output file')
def main(uploader_project, output_file):    
    api = arvados.api('v1', host=ARVADOS_API_HOST, token=ARVADOS_API_TOKEN)
    col = arvados.collection.Collection(api_client=api)
    state = {}
    if os.path.exists('downloads.json'):
        state = json.loads(open('downloads.json').read())
    # Load location lables
    locations = {}
    with open('cities.tsv') as f:
        for line in f:
            it = line.strip().split('\t')
            locations[it[0]] = it[1]
    
    reads = arvados.util.list_all(api.collections().list, filters=[["owner_uuid", "=", uploader_project]])
    subprojects = arvados.util.list_all(api.groups().list, filters=[["owner_uuid", "=", uploader_project]])
    for sp in subprojects:
        subreads = arvados.util.list_all(api.collections().list, filters=[["owner_uuid", "=", sp['uuid']]])
        reads += subreads
    data = []
    print('Total number of uploaded sequences:', len(reads))
    for it in reads:
        col = api.collections().get(uuid=it['uuid']).execute()
        if 'sequence_label' not in it['properties']:
            continue
        if it['uuid'] in state:
            continue
        print(it['properties'])
        if not it['properties']['is_fasta'] and not 'analysis_status' in it['properties']:
            continue
        sample_id = it['properties']['sequence_label']
        print(f'Downloading the sample {sample_id}')
        c = arvados.collection.CollectionReader(it['uuid'])
        sequence = ''
        with c.open('sequence.fasta', "r") as f:
            next(f) # Ignore header which starts with >
            for line in f:
                sequence += line.strip()
        with c.open('metadata.yaml', "r") as f:
            metadata = yaml.load(f, Loader=yaml.FullLoader)
        data.append((metadata, sequence))

    header = ['covv_virus_name', 'covv_location', 'covv_lineage', 'covv_patient_status', 'covsurver_existingmutlist',
              'sequence_length', 'covv_collection_date', 'covv_accession_id', 'covsurver_uniquemutlist',
              'covv_clade', 'sequence']
    with open(output_file, 'w') as f:
        f.write(header[0])
        for item in header[1:]:
            f.write('\t' + item)
        f.write('\n')
        for metadata, sequence in data:
            location = metadata['sample']['collection_location']
            if location in locations:
                location = locations[location]
            sample_id = metadata['sample']['sample_id']
            collection_date = metadata['sample']['collection_date']
            f.write(f'{sample_id}\t{location}\t\t\t\t{len(sequence)}\t{collection_date}\t{sample_id}\t\t\t{sequence}\n')
    
    with open('downloads.json', 'w') as f:
        f.write(json.dumps(state))
    

if __name__ == '__main__':
    main()
