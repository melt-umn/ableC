#!/bin/bash
# GENERATED FILE, DO NOT EDIT
touch artifact/Main.sv
silver -I . -I . -I ../.. -I ../../extensions/gc -I ../../extensions/string -o ableC.jar $@ artifact
