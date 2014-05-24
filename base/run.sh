#!/bin/bash

# directory where this script is located
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker run -i -t -v /mnt/data1:/mnt/data1:rw nihildeb/base $@
