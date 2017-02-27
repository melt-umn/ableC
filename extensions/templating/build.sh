#!/bin/bash
# GENERATED FILE, DO NOT EDIT
touch artifact/Main.sv
silver -I . -I . -I ../.. -I ../../extensions/templating -o ableC.jar $@ artifact
