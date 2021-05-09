#!/bin/bash
message="spliter"
compiler=gcc
cmp="gcc"
commonFlags="-D _GNU_SOURCE -O3 -fopenmp -march=native"
novecFlags="-fno-tree-vectorize -fno-tree-slp-vectorize"
novec="scalar"
pox=.c
echo
echo $message>>fileForSpeedups
echo "Time: $(date)">>fileForSpeedups
echo $compiler >>fileForSpeedups
echo $commonFlags>>fileForSpeedups
echo $novecFlags>>fileForSpeedups
echo "*****************************************GCC*****************************************" 
file="CON3"
echo
echo "Out put for $file no-vec:"
i=0;
$compiler $commonFlags $novecFlags   $file$i$pox -o $file$i$cmp&& ./$file$i$cmp
echo
i=1;
echo "******************************"
echo "Out put for $file vec:"
$compiler $commonFlags $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
echo "******************************"
i=2
echo "Out put for $file AVX2:"
$compiler $commonFlags $novecFlags $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
echo "******************************"
file="CON5"
echo "******************************"
echo "Out put for $file no-vec:"
i=0;
$compiler $commonFlags $novecFlags   $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
i=1;
echo "******************************"
echo "Out put for $file vec:"
$compiler $commonFlags $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
echo "******************************"
i=2
echo "Out put for $file AVX2:"
$compiler $commonFlags $novecFlags $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
file="CON7"
echo "******************************"
echo "Out put for $file no-vec:"
i=0;
$compiler $commonFlags $novecFlags   $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
echo "******************************"
echo "Out put for $file vec:"
i=1;
$compiler $commonFlags $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
echo "******************************"
i=2
echo "Out put for $file AVX2:"
$compiler $commonFlags $novecFlags $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
file="CON9"
echo "******************************"
echo "Out put for $file no-vec:"
i=0;
$compiler $commonFlags $novecFlags   $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
echo "******************************"
i=1;
echo "Out put for $file vec:"
$compiler $commonFlags $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
echo "******************************"
i=2
echo "Out put for $file AVX2:"
$compiler $commonFlags $novecFlags $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo "******************************"
file="CONu7"
i=0
echo
echo "Out put for $file no-vec:"
$compiler $commonFlags $novecFlags   $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
echo "******************************"
i=1;
echo "Out put for $file vec:"
$compiler $commonFlags $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
echo "******************************"
file="CONu9"
echo "******************************"
echo "Out put for $file no-vec:"
i=0;
$compiler $commonFlags $novecFlags   $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
echo "******************************"
i=1;
echo "Out put for $file vec:"
$compiler $commonFlags $file$i$pox -o $file$i$cmp && ./$file$i$cmp
echo
echo "******************************"

