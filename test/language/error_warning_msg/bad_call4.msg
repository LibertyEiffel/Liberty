****** Fatal Error: The feature called has 1 formal argument while
the actual argument list has 2 arguments.

The source lines relevant to this message are the following:

Line 14 column 24 in BAD_CALL4 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call4.e):
         foo := foo.max(foo, foo)
                       ^         
Line 116 column 8 in COMPARABLE (/home/cadrian/Workspace/Dev/Liberty/src/lib/abilities/comparable.e):
   max (other: like Current): like Current
       ^                                  
------
