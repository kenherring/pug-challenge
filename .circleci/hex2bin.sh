#!/bin/sh

(
  export LC_ALL=C
    awk '
      BEGIN{
        for (i = 0; i < 256; i++)
          c[sprintf("%02x", i)] = sprintf("%o", i)
      }
      NR % 200 == 1 {printf "%s", end "printf '\''"; end = "'\''\n"}
      {printf "\\%s", c[$0]}
      END {print end}' |
    sh
)
