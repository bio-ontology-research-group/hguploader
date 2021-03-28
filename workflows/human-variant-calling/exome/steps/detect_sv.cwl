$namespaces:
  arv: http://arvados.org/cwl#
  dx: https://www.dnanexus.com/cwl#
arguments:
- position: 0
  valueFrom: sentinel_runtime=cores,$(runtime['cores']),ram,$(runtime['ram'])
- sentinel_parallel=batch-single
- sentinel_outputs=sv_rec:sv__variantcaller;sv__vrn_file;sv__supplemental;svvalidate__summary;description;resources;analysis;config__algorithm__svprioritize;config__algorithm__svvalidate;config__algorithm__tools_off;config__algorithm__tools_on;genome_build;genome_resources__aliases__snpeff;genome_resources__variation__gc_profile;genome_resources__variation__germline_het_pon;regions__sample_callable;variants__samples;depth__bins__normalized;depth__bins__background;depth__bins__target;depth__bins__antitarget;depth__bins__seq2c;regions__bins__target;regions__bins__antitarget;regions__bins__gcannotated;regions__bins__group;config__algorithm__coverage_interval;config__algorithm__exclude_regions;config__algorithm__sv_regions;config__algorithm__svcaller;config__algorithm__variant_regions;genome_resources__rnaseq__gene_bed;genome_resources__variation__encode_blacklist;genome_resources__variation__lcr;genome_resources__variation__polyx;metadata__batch;metadata__phenotype;reference__fasta__base;config__algorithm__variant_regions_merged;config__algorithm__seq2c_bed_ready;depth__variant_regions__regions;config__algorithm__callable_regions
- sentinel_inputs=sv_batch_rec:record
- run_number=0
baseCommand:
- bcbio_nextgen.py
- runfn
- detect_sv
- cwl
class: CommandLineTool
cwlVersion: v1.0
hints:
- class: DockerRequirement
  dockerImageId: quay.io/bcbio/bcbio-vc
  dockerPull: quay.io/bcbio/bcbio-vc
- class: ResourceRequirement
  coresMin: 16
  outdirMin: 36747
  ramMin: 131072
  tmpdirMin: 13254
- class: dx:InputResourceRequirement
  indirMin: 5031
- class: SoftwareRequirement
  packages:
  - package: bedtools
    specs:
    - https://anaconda.org/bioconda/bedtools
  - package: cnvkit
    specs:
    - https://anaconda.org/bioconda/cnvkit
  - package: delly
    specs:
    - https://anaconda.org/bioconda/delly
  - package: duphold
    specs:
    - https://anaconda.org/bioconda/duphold
  - package: extract-sv-reads
    specs:
    - https://anaconda.org/bioconda/extract-sv-reads
  - package: gsort
    specs:
    - https://anaconda.org/bioconda/gsort
  - package: lumpy-sv;env
    specs:
    - https://anaconda.org/bioconda/lumpy-sv;env
    version:
    - python2
  - package: manta;env
    specs:
    - https://anaconda.org/bioconda/manta;env
    version:
    - python2
  - package: break-point-inspector
    specs:
    - https://anaconda.org/bioconda/break-point-inspector
  - package: mosdepth
    specs:
    - https://anaconda.org/bioconda/mosdepth
  - package: samtools
    specs:
    - https://anaconda.org/bioconda/samtools
  - package: smoove;env
    specs:
    - https://anaconda.org/bioconda/smoove;env
    version:
    - python2
  - package: pysam>
    specs:
    - https://anaconda.org/bioconda/pysam>
    version:
    - 0.13.0
  - package: seq2c
    specs:
    - https://anaconda.org/bioconda/seq2c
  - package: simple_sv_annotation;env
    specs:
    - https://anaconda.org/bioconda/simple_sv_annotation;env
    version:
    - python2
  - package: survivor
    specs:
    - https://anaconda.org/bioconda/survivor
  - package: svtools;env
    specs:
    - https://anaconda.org/bioconda/svtools;env
    version:
    - python2
  - package: svtyper;env
    specs:
    - https://anaconda.org/bioconda/svtyper;env
    version:
    - python2
  - package: r
    specs:
    - https://anaconda.org/bioconda/r
    version:
    - 3.5.1
  - package: r-base
    specs:
    - https://anaconda.org/bioconda/r-base
  - package: xorg-libxt
    specs:
    - https://anaconda.org/bioconda/xorg-libxt
  - package: vawk;env
    specs:
    - https://anaconda.org/bioconda/vawk;env
    version:
    - python2
- class: arv:RuntimeConstraints
  keep_cache: 4096
inputs:
- id: sv_batch_rec
  type:
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
outputs:
- id: sv_rec
  type:
    items:
      fields:
      - name: sv__variantcaller
        type:
        - string
        - 'null'
      - name: sv__vrn_file
        type:
        - File
        - 'null'
      - name: sv__supplemental
        type:
          items:
          - File
          type: array
      - name: svvalidate__summary
        type:
        - File
        - 'null'
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
      name: sv_rec
      type: record
    type: array
requirements:
- class: InlineJavascriptRequirement
- class: InitialWorkDirRequirement
  listing:
  - entry: $(JSON.stringify(inputs))
    entryname: cwl.inputs.json
