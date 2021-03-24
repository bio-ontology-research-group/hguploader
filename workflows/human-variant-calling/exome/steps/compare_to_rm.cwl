$namespaces:
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=batch-single
- sentinel_outputs=vc_rec:batch_samples;validate__summary;validate__tp;validate__fp;validate__fn;description;resources;vrn_file;config__algorithm__variantcaller_order;analysis;config__algorithm__coverage_interval;config__algorithm__effects;config__algorithm__ensemble;config__algorithm__exclude_regions;config__algorithm__min_allele_fraction;config__algorithm__tools_off;config__algorithm__tools_on;config__algorithm__validate;config__algorithm__validate_regions;config__algorithm__variant_regions;config__algorithm__variantcaller;config__algorithm__vcfanno;genome_build;genome_resources__aliases__ensembl;genome_resources__aliases__human;genome_resources__aliases__snpeff;metadata__batch;metadata__phenotype;reference__genome_context;reference__rtg;reference__snpeff__GRCh38_86;reference__fasta__base;config__algorithm__variant_regions_merged;regions__sample_callable;config__algorithm__callable_regions
- sentinel_inputs=batch_rec:record,vrn_file:var
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- compare_to_rm
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: quay.io/bcbio/bcbio-vc
  dockerPull: quay.io/bcbio/bcbio-vc
- class: ResourceRequirement
  coresMin: 8
  outdirMin: 30120
  ramMin: 32768
  tmpdirMin: 9940
- class: dx:InputResourceRequirement
  indirMin: 30240
- class: SoftwareRequirement
  packages:
  - package: bcftools
    specs:
    - https://anaconda.org/bioconda/bcftools
  - package: bedtools
    specs:
    - https://anaconda.org/bioconda/bedtools
  - package: pythonpy
    specs:
    - https://anaconda.org/bioconda/pythonpy
  - package: gvcf-regions;env
    specs:
    - https://anaconda.org/bioconda/gvcf-regions;env
    version:
    - python2
  - package: htslib
    specs:
    - https://anaconda.org/bioconda/htslib
  - package: rtg-tools
    specs:
    - https://anaconda.org/bioconda/rtg-tools
  - package: vcfanno
    specs:
    - https://anaconda.org/bioconda/vcfanno
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
        type: string
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
        type: string
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
- id: vrn_file
  secondaryFiles:
  - .tbi
  type: File
outputs:
- id: vc_rec
  type:
    items:
      fields:
      - name: batch_samples
        type:
        - 'null'
        - items: string
          type: array
      - name: validate__summary
        type:
        - File
        - 'null'
      - name: validate__tp
        type:
        - File
        - 'null'
      - name: validate__fp
        type:
        - File
        - 'null'
      - name: validate__fn
        type:
        - File
        - 'null'
      - name: description
        type: string
      - name: resources
        type: string
      - name: vrn_file
        type: File
      - name: config__algorithm__variantcaller_order
        type: int
      - name: analysis
        type: string
      - name: config__algorithm__coverage_interval
        type:
        - string
        - 'null'
      - name: config__algorithm__effects
        type: string
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
      - name: metadata__batch
        type: string
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
      - name: reference__fasta__base
        type: File
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
      name: vc_rec
      type: record
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
