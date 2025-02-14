#!/bin/sh

message="auto-commit from $USER@$(hostname -s) on $(date)"
GIT=`which git`
REPO_DIR=~/Tomato/tomato_snaps
cd ${REPO_DIR}
${GIT} add --all .
${GIT} commit -m "$message"
${GIT} push
