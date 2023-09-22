//Sonar error
message 100 num-dbs.

if num-dbs = 0 then
  run connect.p.

message 101 num-dbs.

define variable cnt as integer no-undo.

do cnt = 1 to num-dbs:

  message cnt ldbname(cnt).

end.

for each Employee no-lock:
  message Employee.EmpNum.
  log-manager:write-message("Debug:" + string(Employee.EmpNum)).
end.

for each Employee no-lock:
    display Employee.PostalCode.
  end.
  
  for each Invoice no-lock:
      display Invoice.CustNum.
end.


message  "DONE".