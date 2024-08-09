Build the TPROC-H Container Image to create the initial database:
```
docker build -t tpch:build build/.
```

Command to run the container image to create the initial database (set your own required env variables):
```
docker run --name build --rm -e SF=30 -e TH=4 -e VU=4 -e DBHOST=192.168.5.12 -e DBPORT=1433 tpch:latest > build.txt &
```

Building the initial database will take a few hours. At SF30/TH4, the database will be approx 103GB. On the SUT, check the filesystem size:
```
du -sh *
```

Check build.txt output for any errors and check status of build container:
```
docker ps
```

Build the TPROC-H Container Image to run the test:
```
docker build -t tpch:run run/.
```

Command to run the scaled test using the number of instances:
```
./launch.sh 16
```

Command to extract results (Get the slowest Virtual User Completion time for each container):
```
./getresults 16
```
