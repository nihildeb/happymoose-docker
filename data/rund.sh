#!/bin/bash

# directory where this script is located
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker run -d --name DATA1 -v /mnt/data1:/mnt/data1:rw nihildeb/data
