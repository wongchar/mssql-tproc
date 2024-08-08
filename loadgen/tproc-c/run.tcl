proc wait_vu {} {
set x 0
set timerstop 0
while {!$timerstop} {
  incr x
  after 1000
  update
  if {  [ vucomplete ] } { set timerstop 1 }
  }
return
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
print dict
vuset logtotemp 1
tcset logtotemp 1
tcset timestamps 1
tcset refreshrate 1
tcset unique 1
loadscript
vuset vu $::env(VU)
vucreate
tcstart
tcstatus
vurun
wait_vu
vudestroy
tcstop
