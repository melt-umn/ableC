#!/bin/bash

# An exceedingly crude and simple mechanism to test various extensions.
# This script just calls individual testing scripts in the extendion
# directories.

pwd

cd ../extensions/conditional-tables/
./test.sh
