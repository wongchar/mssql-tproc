global complete
proc wait_to_complete {} {
global complete
set complete [vucomplete]
if (!$complete) {after 5000 wait_to_complete} else { exit }
}

dbset db mssqls
dbset bm TPROC-C
diset connection mssqls_linux_server $::env(DBHOST)
diset connection mssqls_tcp true
diset connection mssqls_port $::env(DBPORT)
diset connection mssqls_uid sa
diset connection mssqls_pass Amd1234!!!!
diset connection mssqls_linux_odbc {ODBC Driver 18 for SQL Server}
diset connection mssqls_trust_server_cert true
diset tpcc mssqls_count_ware $::env(WH)
diset tpcc mssqls_num_vu $::env(VU)
diset tpcc mssqls_dbase tpcc
diset tpcc mssqls_driver timed
print dict
buildschema
wait_to_complete
