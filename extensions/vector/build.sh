#!/bin/bash
# GENERATED FILE, DO NOT EDIT
touch artifact/Main.sv
silver -I . -I . -I ../.. -I ../../extensions/gc -I ../../extensions/string -I ../../extensions/vector -o ableC.jar $@ artifact
