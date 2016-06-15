****** Warning: Removed non-significant digit(s) from integral part of real constant.

Line 15 column 17 in BAD_REAL3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_real3.e):
         r64 := 000.5             -- <-- Normal warning #1 here
                ^                                              
------
****** Warning: Removed non-significant digit(s) from integral part of real constant.

Line 16 column 26 in BAD_REAL3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_real3.e):
         r32 := {REAL_32 00.5 }   -- <-- Normal warning #2 here
                         ^                                     
------
****** Fatal Error: Exponent part of a real value expected.

Line 17 column 21 in BAD_REAL3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_real3.e):
         r64 := 0.5E              -- <-- Error here.
                    ^                               
------
