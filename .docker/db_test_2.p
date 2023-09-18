message 100 num-dbs ldbname(1).

if num-dbs > 0 then
do:
  message "WARNING: database already connected (" ldbname(1) ").  disconnecting...".
  disconnect value(ldbname(1)).
end.

message 101 num-dbs string(time,"HH:MM:SS").

// connect value("-db sp2k -H oedb -S 5000 -ld oedb").
// connect value("-db sp2k -H localhost -S 5000") no-error.
// connect value("-db target/db/sp2k/sp2k -H localhost -S 5000") no-error.
message 102 error-status:error num-dbs.
message 103.
connect -db sp2k -S 2500.
// connect value("-db sp2k -H docker-desktop -S 5000").
message 104.
message 105 error-status:error num-dbs error-status:get-message(1).

message "DONE".