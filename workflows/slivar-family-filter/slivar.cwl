cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["sh","sliver.sh"]
inputs:
  path_data:
    type: Directory
    doc: |
      string(s): list files in a directory.
    inputBinding:
      position: 1
  vcf_file:
    type: File
  ped_file:
    type: File
  fasta_file:
    type: File
  gff_file:
    type: File 
  gnomad_file:
    type: File
  js_file:
    type: File
  output_file:
    type: string
outputs:
  console_out: stdout
  anno_file_out: 
    type: File
    outputBinding:
      glob: $(inputs.output_file)
arguments:
  - valueFrom: $(inputs.path_data)
  - valueFrom: $(inputs.vcf_file)
  - valueFrom: $(inputs.ped_file)
  - valueFrom: $(inputs.fasta_file)
  - valueFrom: $(inputs.gff_file)
  - valueFrom: $(inputs.gnomad_file)
  - valueFrom: $(inputs.js_file)
  - valueFrom: $(inputs.output_file)
requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: sliver.sh
        entry: |-
          bcftools csq -s - --ncsq 40 -g $(inputs.path_data.path)'/'$(inputs.gff_file.basename) -l -f $(inputs.path_data.path)'/'$(inputs.fasta_file.basename) $(inputs.path_data.path)'/'$(inputs.vcf_file.basename) -o vcf_annot.vcf
           /encrypted/e3008/Senay/national_guard/slivar expr --vcf vcf_annot.vcf --ped $(inputs.path_data.path)'/'$(inputs.ped_file.basename)  -o $(inputs.output_file) -g $(inputs.path_data.path)'/'$(inputs.gnomad_file.basename) --js $(inputs.path_data.path)'/'$(inputs.js_file.basename) --info 'INFO.impactful && INFO.gnomad_popmax_af < 0.01 && variant.FILTER == "PASS" && variant.ALT[0] != "*"' --family-expr 'recessive:fam.every(segregating_recessive)' --family-expr 'comphet_side:comphet_side && INFO.gnomad_nhomalt < 20' 