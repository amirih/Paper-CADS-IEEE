#!/bin/bash
source //opt/intel/compilers_and_libraries_2017/linux/bin/compilervars.sh -arch intel64
message="spliter"
compiler=icc
cmp="icc"
commonFlags="-D _GNU_SOURCE -qopenmp -O3 -xHOST"
novecFlags="-no-vec"
novec="scalar"
pox=.c
echo
echo $message>>fileForSpeedups
echo "Time: $(date)">>fileForSpeedups
echo $compiler>>fileForSpeedups
echo $commonFlags>>fileForSpeedups
echo $novecFlags>>fileForSpeedups
echo "*****************************************ICC*****************************************"
file="CON3"
echo
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
echo "******************************"
file="CON5"
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
echo "Out put for $file vec:"
i=1;
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
echo
echo "******************************"

