#!/bin/bash
message="spliter"
compiler=g++
cmp="gcc"
commonFlags="-D _GNU_SOURCE -O3 -march=native"
novecFlags="-lopencv_core -lopencv_imgproc -lopencv_highgui  "

pox=.cpp
echo
echo $message>>fileForSpeedups
echo "Time: $(date)">>fileForSpeedups
echo $compiler >>fileForSpeedups
echo $commonFlags>>fileForSpeedups
echo $novecFlags>>fileForSpeedups

echo "*****************************************GCC*****************************************" 
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
