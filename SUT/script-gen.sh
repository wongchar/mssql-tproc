#!/bin/bash

if [ $# -ne 3 ]
then
  echo "Usage: $0 path count"
  exit 2
fi

PATH=$1

for ((I=$2; I<=$3; I++))
do
  /bin/cat <<EOF
---
apiVersion: "k8s.cni.cncf.io/v1"
kind: NetworkAttachmentDefinition
metadata:
  name: comm${I}
spec:
  config: '{
          "cniVersion": "0.4.0",
          "plugins": [
            {
              "type": "macvlan",
              "capabilities": { "ips": true },
              "master": "ens2f0np0",
              "mode": "bridge",
              "ipam": {
                "type": "static",
                "addresses": [
                  {
                    "address": "192.168.5.${I}/24"
                  }
                ]
              }
            }
          ]    
  }'
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tpc-db${I}
  labels:
    app: tpc-db${I}
spec:
  replicas: 1
  selector:
    matchLabels:
      app: tpc-db${I}
  template:
    metadata:
      annotations:
        k8s.v1.cni.cncf.io/networks: comm${I}
      labels:
        app: tpc-db${I}
    spec:
      securityContext:
        fsGroup: 10001
      containers:
      - name: tpc-db${I}
        image: mcr.microsoft.com/mssql/server:2022-latest
        resources:
          limits:
            cpu: 8
            memory: 24Gi
          requests:
            cpu: 8
            memory: 24Gi
        ports:
        - containerPort: 1433
        env:
        env:
          - name: ACCEPT_EULA
            value: "Y"
          - name: MSSQL_ENABLE_HADR
            value: "1"
          - name: MSSQL_AGENT_ENABLED
            value: "1"
          - name: MSSQL_SA_PASSWORD
            value: "Amd1234!!!!"
          - name: MSSQL_MEMORY_LIMIT_MB
            value: "20480"
        volumeMounts:
          - name: mssql${I}
            mountPath: /var/opt/mssql
      restartPolicy: Always
      volumes:
        - name: mssql${I}
          hostPath:
            path: /$PATH/db${I}
EOF
done
