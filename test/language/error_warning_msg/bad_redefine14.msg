****** Error: Type INTEGER_16 is not a valid redefinition for
INTEGER_32. Signature of the redefined feature is not valid.

The source lines involved by the message are the following:

Line 14 column 12 in BAD_REDEFINE14 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_redefine14.e):
   foo (bar: INTEGER_16) is
             ^             
Line 7 column 12 in AUX_REDEFINE14 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_redefine14.e):
   foo (bar: INTEGER_32) is
             ^             
------
****** Error: 

------
****** Fatal Error: Signature of the redefined feature is not
valid.

The source lines involved by the message are the following:

Line 6 column 2 in BAD_REDEFINE14 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_redefine14.e):
   AUX_REDEFINE14
   ^             
Line 14 column 2 in BAD_REDEFINE14 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_redefine14.e):
   foo (bar: INTEGER_16) is
   ^                       
Line 7 column 2 in AUX_REDEFINE14 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_redefine14.e):
   foo (bar: INTEGER_32) is
   ^                       
------
