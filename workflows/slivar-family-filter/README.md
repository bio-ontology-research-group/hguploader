## slivar: filter/annotate variants in VCF format

To run the workflow, please follow the steps below:

1. Install the requered tools: [bcftools](https://samtools.github.io/bcftools/howtos/index.html), [vcftool](http://vcftools.sourceforge.net/), [slivar](https://github.com/brentp/slivar).

2. Download the required input files to run [slivar](https://github.com/brentp/slivar) from [Gnotation Files](https://github.com/brentp/slivar#gnotation-files)

3. Prepare the inplut files as shown in the example yaml file [slivar.yaml](https://raw.githubusercontent.com/bio-ontology-research-group/hguploader/master/workflows/slivar-family-filter/slivar.yam)

4. run the workflow as follows:
	```
	cwl-runner slivar.cwl slivar.yaml 
	```