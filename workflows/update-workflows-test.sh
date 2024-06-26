#!/bin/sh
arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --update-workflow=cborg-7fd4e-pvav63r4b68v36u --name=hg38-wes-test variant-calling/main-test.cwl variant-calling/hg38-test-arvados.json
arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --update-workflow=cborg-7fd4e-pde4rl1ct1mdg0k --name=hg38-wgs-test variant-calling/main-test.cwl variant-calling/hg38-arvados-wgs-test.json

# arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --create-workflow --name=hg38-wes-test variant-calling/main-test.cwl variant-calling/hg38-test-arvados.json
# arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --create-workflow --name=hg38-wgs-test variant-calling/main-test.cwl variant-calling/hg38-arvados-wgs-test.json


# arvados-cwl-runner --project-uuid=cborg-j7d0g-2h8kdw0jwzlge9n --create-workflow --name=hg38-wes-test variant-calling/main-test.cwl variant-calling/hg38-test-arvados.json
# arvados-cwl-runner --project-uuid=cborg-j7d0g-2h8kdw0jwzlge9n --create-workflow --name=hg38-wgs-test variant-calling/main-test.cwl variant-calling/hg38-arvados-wgs-test.json


# arvados-cwl-runner --project-uuid=cborg-j7d0g-2h8kdw0jwzlge9n --update-workflow=cborg-7fd4e-gbkc0okftnu1ret --name=hg38-wes-test variant-calling/main-test.cwl variant-calling/hg38-test-arvados.json
# arvados-cwl-runner --project-uuid=cborg-j7d0g-2h8kdw0jwzlge9n --update-workflow=cborg-7fd4e-fvmh0ng6ac16pfl --name=hg38-wgs-test variant-calling/main-test.cwl variant-calling/hg38-arvados-wgs-test.json


# version info
# arvados-cwl-runner --version
# .../hguploader/.venv/bin/arvados-cwl-runner 2.7.1, arvados-python-client 2.7.1, cwltool 3.1.20230601100705
# python --version for venv
# Python 3.11.3
