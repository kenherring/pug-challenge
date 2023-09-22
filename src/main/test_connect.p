message "test-connect.p#1" 100 num-dbs.

connect -db target/db/sp2k/sp2k.db -RO.
connect -db sp2k -H localhost -S 2500.

message "test-connect.p#2" 101 num-dbs.