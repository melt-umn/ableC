#!/bin/bash
# GENERATED FILE, DO NOT EDIT
touch artifact/Main.sv
silver -I . -I . -I ../.. -I ../../extensions/string -I ../../extensions/templating -I ../../extensions/vector -o ableC.jar $@ artifact
