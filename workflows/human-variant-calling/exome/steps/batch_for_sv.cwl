$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=multi-batch
- sentinel_outputs=sv_batch_rec:description;resources;analysis;config__algorithm__svprioritize;config__algorithm__svvalidate;config__algorithm__tools_off;config__algorithm__tools_on;genome_build;genome_resources__aliases__snpeff;genome_resources__variation__gc_profile;genome_resources__variation__germline_het_pon;reference__snpeff__GRCh38_86;work_bam_plus__disc;work_bam_plus__sr;regions__sample_callable;variants__samples;depth__bins__normalized;depth__bins__background;depth__bins__target;depth__bins__antitarget;depth__bins__seq2c;regions__bins__target;regions__bins__antitarget;regions__bins__gcannotated;regions__bins__group;config__algorithm__coverage_interval;config__algorithm__exclude_regions;config__algorithm__sv_regions;config__algorithm__svcaller;config__algorithm__variant_regions;genome_resources__rnaseq__gene_bed;genome_resources__variation__encode_blacklist;genome_resources__variation__lcr;genome_resources__variation__polyx;metadata__batch;metadata__phenotype;reference__fasta__base;align_bam;config__algorithm__variant_regions_merged;config__algorithm__seq2c_bed_ready;depth__variant_regions__regions;config__algorithm__callable_regions
- sentinel_inputs=analysis:var,genome_build:var,work_bam_plus__disc:var,work_bam_plus__sr:var,config__algorithm__tools_on:var,config__algorithm__tools_off:var,config__algorithm__svprioritize:var,config__algorithm__svvalidate:var,regions__sample_callable:var,genome_resources__variation__gc_profile:var,genome_resources__variation__germline_het_pon:var,genome_resources__aliases__snpeff:var,reference__snpeff__GRCh38_86:var,sv_coverage_rec:record,variants__samples:var
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- batch_for_sv
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: quay.io/bcbio/bcbio-vc
  dockerPull: quay.io/bcbio/bcbio-vc
- class: ResourceRequirement
  coresMin: 8
  outdirMin: 10240
  ramMin: 32768
  tmpdirMin: 0
- class: dx:InputResourceRequirement
  indirMin: 5031
inputs:
- id: analysis
  type:
    items: string
    type: array
- id: genome_build
  type:
    items: string
    type: array
- id: work_bam_plus__disc
  secondaryFiles:
  - .bai
  type:
    items:
    - File
    - 'null'
    type: array
- id: work_bam_plus__sr
  secondaryFiles:
  - .bai
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__tools_on
  type:
    items:
      items: string
      type: array
    type: array
- id: config__algorithm__tools_off
  type:
    items:
    - 'null'
    - items: 'null'
      type: array
    type: array
- id: config__algorithm__svprioritize
  type:
    items: File
    type: array
- id: config__algorithm__svvalidate
  type:
    items:
    - 'null'
    - string
    type: array
- id: regions__sample_callable
  type:
    items:
    - File
    - 'null'
    type: array
- id: genome_resources__variation__gc_profile
  type:
    items: File
    type: array
- id: genome_resources__variation__germline_het_pon
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__aliases__snpeff
  type:
    items: string
    type: array
- id: reference__snpeff__GRCh38_86
  type:
    items: File
    type: array
- id: sv_coverage_rec
  type:
    items:
      fields:
      - name: depth__bins__normalized
        type:
        - File
        - 'null'
      - name: depth__bins__background
        type:
        - File
        - 'null'
      - name: description
        type: string
      - name: resources
        type: string
      - name: depth__bins__target
        type:
        - File
        - 'null'
      - name: depth__bins__antitarget
        type:
        - File
        - 'null'
      - name: depth__bins__seq2c
        type:
        - File
        - 'null'
      - name: regions__bins__target
        type:
        - File
        - 'null'
      - name: regions__bins__antitarget
        type:
        - File
        - 'null'
      - name: regions__bins__gcannotated
        type:
        - File
        - 'null'
      - name: regions__bins__group
        type:
        - string
        - 'null'
      - name: config__algorithm__coverage_interval
        type:
        - string
        - 'null'
      - name: config__algorithm__exclude_regions
        type:
        - 'null'
        - items: 'null'
          type: array
      - name: config__algorithm__sv_regions
        type: File
      - name: config__algorithm__svcaller
        type:
          items: string
          type: array
      - name: config__algorithm__variant_regions
        type:
        - File
        - 'null'
      - name: genome_resources__rnaseq__gene_bed
        type: File
      - name: genome_resources__variation__encode_blacklist
        type:
        - 'null'
        - string
      - name: genome_resources__variation__lcr
        type: File
      - name: genome_resources__variation__polyx
        type: File
      - name: metadata__batch
        type: string
      - name: metadata__phenotype
        type: string
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
      - name: config__algorithm__seq2c_bed_ready
        type:
        - File
        - 'null'
      - name: depth__variant_regions__regions
        type:
        - File
        - 'null'
      - name: config__algorithm__callable_regions
        type: File
      name: sv_coverage_rec
      type: record
    type: array
- id: variants__samples
  type:
    items:
      items:
        items:
        - File
        - 'null'
        type: array
      type: array
    type: array
outputs:
- id: sv_batch_rec
  type:
    items:
      items:
        fields:
        - name: description
          type: string
        - name: resources
          type: string
        - name: analysis
          type: string
        - name: config__algorithm__svprioritize
          type: File
        - name: config__algorithm__svvalidate
          type:
          - 'null'
          - string
        - name: config__algorithm__tools_off
          type:
          - 'null'
          - items: 'null'
            type: array
        - name: config__algorithm__tools_on
          type:
            items: string
            type: array
        - name: genome_build
          type: string
        - name: genome_resources__aliases__snpeff
          type: string
        - name: genome_resources__variation__gc_profile
          type: File
        - name: genome_resources__variation__germline_het_pon
          type: File
        - name: reference__snpeff__GRCh38_86
          type: File
        - name: work_bam_plus__disc
          type:
          - File
          - 'null'
        - name: work_bam_plus__sr
          type:
          - File
          - 'null'
        - name: regions__sample_callable
          type:
          - File
          - 'null'
        - name: variants__samples
          type:
            items:
              items:
              - File
              - 'null'
              type: array
            type: array
        - name: depth__bins__normalized
          type:
          - File
          - 'null'
        - name: depth__bins__background
          type:
          - File
          - 'null'
        - name: depth__bins__target
          type:
          - File
          - 'null'
        - name: depth__bins__antitarget
          type:
          - File
          - 'null'
        - name: depth__bins__seq2c
          type:
          - File
          - 'null'
        - name: regions__bins__target
          type:
          - File
          - 'null'
        - name: regions__bins__antitarget
          type:
          - File
          - 'null'
        - name: regions__bins__gcannotated
          type:
          - File
          - 'null'
        - name: regions__bins__group
          type:
          - string
          - 'null'
        - name: config__algorithm__coverage_interval
          type:
          - string
          - 'null'
        - name: config__algorithm__exclude_regions
          type:
          - 'null'
          - items: 'null'
            type: array
        - name: config__algorithm__sv_regions
          type: File
        - name: config__algorithm__svcaller
          type: string
        - name: config__algorithm__variant_regions
          type:
          - File
          - 'null'
        - name: genome_resources__rnaseq__gene_bed
          type: File
        - name: genome_resources__variation__encode_blacklist
          type:
          - 'null'
          - string
        - name: genome_resources__variation__lcr
          type: File
        - name: genome_resources__variation__polyx
          type: File
        - name: metadata__batch
          type: string
        - name: metadata__phenotype
          type: string
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
        - name: config__algorithm__seq2c_bed_ready
          type:
          - File
          - 'null'
        - name: depth__variant_regions__regions
          type:
          - File
          - 'null'
        - name: config__algorithm__callable_regions
          type: File
        name: sv_batch_rec
        type: record
      type: array
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
