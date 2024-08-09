Build the TPROC-H Container Image to create the initial database:
```
docker build -t tpch:build build/.
```

Command to run the container image to create the initial database (set your own required env variables):
```
docker run --name build --rm -e SF=30 -e TH=4 -e VU=4 -e DBHOST=192.168.5.12 -e DBPORT=1433 tpch:latest > build.txt &
```

Check build.txt output for any errors and check status of build container:
```
docker ps
```
