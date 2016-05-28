****** Error: Feature found is not a procedure.

The source lines relevant to this message are the following:

Line 14 column 14 in BAD_CALL3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call3.e):
         foo.max(foo)
             ^       
Line 116 column 4 in COMPARABLE (/home/cadrian/Workspace/Dev/Liberty/src/lib/abilities/comparable.e):
   max (other: like Current): like Current
   ^                                      
------
****** Fatal Error: This call has a result value (and you must
use it).

Line 14 column 14 in BAD_CALL3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call3.e):
         foo.max(foo)
             ^       
------
