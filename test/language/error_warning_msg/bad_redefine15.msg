****** Error: Type ARRAY[INTEGER_16] is not a valid redefinition
for ARRAY[INTEGER_32]. Signature of the redefined feature is not
valid.

The source lines involved by the message are the following:

Line 14 column 12 in BAD_REDEFINE15 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_redefine15.e):
   foo (bar: ARRAY[INTEGER_16]) is
             ^                    
Line 7 column 12 in AUX_REDEFINE15 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_redefine15.e):
   foo (bar: ARRAY[INTEGER_32]) is
             ^                    
------
****** Error: 

------
****** Fatal Error: Signature of the redefined feature is not
valid.

The source lines involved by the message are the following:

Line 6 column 2 in BAD_REDEFINE15 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_redefine15.e):
   AUX_REDEFINE15
   ^             
Line 14 column 2 in BAD_REDEFINE15 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_redefine15.e):
   foo (bar: ARRAY[INTEGER_16]) is
   ^                              
Line 7 column 2 in AUX_REDEFINE15 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_redefine15.e):
   foo (bar: ARRAY[INTEGER_32]) is
   ^                              
------
