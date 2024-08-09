#!/bin/bash

for ((I=1; I<=$1; I++))
do
  grep Completed tpch${I}.txt | tail -n 1 | awk '{print$(NF-1)}'
done
