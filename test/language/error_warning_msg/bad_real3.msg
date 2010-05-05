****** Warning: Removed that non-significant digit in integral
part or real constant.

Line 15 column 11 in BAD_REAL3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_real3.e):
         r64 := 000.5             -- <-- Normal warning #1 here
                ^                                              
------
****** Warning: Removed that non-significant digit in integral
part or real constant.

Line 16 column 20 in BAD_REAL3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_real3.e):
         r32 := {REAL_32 00.5 }   -- <-- Normal warning #2 here
                         ^                                     
------
****** Fatal Error: Exponent part of a real value expected.

Line 17 column 15 in BAD_REAL3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_real3.e):
         r64 := 0.5E              -- <-- Error here.
                    ^                               
------
