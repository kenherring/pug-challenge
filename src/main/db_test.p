message 100 num-dbs.
if num-dbs = 0 then
do:
  connect -db sp2k -H localhost -S 2500 no-error.
  // connect -db sp2k -H 172.17.55.11 -S 2500 no-error.
  // connect -db sp2k -H 172.17.48.1 -S 2500 no-error.
end.
message 101 num-dbs error-status:error error-status:num-messages.
if error-status:error then
  message 102 error-status:get-message(1).

quit.