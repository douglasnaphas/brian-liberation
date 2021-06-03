#!/usr/bin/env bash
set -e
source scripts/var-check.sh

: ${GITHUB_REF:=refs/heads/$(git rev-parse --abbrev-ref HEAD)}
# stackname fails with an explanation if GITHUB_REPOSITORY or GITHUB_REF aren't
# set
echo ${GITHUB_REF}
STACKNAME=$(GITHUB_REF=${GITHUB_REF} npx @cdk-turnkey/stackname@1.2.0 --suffix webapp)
GITHUB_REF=${GITHUB_REF} npx cdk deploy ${STACKNAME}
