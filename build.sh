#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
pwd

echo "build h2 database with console "
docker build --force-rm -t 1000kit/h2 .


#end
