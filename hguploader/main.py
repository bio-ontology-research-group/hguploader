#!/usr/bin/env python
import click as ck
import arvados
import os
import gzip
from Bio import SeqIO
import urllib
import getpass
import json
import yaml
import socket
import pkg_resources
import schema_salad.schema
import schema_salad.ref_resolver
import schema_salad.jsonld_context
import traceback
from rdflib import Graph, Namespace
from pyshex.evaluate import evaluate
import logging
import requests


ARVADOS_API_HOST = os.environ.get('ARVADOS_API_HOST', 'cborg.cbrc.kaust.edu.sa')
ARVADOS_API_TOKEN = os.environ.get('ARVADOS_API_TOKEN', '')
UPLOADER_URL = os.environ.get('UPLOADER_URL', 'https://hgupload.cbrc.kaust.edu.sa')

def upload_file(col, filename_local, filename_remote):
    lf = open(filename_local, 'rb')
    with col.open(filename_remote, "wb") as f:
        r = lf.read(65536)
        while r:
            f.write(r)
            r = lf.read(65536)
    lf.close()

def validate_fastq(fastq_file):
    with gzip.open(fastq_file, 'rt') as f:
        for record in SeqIO.parse(f, 'fastq'):
            pass
    return True


def validate_metadata(metadata_file):
    schema_resource = pkg_resources.resource_stream(__name__, "schema.yml")
    cache = {
        "https://raw.githubusercontent.com/bio-ontology-research-group/hguploader/master/hguploader/schema.yml": schema_resource.read().decode("utf-8")}
    (document_loader,
     avsc_names,
     schema_metadata,
     metaschema_loader) = schema_salad.schema.load_schema(
         "https://raw.githubusercontent.com/bio-ontology-research-group/hguploader/master/hguploader/schema.yml",
         cache=cache)

    shex = pkg_resources.resource_stream(
        __name__, "shex.rdf").read().decode("utf-8")

    if not isinstance(avsc_names, schema_salad.avro.schema.Names):
        print(avsc_names)
        return False

    try:
        doc, metadata = schema_salad.schema.load_and_validate(
            document_loader, avsc_names, metadata_file, True)
        g = schema_salad.jsonld_context.makerdf("workflow", doc, document_loader.ctx)
        rslt, reason = evaluate(
            g, shex, doc["id"],
            "https://raw.githubusercontent.com/bio-ontology-research-group/hguploader/master/hguploader/shex.rdf#submissionShape")

        if not rslt:
            print(reason)

        return rslt
    except Exception as e:
        traceback.print_exc()
        logging.warn(e)
    return False

@ck.command()
@ck.option(
    '--uploader-project', '-up', required=True,
    help='FASTQ sequences project uuid')
@ck.option('--sequence-read1', '-sr1', required=True, help='FASTQ File (*.fastq.gz) read 1')
@ck.option('--sequence-read2', '-sr2', help='FASTQ File (*.fastq.gz) read 2')
@ck.option('--bed-file', '-bf', help='BED file for exome uploads')
@ck.option('--metadata-file', '-m', required=True, help='METADATA File')
@ck.option('--no-sync', '-ns', is_flag=True)
@ck.option('--upload-id', '-ui', help="Upload object id")
def main(uploader_project, sequence_read1, sequence_read2, bed_file,
         metadata_file, no_sync, upload_id):
    if not validate_metadata(metadata_file):
        return
    metadata = yaml.load(open(metadata_file), Loader=yaml.FullLoader)
    api = arvados.api('v1', host=ARVADOS_API_HOST, token=ARVADOS_API_TOKEN)
    col = arvados.collection.Collection(api_client=api, num_retries=5)
    is_exome = False
    is_paired = False
    if sequence_read1 is not None:
        validate_fastq(sequence_read1)
        upload_file(col, sequence_read1, 'reads1.fastq.gz')
        if sequence_read2 is not None:
            validate_fastq(sequence_read2)
            upload_file(col, sequence_read2, 'reads2.fastq.gz')
            is_paired = True
    else:
        raise ck.UsageError('Please provide at least one FASTQ file')

    if bed_file is not None:
        is_exome = True
        upload_file(col, bed_file, 'variant_regions.bed')
    
    upload_file(col, metadata_file, 'metadata.yaml')
    sample_id = metadata['id']
    if upload_id:
        sample_id += f'_{upload_id}'
    properties = {
        "id": sample_id,
        "upload_app": "hguploader",
        "is_exome": is_exome,
        "is_paired": is_paired
    }

    col.save_new(
        owner_uuid=uploader_project, name=sample_id,
        properties=properties, ensure_unique_name=True)
    response = col.api_response()
    print(json.dumps(response))
    if not no_sync:
        col_uuid = response['uuid']
        data = {
            'token': ARVADOS_API_TOKEN,
            'col_uuid': col_uuid,
            'is_exome': is_exome,
            'is_paired': is_paired,
            'status': 'uploaded'
        }
        # Synchronize the upload on the web
        r = requests.post(UPLOADER_URL + '/api/uploader/sync', data=data)
    

    # res_uri = ARVADOS_COL_BASE_URI + response['uuid']
    # graph = to_rdf(res_uri, args.metadata.name)

    # with col.open('metadata.rdf', "wb") as f:
    #     f.write(graph.serialize(format="pretty-xml"))
    # col.save()

    # url = BORG_COVID_API + "metadata/" +  response['uuid']
    # print(requests.post(url))
    # print(json.dumps(response))


if __name__ == "__main__":
    main()
