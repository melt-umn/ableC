#!/bin/bash

export ABLEC_SOURCE+=" $ABLEC_PATH/extensions/algebraic-data-types/edu.umn.cs.melt.exts.ableC.adt/**/*"
export SILVER_INCLUDES+=" -I $ABLEC_PATH/extensions/algebraic-data-types"
