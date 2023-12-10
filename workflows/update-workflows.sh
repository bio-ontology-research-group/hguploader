#!/bin/sh
arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --update-workflow=cborg-7fd4e-lfmtz87e7rhkqgm --name=ksa001-wes variant-calling/main.cwl variant-calling/ksa001-arvados.json
arvados-cwl-runner --project-uuid=cborg-j7d0g-8ekhzjdr669q81j --update-workflow=cborg-7fd4e-62dvvpjfgfpfqne --name=ksa001-wgs variant-calling/main.cwl variant-calling/ksa001-arvados-wgs.json
