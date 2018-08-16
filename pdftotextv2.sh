#!/bin/bash

pdf=$1
pdf=${pdf:?'no suministrado'}
nom=$(basename $pdf)
nom=${nom%.*}
#for ((i=1;i<=`strings $pdf | grep Count | awk '{print $NF}'`;i++))
for ((i=1;i<=`strings $pdf | grep Count | tail -1  | sed -n 's/^.*Count\s\+\([0-9]\+\).*$/\1/p'`;i++))
  do pdftotext -f $i -l $i $pdf ${nom}_p${i}.txt
done
