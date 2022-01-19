class: Workflow
cwlVersion: v1.0
hints: []
inputs:
- id: analysis
  type:
    items: string
    type: array
- id: config__algorithm__adapters
  type:
    items:
    - 'null'
    - items: 'null'
      type: array
    type: array
- id: config__algorithm__align_split_size
  type:
    items:
    - 'null'
    - string
    type: array
- id: config__algorithm__aligner
  type:
    items: string
    type: array
- id: config__algorithm__archive
  type:
    items:
    - 'null'
    - string
    type: array
- id: config__algorithm__bam_clean
  type:
    items:
    - string
    - 'null'
    - boolean
    type: array
- id: config__algorithm__coverage_interval
  type:
    items:
    - 'null'
    - string
    type: array
- id: config__algorithm__effects
  type:
    items: string
    type: array
- id: config__algorithm__ensemble
  type:
    items:
    - 'null'
    - string
    type: array
- id: config__algorithm__exclude_regions
  type:
    items:
    - 'null'
    - items: 'null'
      type: array
    type: array
- id: config__algorithm__mark_duplicates
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
- id: config__algorithm__nomap_split_size
  type:
    items: long
    type: array
- id: config__algorithm__nomap_split_targets
  type:
    items: long
    type: array
- id: config__algorithm__qc
  type:
    items:
      items: string
      type: array
    type: array
- id: config__algorithm__recalibrate
  type:
    items:
    - string
    - 'null'
    - boolean
    type: array
- id: config__algorithm__sv_regions
  type:
    items: File
    type: array
- id: config__algorithm__svcaller
  type:
    items:
      items: string
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
- id: config__algorithm__tools_off
  type:
    items:
    - 'null'
    - items: 'null'
      type: array
    type: array
- id: config__algorithm__tools_on
  type:
    items:
      items: string
      type: array
    type: array
- id: config__algorithm__trim_reads
  type:
    items:
    - string
    - 'null'
    - boolean
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
- id: config__algorithm__variant_regions
  type:
    items: File
    type: array
- id: config__algorithm__variantcaller
  type:
    items:
      items: string
      type: array
    type: array
- id: config__algorithm__vcfanno
  type:
    items:
      items: File
      type: array
    type: array
- id: description
  type:
    items: string
    type: array
- id: files
  type:
    items:
      items: File
      type: array
    type: array
- id: genome_build
  type:
    items: string
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
- id: genome_resources__rnaseq__gene_bed
  type:
    items: File
    type: array
- id: genome_resources__variation__1000g
  type:
    items:
    - 'null'
    - string
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
- id: genome_resources__variation__encode_blacklist
  type:
    items:
    - 'null'
    - string
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
- id: genome_resources__variation__gnomad_exome
  secondaryFiles:
  - .tbi
  type:
    items: File
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
- id: metadata__batch
  type:
    items: string
    type: array
- id: metadata__phenotype
  type:
    items: string
    type: array
- id: reference__bwa__indexes
  secondaryFiles:
  - ^.amb
  - ^.ann
  - ^.bwt
  - ^.pac
  - ^.sa
  type:
    items: File
    type: array
- id: reference__genome_context
  type:
    items:
      items: File
      type: array
    type: array
- id: reference__rtg
  type:
    items: File
    type: array
- id: reference__snpeff__GRCh38_86
  type:
    items: File
    type: array
- id: reference__versions
  type:
    items: File
    type: array
- id: resources
  type:
    items: string
    type: array
- id: rgnames__lane
  type:
    items: string
    type: array
- id: rgnames__lb
  type:
    items:
    - 'null'
    - string
    type: array
- id: rgnames__pl
  type:
    items: string
    type: array
- id: rgnames__pu
  type:
    items: string
    type: array
- id: rgnames__rg
  type:
    items: string
    type: array
- id: rgnames__sample
  type:
    items: string
    type: array
- id: vrn_file
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
outputs:
- id: rgnames__sample_out
  outputSource: main_exome/rgnames__sample
  type:
    items: string
    type: array
- id: align_bam
  outputSource: main_exome/align_bam
  type:
    items:
    - File
    - 'null'
    type: array
- id: regions__sample_callable
  outputSource: main_exome/regions__sample_callable
  type:
    items:
    - File
    - 'null'
    type: array
- id: validate__grading_summary
  outputSource: main_exome/validate__grading_summary
  type:
    items:
    - File
    - 'null'
    type: array
- id: variants__calls
  outputSource: main_exome/variants__calls
  type:
    items:
      items:
      - File
      - 'null'
      type: array
    type: array
- id: variants__gvcf
  outputSource: main_exome/variants__gvcf
  type:
    items:
    - 'null'
    - items:
      - File
      - 'null'
      type: array
    type: array
- id: sv__calls
  outputSource: main_exome/sv__calls
  type:
    items:
      items:
      - File
      - 'null'
      type: array
    type: array
- id: svvalidate__grading_summary
  outputSource: main_exome/svvalidate__grading_summary
  type:
    items:
    - File
    - 'null'
    type: array
- id: sv__prioritize__tsv
  outputSource: main_exome/sv__prioritize__tsv
  type:
    items:
      items:
      - File
      - 'null'
      type: array
    type: array
- id: sv__prioritize__raw
  outputSource: main_exome/sv__prioritize__raw
  type:
    items:
      items:
      - File
      - 'null'
      type: array
    type: array
- id: sv__supplemental
  outputSource: main_exome/sv__supplemental
  type:
    items:
      items:
      - File
      type: array
    type: array
- id: summary__multiqc
  outputSource: main_exome/summary__multiqc
  type:
    items:
    - File
    - 'null'
    type: array
- id: versions__tools
  outputSource: main_exome/versions__tools
  type:
    items:
    - File
    - 'null'
    type: array
- id: versions__data
  outputSource: main_exome/versions__data
  type:
    items:
    - File
    - 'null'
    type: array
requirements:
- class: EnvVarRequirement
  envDef:
  - envName: MPLCONFIGDIR
    envValue: .
- class: ScatterFeatureRequirement
- class: SubworkflowFeatureRequirement
steps:
- id: main_exome
  in:
  - id: analysis
    source: analysis
  - id: config__algorithm__adapters
    source: config__algorithm__adapters
  - id: config__algorithm__align_split_size
    source: config__algorithm__align_split_size
  - id: config__algorithm__aligner
    source: config__algorithm__aligner
  - id: config__algorithm__archive
    source: config__algorithm__archive
  - id: config__algorithm__bam_clean
    source: config__algorithm__bam_clean
  - id: config__algorithm__coverage_interval
    source: config__algorithm__coverage_interval
  - id: config__algorithm__effects
    source: config__algorithm__effects
  - id: config__algorithm__ensemble
    source: config__algorithm__ensemble
  - id: config__algorithm__exclude_regions
    source: config__algorithm__exclude_regions
  - id: config__algorithm__mark_duplicates
    source: config__algorithm__mark_duplicates
  - id: config__algorithm__min_allele_fraction
    source: config__algorithm__min_allele_fraction
  - id: config__algorithm__nomap_split_size
    source: config__algorithm__nomap_split_size
  - id: config__algorithm__nomap_split_targets
    source: config__algorithm__nomap_split_targets
  - id: config__algorithm__qc
    source: config__algorithm__qc
  - id: config__algorithm__recalibrate
    source: config__algorithm__recalibrate
  - id: config__algorithm__sv_regions
    source: config__algorithm__sv_regions
  - id: config__algorithm__svcaller
    source: config__algorithm__svcaller
  - id: config__algorithm__svprioritize
    source: config__algorithm__svprioritize
  - id: config__algorithm__svvalidate
    source: config__algorithm__svvalidate
  - id: config__algorithm__tools_off
    source: config__algorithm__tools_off
  - id: config__algorithm__tools_on
    source: config__algorithm__tools_on
  - id: config__algorithm__trim_reads
    source: config__algorithm__trim_reads
  - id: config__algorithm__validate
    source: config__algorithm__validate
  - id: config__algorithm__validate_regions
    source: config__algorithm__validate_regions
  - id: config__algorithm__variant_regions
    source: config__algorithm__variant_regions
  - id: config__algorithm__variantcaller
    source: config__algorithm__variantcaller
  - id: config__algorithm__vcfanno
    source: config__algorithm__vcfanno
  - id: description
    source: description
  - id: files
    source: files
  - id: genome_build
    source: genome_build
  - id: genome_resources__aliases__ensembl
    source: genome_resources__aliases__ensembl
  - id: genome_resources__aliases__human
    source: genome_resources__aliases__human
  - id: genome_resources__aliases__snpeff
    source: genome_resources__aliases__snpeff
  - id: genome_resources__rnaseq__gene_bed
    source: genome_resources__rnaseq__gene_bed
  - id: genome_resources__variation__1000g
    source: genome_resources__variation__1000g
  - id: genome_resources__variation__clinvar
    source: genome_resources__variation__clinvar
  - id: genome_resources__variation__cosmic
    source: genome_resources__variation__cosmic
  - id: genome_resources__variation__dbsnp
    source: genome_resources__variation__dbsnp
  - id: genome_resources__variation__encode_blacklist
    source: genome_resources__variation__encode_blacklist
  - id: genome_resources__variation__esp
    source: genome_resources__variation__esp
  - id: genome_resources__variation__exac
    source: genome_resources__variation__exac
  - id: genome_resources__variation__gc_profile
    source: genome_resources__variation__gc_profile
  - id: genome_resources__variation__germline_het_pon
    source: genome_resources__variation__germline_het_pon
  - id: genome_resources__variation__gnomad_exome
    source: genome_resources__variation__gnomad_exome
  - id: genome_resources__variation__lcr
    source: genome_resources__variation__lcr
  - id: genome_resources__variation__polyx
    source: genome_resources__variation__polyx
  - id: genome_resources__variation__train_hapmap
    source: genome_resources__variation__train_hapmap
  - id: genome_resources__variation__train_indels
    source: genome_resources__variation__train_indels
  - id: metadata__batch
    source: metadata__batch
  - id: metadata__phenotype
    source: metadata__phenotype
  - id: reference__bwa__indexes
    source: reference__bwa__indexes
  - id: reference__genome_context
    source: reference__genome_context
  - id: reference__rtg
    source: reference__rtg
  - id: reference__snpeff__GRCh38_86
    source: reference__snpeff__GRCh38_86
  - id: reference__versions
    source: reference__versions
  - id: resources
    source: resources
  - id: rgnames__lane
    source: rgnames__lane
  - id: rgnames__lb
    source: rgnames__lb
  - id: rgnames__pl
    source: rgnames__pl
  - id: rgnames__pu
    source: rgnames__pu
  - id: rgnames__rg
    source: rgnames__rg
  - id: rgnames__sample
    source: rgnames__sample
  - id: vrn_file
    source: vrn_file
  - id: reference__fasta__base
    source: reference__fasta__base
  out:
  - id: rgnames__sample_out
  - id: align_bam
  - id: regions__sample_callable
  - id: validate__grading_summary
  - id: variants__calls
  - id: variants__gvcf
  - id: sv__calls
  - id: svvalidate__grading_summary
  - id: sv__prioritize__tsv
  - id: sv__prioritize__raw
  - id: sv__supplemental
  - id: summary__multiqc
  - id: versions__tools
  - id: versions__data
  run: main-exome-call.cwl
- id: deepsvp
  in:
  - id:
    source:
  out:
  - id:
  run: deepsvp.cwl
