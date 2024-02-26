#!/bin/sh
arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --update-workflow=cborg-7fd4e-pvav63r4b68v36u --name=hg38-wes-test variant-calling/main-test.cwl variant-calling/hg38-test-arvados.json
arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --update-workflow=cborg-7fd4e-pde4rl1ct1mdg0k --name=hg38-wgs-test variant-calling/main-test.cwl variant-calling/hg38-arvados-wgs-test.json

# arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --create-workflow --name=hg38-wes-test variant-calling/main-test.cwl variant-calling/hg38-test-arvados.json
# arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --create-workflow --name=hg38-wgs-test variant-calling/main-test.cwl variant-calling/hg38-arvados-wgs-test.json
