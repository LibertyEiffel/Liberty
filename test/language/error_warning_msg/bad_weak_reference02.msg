****** Fatal Error: INTEGER is expanded. The generic argument
of WEAK_REFERENCE must not be expanded. (It does not makes sense
to do so.)

The source lines relevant to this message are the following:

Line 10 column 12 in BAD_WEAK_REFERENCE02 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_weak_reference02.e):
   my_int: INTEGER
           ^      
Line 14 column 15 in BAD_WEAK_REFERENCE02 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_weak_reference02.e):
         bwr: WEAK_REFERENCE[like my_int]
              ^                          
------
