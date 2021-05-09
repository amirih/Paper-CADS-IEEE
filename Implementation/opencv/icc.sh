#!/bin/bash
source //opt/intel/compilers_and_libraries_2017/linux/bin/compilervars.sh -arch intel64
message="spliter"
compiler=icpc
cmp="icc"
commonFlags="-D _GNU_SOURCE -O3 -xHOST"
novecFlags="-lopencv_core -lopencv_imgproc -lopencv_highgui  "

pox=.cpp
echo
echo $message>>fileForSpeedups
echo "Time: $(date)">>fileForSpeedups
echo $compiler >>fileForSpeedups
echo $commonFlags>>fileForSpeedups
echo $novecFlags>>fileForSpeedups

echo "*****************************************ICPC*****************************************" 
file="opencv3"
echo
echo "Out put for $file:"
$compiler $commonFlags $novecFlags   $file$pox -o $file$cmp && ./$file$cmp

file="opencv5"
echo "******************************"
echo "Out put for $file"
$compiler $commonFlags $novecFlags   $file$pox -o $file$cmp && ./$file$cmp
echo
file="opencv7"
echo "******************************"
echo "Out put for $file"
$compiler $commonFlags $novecFlags   $file$pox -o $file$cmp && ./$file$cmp
echo
file="opencv9"
echo "******************************"
echo "Out put for $file"
$compiler $commonFlags $novecFlags   $file$pox -o $file$cmp && ./$file$cmp
echo
