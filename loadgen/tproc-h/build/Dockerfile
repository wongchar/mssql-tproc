FROM hammerdb
COPY build.tcl .

ENV TMP=\/tmp
ENV TERM=xterm
ENV SHLVL=1
ENV LD_LIBRARY_PATH=/home/instantclient_21_5/::/usr/local/unixODBC/lib
ENV ORACLE_LIBRARY=/home/instantclient_21_5/libclntsh.so

ENV PATH="$PATH:/opt/mssql-tools18/bin"
ENV PATH="$PATH:/opt/mssql-tools18/bin:/usr/local/unixODBC/bin"
ENV ODBCINI="/usr/local/unixODBC/etc/odbc.ini"
ENV ODBCSYSINI="/usr/local/unixODBC/etc"
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/unixODBC/lib"
ENV LD_LIBRARY_PATH=/home/instantclient_21_5/:$LD_LIBRARY_PATH

WORKDIR /home/HammerDB-4.11

CMD ./hammerdbcli auto build.tcl
