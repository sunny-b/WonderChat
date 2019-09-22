#!/bin/bash

set -e -u -x

echo "Running tests"

mv dependency-cache/node_modules source_code

cd source_code

npm test

echo "Finished running tests"
