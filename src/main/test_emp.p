//Sonar error
message "test_emp.p#1" 100 num-dbs.

define variable cnt as integer no-undo.
do cnt = 1 to num-dbs:
  message cnt ldbname(cnt).
end.

for each Employee no-lock:
  message Employee.EmpNum.
  // log-manager:write-message("Debug:" + string(Employee.EmpNum)).
end.

for each Employee no-lock:
    display Employee.PostalCode.
  end.
  
  for each Invoice no-lock:
      display Invoice.CustNum.
end.


message "test_emp.p#2" "DONE".