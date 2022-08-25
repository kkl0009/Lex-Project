#!/bin/bash

lex KollinLabowskiIndex.l

echo "Compiled KollinLabowskiIndex.l"

gcc lex.yy.c -o flexAssign.out

echo "Compiled lex.yy.c as \"flexAssign.out\""

./flexAssign.out < KollinLabowskitext

echo "Generated index01.csv file"

cat index01.csv | sort -k1,1 -k2,2n -k3,3n > indexsorted.csv

echo "Generated indexsorted.csv file"

echo "DONE"
