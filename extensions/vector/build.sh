#!/bin/bash

# Quick hack fix, since all of these compositions are named artifact.
touch artifact/Main.sv
silver -I . -I ../../../ableC -I ../string -o ableC.jar $@ artifact

