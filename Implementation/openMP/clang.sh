#!/bin/bash
compiler=clang
cmp="clang"
message=" spliter"
commonFlags="-D _GNU_SOURCE -O3 -fopenmp=libgomp  -march=native"
novecFlags="-fno-vectorize -fno-slp-vectorize"
novec="scalar"
pox=.c
echo $commonFlags $novecFlags
echo $message>>fileForSpeedups
echo "Time: $(date)">>fileForSpeedups
echo $compiler >>fileForSpeedups
echo $commonFlags>>fileForSpeedups
echo $novecFlags>>fileForSpeedups
echo "*****************************************LLVM*****************************************" 
file="CON3"
echo
echo "Out put for $file no-vec:"
i=0;
$compiler $commonFlags $novecFlags   $file$i$pox -o $file$i$cmp  && ./$file$i$cmp
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
echo
echo "******************************"
file="CON5"
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
echo
file="CON7"
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
echo
file="CON9"
echo "******************************"
echo "Out put for $file no-vec:"
i=0;
$compiler $commonFlags $novecFlags   $file$i$pox -o $file$cmp && ./$file$cmp
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
i=1;
echo "******************************"
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
echo "************************************************************finsihed***************************************************************">>fileForSpeedups
echo
echo "******************************"
echo $commonFlags $novecFlags

