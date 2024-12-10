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
dbset bm TPROC-H
diset connection mssqls_linux_server $::env(DBHOST)
diset connection mssqls_tcp true
diset connection mssqls_port $::env(DBPORT)
diset connection mssqls_uid sa
diset connection mssqls_pass Amd1234!!!!
diset connection mssqls_linux_odbc {ODBC Driver 18 for SQL Server}
diset connection mssqls_trust_server_cert true
diset tpch mssqls_scale_fact $::env(SF)
diset tpch mssqls_num_tpch_threads $::env(TH)
diset tpch mssqls_refresh_on 0
diset tpch mssqls_trickle_refresh 1
diset tpch mssqls_total_querysets 1
diset tpch mssqls_update_sets 1
print dict
vuset logtotemp 1
loadscript
vuset vu $::env(VU)
vurun
wait_vu
vudestroy
