$namespaces:
  arv: http://arvados.org/cwl#
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=batch-parallel
- sentinel_outputs=vrn_file_region,region_block
- sentinel_inputs=batch_rec:record,region_block:var
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- variantcall_batch_region
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: quay.io/bcbio/bcbio-vc
  dockerPull: quay.io/bcbio/bcbio-vc
- class: ResourceRequirement
  coresMin: 7
  outdirMin: 208516
  ramMin: 57344
  tmpdirMin: 99138
- class: dx:InputResourceRequirement
  indirMin: 30209
- class: SoftwareRequirement
  packages:
  - package: bcftools
    specs:
    - https://anaconda.org/bioconda/bcftools
  - package: bedtools
    specs:
    - https://anaconda.org/bioconda/bedtools
  - package: freebayes
    specs:
    - https://anaconda.org/bioconda/freebayes
    version:
    - 1.1.0.46
  - package: gatk4
    specs:
    - https://anaconda.org/bioconda/gatk4
  - package: vqsr_cnn
    specs:
    - https://anaconda.org/bioconda/vqsr_cnn
  - package: deepvariant;env
    specs:
    - https://anaconda.org/bioconda/deepvariant;env
    version:
    - dv
  - package: sentieon;env
    specs:
    - https://anaconda.org/bioconda/sentieon;env
    version:
    - python2
  - package: htslib
    specs:
    - https://anaconda.org/bioconda/htslib
  - package: octopus
    specs:
    - https://anaconda.org/bioconda/octopus
  - package: picard
    specs:
    - https://anaconda.org/bioconda/picard
  - package: platypus-variant;env
    specs:
    - https://anaconda.org/bioconda/platypus-variant;env
    version:
    - python2
  - package: pythonpy
    specs:
    - https://anaconda.org/bioconda/pythonpy
  - package: samtools
    specs:
    - https://anaconda.org/bioconda/samtools
  - package: pysam>
    specs:
    - https://anaconda.org/bioconda/pysam>
    version:
    - 0.13.0
  - package: strelka;env
    specs:
    - https://anaconda.org/bioconda/strelka;env
    version:
    - python2
  - package: vardict
    specs:
    - https://anaconda.org/bioconda/vardict
  - package: vardict-java
    specs:
    - https://anaconda.org/bioconda/vardict-java
  - package: varscan
    specs:
    - https://anaconda.org/bioconda/varscan
  - package: moreutils
    specs:
    - https://anaconda.org/bioconda/moreutils
  - package: vcfanno
    specs:
    - https://anaconda.org/bioconda/vcfanno
  - package: vcflib
    specs:
    - https://anaconda.org/bioconda/vcflib
  - package: vt
    specs:
    - https://anaconda.org/bioconda/vt
  - package: r
    specs:
    - https://anaconda.org/bioconda/r
    version:
    - 3.5.1
  - package: r-base
    specs:
    - https://anaconda.org/bioconda/r-base
  - package: perl
    specs:
    - https://anaconda.org/bioconda/perl
- class: arv:APIRequirement
- class: arv:RuntimeConstraints
  keep_cache: 4096
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
          items: string
          type: array
      - name: config__algorithm__tools_on
        type:
          items: string
          type: array
      - name: config__algorithm__validate
        type: File
      - name: config__algorithm__validate_regions
        type: File
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
- id: region_block_toolinput
  type:
    items: string
    type: array
outputs:
- id: vrn_file_region
  secondaryFiles:
  - .tbi
  type:
  - File
  - 'null'
- id: region_block
  type:
    items: string
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
