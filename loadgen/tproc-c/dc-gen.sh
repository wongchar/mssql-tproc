#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Usage: $0 path count"
  exit 2
fi

/bin/cat <<EOF
services:
EOF

for ((I=1; I<=$1; I++))
do
  /bin/cat <<EOF
  hammerdb${I}:
    image: tpcc:latest
    restart: "no"
    environment:
      - DBHOST=192.168.5.${I}
      - DBPORT=1433
      - WH=400
      - VU=64
EOF
done
