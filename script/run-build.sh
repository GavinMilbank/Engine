#!/bin/bash
export STAGE=test
export STACK=pipeline
export ROLE=${ROLE:-""}
export IS_PULL=${IS_PULL:-""}
set -exvuo pipefail
VERSION_LABEL=latest ./script/run.sh --dev ./docker.osr.dockerfile bash # compile.sh
