#!/bin/bash

# An exceedingly crude and simple mechanism to test various extensions.
# This script just runs make test in each of the extension directories.

cd ../

cd extensions/conditional-tables/
#bash $@ ./make tests
cd ../../

cd extensions/algebraic-data-types/
bash $@ ./make tests
cd ../../

cd extensions/gc/
bash $@ ./make tests
cd ../../

cd extensions/gc-algebraic-data-types/
bash $@ ./make tests
cd ../../

cd extensions/closure/
bash $@ ./make tests
cd ../../

