#!/bin/sh

set -e

if [ ! -f "requirements.txt" ]; then
  pip3 install -r requirements.txt
fi

sh -c "cdk $*"
