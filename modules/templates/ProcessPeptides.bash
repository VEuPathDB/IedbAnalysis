#!/usr/bin/env bash

set -euo pipefail

CheckForGene.py -r ${refFasta} -l ${pepTab}  -e ${pepfasta} -t ${taxa}