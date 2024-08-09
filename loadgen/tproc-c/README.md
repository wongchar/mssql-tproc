Build TPROC-C Container Image to create the initial database:
```
docker build -t tpcc .
```

Run the container in interactive mode:
```
docker run -it --rm tpcc bash
```

Inside the container, set the required variables:
```
export DBHOST=192.168.5.11
export DBPORT=1433
export WH=400
export VU=64
```

Run the script to build the initial database:
```
./hammerdbcli
```
```
source build.tcl
```

