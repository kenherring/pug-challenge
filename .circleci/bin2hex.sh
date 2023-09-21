#!/bin/sh

(
  export LC_ALL=C
    od -An -vtx1 |
    tr -s ' \t\n' '\n\n\n' |
    grep . | 
    tr '\n' ' '
)
