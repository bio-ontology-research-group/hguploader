cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}

hints:
  DockerRequirement:
    dockerPull: "google/deepvariant:deeptrio-1.6.0"
  ResourceRequirement:
    coresMin: 64
    ramMin: $(64 * 1024)
baseCommand: /opt/deepvariant/bin/deeptrio/run_deeptrio

inputs:
  model_type:
    type: string
    inputBinding:
      prefix: --model_type
  ref:
    type: File
    secondaryFiles:
      - .fai
    inputBinding:
      prefix: --ref
  aligned_reads:
    type: File
    secondaryFiles:
      - .crai
    inputBinding:
      prefix: --reads
  aligned_reads_parent1:
    type: File
    secondaryFiles:
      - .crai
    inputBinding:
      prefix: --reads_parent1
  aligned_reads_parent2:
    type: File
    secondaryFiles:
      - .crai
    inputBinding:
      prefix: --reads_parent2
  sample_name:
    type: string
    inputBinding:
      prefix: --sample_name_child
  sample_name_parent1:
    type: string
    inputBinding:
      prefix: --sample_name_parent1
  sample_name_parent2:
    type: string
    inputBinding:
      prefix: --sample_name_parent2
  
  output_vcf:
    type: string
    default: variants.vcf
    inputBinding:
      prefix: --output_vcf
  output_vcf_parent1:
    type: string
    default: variants_parent1.vcf
    inputBinding:
      prefix: --output_vcf_parent1
  output_vcf_parent2:
    type: string
    default: variants_parent2.vcf
    inputBinding:
      prefix: --output_vcf_parent2
  
  output_gvcf:
    type: string
    default: variants.gvcf
    inputBinding:
      prefix: --output_gvcf
  output_gvcf_parent1:
    type: string
    default: variants_parent1.gvcf
    inputBinding:
      prefix: --output_gvcf_parent1
  output_gvcf_parent2:
    type: string
    default: variants_parent2.gvcf
    inputBinding:
      prefix: --output_gvcf_parent2

  num_shards:
    type: int
    default: $(runtime.cores)
    inputBinding:
      prefix: --num_shards
  regions:
    type: File?
    inputBinding:
      prefix: --regions

outputs:
  vcf:
    type: File
    outputBinding:
      glob: $(inputs.output_vcf)
  vcf_parent1:
    type: File
    outputBinding:
      glob: $(inputs.output_vcf_parent1)
  vcf_parent2:
    type: File
    outputBinding:
      glob: $(inputs.output_vcf_parent2)
  gvcf:
    type: File
    outputBinding:
      glob: $(inputs.output_gvcf)
  gvcf_parent1:
    type: File
    outputBinding:
      glob: $(inputs.output_gvcf_parent1)
  gvcf_parent2:
    type: File
    outputBinding:
      glob: $(inputs.output_gvcf_parent2)
