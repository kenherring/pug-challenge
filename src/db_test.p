message 100 num-dbs.
connect -db sp2k -H localhost -S 2500 -nohostverify.
message 104 num-dbs error-status:error
if error-status:error then
  message error-status:get-message(1).
message "DONE".