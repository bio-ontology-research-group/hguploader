$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=multi-batch
- sentinel_outputs=batch_rec:config__algorithm__variantcaller_order;description;resources;analysis;config__algorithm__coverage_interval;config__algorithm__effects;config__algorithm__ensemble;config__algorithm__exclude_regions;config__algorithm__min_allele_fraction;config__algorithm__tools_off;config__algorithm__tools_on;config__algorithm__validate;config__algorithm__validate_regions;config__algorithm__variant_regions;config__algorithm__variantcaller;config__algorithm__vcfanno;genome_build;genome_resources__aliases__ensembl;genome_resources__aliases__human;genome_resources__aliases__snpeff;genome_resources__variation__1000g;genome_resources__variation__clinvar;genome_resources__variation__cosmic;genome_resources__variation__dbsnp;genome_resources__variation__encode_blacklist;genome_resources__variation__esp;genome_resources__variation__exac;genome_resources__variation__gnomad_exome;genome_resources__variation__lcr;genome_resources__variation__polyx;genome_resources__variation__train_hapmap;genome_resources__variation__train_indels;metadata__batch;metadata__phenotype;reference__genome_context;reference__rtg;reference__snpeff__GRCh38_86;vrn_file;reference__fasta__base;align_bam;config__algorithm__variant_regions_merged;regions__sample_callable;config__algorithm__callable_regions
- sentinel_inputs=analysis:var,genome_build:var,align_bam:var,vrn_file:var,metadata__batch:var,metadata__phenotype:var,config__algorithm__callable_regions:var,regions__sample_callable:var,config__algorithm__variantcaller:var,config__algorithm__ensemble:var,config__algorithm__vcfanno:var,config__algorithm__coverage_interval:var,config__algorithm__effects:var,config__algorithm__min_allele_fraction:var,config__algorithm__exclude_regions:var,config__algorithm__variant_regions:var,config__algorithm__variant_regions_merged:var,config__algorithm__validate:var,config__algorithm__validate_regions:var,config__algorithm__tools_on:var,config__algorithm__tools_off:var,reference__fasta__base:var,reference__rtg:var,reference__genome_context:var,genome_resources__variation__clinvar:var,genome_resources__variation__cosmic:var,genome_resources__variation__dbsnp:var,genome_resources__variation__esp:var,genome_resources__variation__exac:var,genome_resources__variation__gnomad_exome:var,genome_resources__variation__1000g:var,genome_resources__variation__lcr:var,genome_resources__variation__polyx:var,genome_resources__variation__encode_blacklist:var,genome_resources__aliases__ensembl:var,genome_resources__aliases__human:var,genome_resources__aliases__snpeff:var,reference__snpeff__GRCh38_86:var,genome_resources__variation__train_hapmap:var,genome_resources__variation__train_indels:var,description:var,resources:var
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- batch_for_variantcall
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
  indirMin: 0
inputs:
- id: analysis
  type:
    items: string
    type: array
- id: genome_build
  type:
    items: string
    type: array
- id: align_bam
  secondaryFiles:
  - .bai
  type:
    items:
    - File
    - 'null'
    type: array
- id: vrn_file
  type:
    items:
    - 'null'
    - string
    type: array
- id: metadata__batch
  type:
    items:
    - 'null'
    - string
    type: array
- id: metadata__phenotype
  type:
    items: string
    type: array
- id: config__algorithm__callable_regions
  type:
    items: File
    type: array
- id: regions__sample_callable
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__variantcaller
  type:
    items:
      items: string
      type: array
    type: array
- id: config__algorithm__ensemble
  type:
    items:
    - 'null'
    - string
    type: array
- id: config__algorithm__vcfanno
  type:
    items:
      items: File
      type: array
    type: array
- id: config__algorithm__coverage_interval
  type:
    items:
    - string
    - 'null'
    type: array
- id: config__algorithm__effects
  type:
    items:
    - string
    - 'null'
    - boolean
    type: array
- id: config__algorithm__min_allele_fraction
  type:
    items: double
    type: array
- id: config__algorithm__exclude_regions
  type:
    items:
    - 'null'
    - items: 'null'
      type: array
    type: array
- id: config__algorithm__variant_regions
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__variant_regions_merged
  type:
    items:
    - File
    - 'null'
    type: array
- id: config__algorithm__validate
  type:
    items:
    - 'null'
    - string
    type: array
- id: config__algorithm__validate_regions
  type:
    items:
    - 'null'
    - string
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
- id: reference__rtg
  type:
    items: File
    type: array
- id: reference__genome_context
  type:
    items:
      items: File
      type: array
    type: array
- id: genome_resources__variation__clinvar
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__variation__cosmic
  type:
    items:
    - 'null'
    - string
    type: array
- id: genome_resources__variation__dbsnp
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__variation__esp
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__variation__exac
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__variation__gnomad_exome
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__variation__1000g
  type:
    items:
    - 'null'
    - string
    type: array
- id: genome_resources__variation__lcr
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__variation__polyx
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__variation__encode_blacklist
  type:
    items:
    - 'null'
    - string
    type: array
- id: genome_resources__aliases__ensembl
  type:
    items: string
    type: array
- id: genome_resources__aliases__human
  type:
    items:
    - string
    - 'null'
    - boolean
    type: array
- id: genome_resources__aliases__snpeff
  type:
    items: string
    type: array
- id: reference__snpeff__GRCh38_86
  type:
    items: File
    type: array
- id: genome_resources__variation__train_hapmap
  secondaryFiles:
  - .tbi
  type:
    items: File
    type: array
- id: genome_resources__variation__train_indels
  secondaryFiles:
  - .tbi
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
- id: batch_rec
  type:
    items:
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
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
