#!/bin/bash

echo "\$!{ N" > pin.sed
while IFS='=' read -r dname commit
do
  echo "$dname: $commit"
  echo "  s/=$dname\n\(.*\)=master/=$dname\n\1=$commit/" >> pin.sed
done <git-commit-lock.txt
echo "  P" >> pin.sed
echo "  D" >> pin.sed
echo "}" >> pin.sed
echo "\$ P" >> pin.sed

for scr in scripts/compile_*.sh; do
    echo "PIN $scr"
    mv $scr ${scr}.orig
    sed -n -f pin.sed ${scr}.orig > $scr
done
