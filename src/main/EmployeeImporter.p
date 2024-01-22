

define variable vPersonNum as integer no-undo.

// find first Employee no-lock no-error.
// if available Employee then
//   assign vPersonNum = Employee.EmpNum. //Employee.EmpNum is PIFI

// imagine some 1000 lines of code here...





// and maybe some more here...

if vPersonNum = 123 then
do:
  //how would a code reviewer know that vPersonNum is outputting PIFI
  if log-manager:logfile-name <> ? then
    log-manager:write-message("debug vPersonNum=" + string(vPersonNum)).
end.
