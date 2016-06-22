#!/bin/bash
# GENERATED FILE, DO NOT EDIT
touch artifact/Main.sv
silver -I . -I . -I ../.. -I ../../extensions/gc -I ../../extensions/closure -o ableC.jar $@ artifact
