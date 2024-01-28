cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: 'ensemblorg/ensembl-vep'
baseCommand: vep
arguments: ['--output_file', $(inputs.input_file.nameroot).vep.vcf, '--offline', '--format', 'vcf', '--vcf', '--force_overwrite'] 

inputs:
  dir:
    type: Directory
    inputBinding:
      position: 1
      prefix: '--dir'
  input_file:
    type: File
    inputBinding:
      position: 1
      prefix: '--input_file'

outputs:
  console_out: stdout
  vep_out: 
    type: File
    outputBinding:
      glob: $(inputs.input_file.nameroot).vep.vcf
