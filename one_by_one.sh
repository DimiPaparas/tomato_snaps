#!/bin/sh

message_base="auto-commit from $USER@$(hostname -s) on $(date)"
GIT=`which git`
REPO_DIR=~/Tomato/tomato_snaps
cd ${REPO_DIR}

# Get a list of untracked files
untracked_files=$(${GIT} ls-files --others --exclude-standard)

# Iterate over each untracked file, add, commit, and push
for file in $untracked_files; 
do
    ${GIT} add "$file"
    message="$message_base: added $file"
    echo "$message_base: added $file"
    ${GIT} commit -m "$message"
    ${GIT} push
done

