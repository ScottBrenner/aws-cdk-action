#!/bin/sh

set -e

pip3 install -r requirements.txt

sh -c "cdk $*"
