message 100 num-dbs.
if num-dbs = 0 then
  connect -db sp2k -H oedb -S 3500 no-error.
message 101 num-dbs error-status:error error-status:num-messages.
if error-status:error then
  message 102 error-status:get-message(1).

quit.