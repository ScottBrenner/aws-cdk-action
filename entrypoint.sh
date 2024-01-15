#!/bin/sh

set -e

if [ -f "requirements.txt" ]; then
  pip3 install -r requirements.txt
fi

git config --global --add safe.directory /github/workspace
sh -c "cdk $*"
