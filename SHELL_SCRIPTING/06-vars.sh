#!/bin/bash

## Dynamic variable can be get in two ways.
# 1) Running Commands
# 2) Arithemtic Operation

DATE=$(date +%F)

echo Today date is $DATE

ADD=$((2+2))
echo ADD = $ADD 