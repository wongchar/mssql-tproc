FROM hammerdb
COPY build.tcl .
COPY run.tcl .
ENV TMP=\/tmp
ENV ODBCINI=/usr/local/unixODBC/etc/odbc.ini
ENV TERM=xterm
ENV SHLVL=1
ENV LD_LIBRARY_PATH=/home/instantclient_21_5/::/usr/local/unixODBC/lib
ENV ORACLE_LIBRARY=/home/instantclient_21_5/libclntsh.so
ENV ODBCSYSINI=/usr/local/unixODBC/etc
WORKDIR /home/HammerDB-4.11

CMD ./hammerdbcli auto run.tcl
