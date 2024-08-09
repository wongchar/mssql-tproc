#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Usage: $0 path count"
  exit 2
fi

IMG=tpch:latest
DBPORT=1433
SF=30
TH=4

CMD="./hammerdbcli auto thruput.tcl"

for ((I=1; I<=$1; I++))
do
        DBHOST=192.168.5.${I}
        OPTS="-e SF=${SF} -e TH=${TH} -e DBHOST=${DBHOST} -e DBPORT=${DBPORT}"
        NAME=tpch${I}
        LOG=${NAME}.txt
        docker run --name ${NAME} --rm ${OPTS} ${IMG} ${CMD} > ${LOG} &
done
