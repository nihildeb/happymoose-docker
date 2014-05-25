#!/bin/bash

# directory where this script is located
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker run -i -t -p 22 -v /mnt/base:/mnt/base:rw --name base nihildeb/base $@
