

define variable vPersonNum as integer no-undo.

find first Employee no-lock no-error.
if available Employee then
  assign vPersonNum = Employee.EmpNum.

// imagine some 1000 lines of code here...





// and maybe some more here...

if vPersonNum = 123 then
do:
  //special logic
  log-manager:write-message("debug vPersonNum=" + string(vPersonNum)).
end.


