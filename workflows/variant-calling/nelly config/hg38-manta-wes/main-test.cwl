cwlVersion: v1.1
class: Workflow
requirements:
  ResourceRequirement:
    #ramMin: $(8 * 1024)
    #coresMin: 2
    ramMin: $(1 * 1024)
    coresMin: 1
  MultipleInputFeatureRequirement: {}
  
inputs:
  ref:
    type: File
    secondaryFiles:
      - .fai
  reads1: File
  reads2: File
  model_type: string
  regions: File?
  output_cram: string?
  output_vcf: string?
  output_gvcf: string?
  slivar_gnomad: File
  # slivar_ped: File
  slivar_info: string
  vep_assembly: string
  vep_output_file: string
  pavs_custom_file: File
  pavs_custom_args: string
  go_custom_file: File
  go_custom_args: string
  hpo_custom_file: File
  hpo_custom_args: string
  ppi_custom_file: File
  ppi_custom_args: string
  vep_dir: Directory
  vep_fasta_file: File
  metadata: File
  starvar_option: string
  starvar_output_file: string
  starvar_input_files:
    type:
      type: array
      items: File
  manta_run_dir: string

outputs:
  aligned_reads:
    type: File
    outputSource: samtools_index/aligned_reads_indexed
  aligned_reads_stats:
    type: File
    outputSource: samtools_stats/stats
  output_vcf:
    type: File
    outputSource: deepvariant/vcf
  output_gvcf:
    type: File
    outputSource: deepvariant/gvcf
  output_slivar:
    type: File
    outputSource: slivar/slivar_output
  output_after_vep:
    type: File
    outputSource: vep/vep_output
  output_after_starvar:
    type: File
    outputSource: starvar/starvar_output
  output_after_manta:
    type: File
    outputSource: manta/diploidsv_vcf

steps:
  bwa-mem2:
    in:
      ref: ref
      reads1: reads1
      reads2: reads2
      output_cram: output_cram
    out: [aligned_reads]
    run: bwa-mem2.cwl
  samtools_index:
    in:
      aligned_reads: bwa-mem2/aligned_reads
    out:
      [aligned_reads_indexed]
    run: samtools-index.cwl
  manta:
    in:
      aligned_reads: [samtools_index/aligned_reads_indexed]
      ref: ref
      run_dir: manta_run_dir
    out: [diploidsv_vcf]
    run: manta.cwl
  samtools_stats:
    in:
      ref: ref
      aligned_reads: [samtools_index/aligned_reads_indexed]
    out: [stats]
    run: samtools-stats.cwl
  deepvariant:
    in:
      model_type: model_type
      ref: ref
      aligned_reads: [samtools_index/aligned_reads_indexed]
      regions: regions
      output_vcf: output_vcf
      output_gvcf: output_gvcf
    out: [vcf, gvcf]
    run: deepvariant.cwl
  slivar:
    in:
      slivar_gnomad: slivar_gnomad
      slivar_input: deepvariant/vcf
    #  slivar_ped: slivar_ped
      slivar_info: slivar_info
    out: [slivar_output]
    run: slivar.cwl
  vep:
    in:
      vep_input: [slivar/slivar_output]
      vep_assembly: vep_assembly
      vep_output_file: vep_output_file
      pavs_custom_file: pavs_custom_file
      pavs_custom_args: pavs_custom_args
      go_custom_file: go_custom_file
      go_custom_args: go_custom_args
      hpo_custom_file: hpo_custom_file
      hpo_custom_args: hpo_custom_args
      ppi_custom_file: ppi_custom_file
      ppi_custom_args: ppi_custom_args
      vep_dir: vep_dir
      vep_fasta_file: vep_fasta_file
    out: [vep_console_out, vep_output]
    run: vep.cwl
  phenofrommetadata:
    in:
      metadata: metadata
    out: [pheno_output]
    run: phenofrommetadata.cwl
  starvar:
    in:
      starvar_input: [vep/vep_output]
      starvar_option: starvar_option
      starvar_output_file: starvar_output_file
      starvar_pheno: [phenofrommetadata/pheno_output]
      starvar_input_files: starvar_input_files
    out: [starvar_output]
    run: starvar.cwl

