#!/bin/sh
arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --update-workflow=cborg-7fd4e-slosugh4i8sogjo --name=hg38-wes variant-calling/main.cwl variant-calling/hg38-arvados.json
arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --update-workflow=cborg-7fd4e-5yqahjfcx6bjjlv --name=hg38-wgs variant-calling/main.cwl variant-calling/hg38-arvados-wgs.json

arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --create-workflow --name=hg38-wes-test variant-calling/main-test.cwl variant-calling/hg38-test-arvados.json
arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --create-workflow --name=hg38-wgs-test variant-calling/main-test.cwl variant-calling/hg38-arvados-wgs-test.json
