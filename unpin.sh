#/bin/bash

for scr in scripts/compile_*.sh; do
    rm $scr
    mv ${scr}.orig $scr
done
