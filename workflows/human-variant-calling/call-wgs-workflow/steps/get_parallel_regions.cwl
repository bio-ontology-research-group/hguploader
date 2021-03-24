$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=batch-split
- sentinel_outputs=region_block
- sentinel_inputs=batch_rec:record
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- get_parallel_regions
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: quay.io/bcbio/bcbio-vc
  dockerPull: quay.io/bcbio/bcbio-vc
- class: ResourceRequirement
  coresMin: 1
  outdirMin: 208516
  ramMin: 4096
  tmpdirMin: 99138
- class: dx:InputResourceRequirement
  indirMin: 30097
inputs:
- id: batch_rec
  type:
    items:
      fields:
      - name: config__algorithm__variantcaller_order
        type: int
      - name: description
        type: string
      - name: resources
        type: string
      - name: analysis
        type: string
      - name: config__algorithm__coverage_interval
        type:
        - string
        - 'null'
      - name: config__algorithm__effects
        type:
        - string
        - 'null'
        - boolean
      - name: config__algorithm__ensemble
        type:
        - 'null'
        - string
      - name: config__algorithm__exclude_regions
        type:
        - 'null'
        - items: 'null'
          type: array
      - name: config__algorithm__min_allele_fraction
        type: double
      - name: config__algorithm__tools_off
        type:
        - 'null'
        - items: 'null'
          type: array
      - name: config__algorithm__tools_on
        type:
          items: string
          type: array
      - name: config__algorithm__validate
        type:
        - 'null'
        - string
      - name: config__algorithm__validate_regions
        type:
        - 'null'
        - string
      - name: config__algorithm__variant_regions
        type:
        - File
        - 'null'
      - name: config__algorithm__variantcaller
        type: string
      - name: config__algorithm__vcfanno
        type:
          items: File
          type: array
      - name: genome_build
        type: string
      - name: genome_resources__aliases__ensembl
        type: string
      - name: genome_resources__aliases__human
        type:
        - string
        - 'null'
        - boolean
      - name: genome_resources__aliases__snpeff
        type: string
      - name: genome_resources__variation__1000g
        type:
        - 'null'
        - string
      - name: genome_resources__variation__clinvar
        type: File
      - name: genome_resources__variation__cosmic
        type:
        - 'null'
        - string
      - name: genome_resources__variation__dbsnp
        type: File
      - name: genome_resources__variation__encode_blacklist
        type:
        - 'null'
        - string
      - name: genome_resources__variation__esp
        type: File
      - name: genome_resources__variation__exac
        type: File
      - name: genome_resources__variation__gnomad_exome
        type: File
      - name: genome_resources__variation__lcr
        type: File
      - name: genome_resources__variation__polyx
        type: File
      - name: genome_resources__variation__train_hapmap
        type: File
      - name: genome_resources__variation__train_indels
        type: File
      - name: metadata__batch
        type:
        - 'null'
        - string
      - name: metadata__phenotype
        type: string
      - name: reference__genome_context
        type:
          items: File
          type: array
      - name: reference__rtg
        type: File
      - name: reference__snpeff__GRCh38_86
        type: File
      - name: vrn_file
        type:
        - 'null'
        - string
      - name: reference__fasta__base
        type: File
      - name: align_bam
        type:
        - File
        - 'null'
      - name: config__algorithm__variant_regions_merged
        type:
        - File
        - 'null'
      - name: regions__sample_callable
        type:
        - File
        - 'null'
      - name: config__algorithm__callable_regions
        type: File
      name: batch_rec
      type: record
    type: array
outputs:
- id: region_block
  type:
    items:
      items: string
      type: array
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
