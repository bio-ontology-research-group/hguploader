$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=multi-combined
- sentinel_outputs=prep_samples_rec:description;resources;config__algorithm__svcaller;config__algorithm__variant_regions;rgnames__sample;reference__fasta__base
- sentinel_inputs=rgnames__sample:var,config__algorithm__svcaller:var,config__algorithm__variant_regions:var,reference__fasta__base:var,description:var,resources:var
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- prep_samples_to_rec
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: quay.io/bcbio/bcbio-vc
  dockerPull: quay.io/bcbio/bcbio-vc
- class: ResourceRequirement
  coresMin: 1
  outdirMin: 59809
  ramMin: 4096
  tmpdirMin: 24785
- class: dx:InputResourceRequirement
  indirMin: 0
inputs:
- id: rgnames__sample
  type:
    items: string
    type: array
- id: config__algorithm__svcaller
  type:
    items:
      items: string
      type: array
    type: array
- id: config__algorithm__variant_regions
  type:
    items:
    - 'null'
    - string
    type: array
- id: reference__fasta__base
  secondaryFiles:
  - ^-resources.yaml
  - ^.dict
  - .fai
  - .gz
  - .gz.fai
  - .gz.gzi
  type:
    items: File
    type: array
- id: description
  type:
    items: string
    type: array
- id: resources
  type:
    items: string
    type: array
outputs:
- id: prep_samples_rec
  type:
    items:
      fields:
      - name: description
        type: string
      - name: resources
        type: string
      - name: config__algorithm__svcaller
        type:
          items: string
          type: array
      - name: config__algorithm__variant_regions
        type:
        - 'null'
        - string
      - name: rgnames__sample
        type: string
      - name: reference__fasta__base
        type: File
      name: prep_samples_rec
      type: record
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
