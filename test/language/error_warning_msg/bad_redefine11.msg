****** Error: Type AUX_A is not a valid redefinition for AUX_B.
Signature of the redefined feature is not valid. (More explaination
below.)

The source lines involved by the message are the following:

Line 10 column 14 in AUX_C (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_c.e):
   foo2(bar: AUX_A) is
             ^        
Line 10 column 14 in AUX_B (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_b.e):
   foo2(bar: like Current) is
             ^               
------
****** Error: In the parent context (i.e in AUX_B) this type mark
is resolved as AUX_B.

Line 10 column 14 in AUX_B (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_b.e):
   foo2(bar: like Current) is
             ^               
------
****** Error: 

------
****** Fatal Error: Signature of the redefined feature is not
valid.

The source lines involved by the message are the following:

Line 5 column 9 in AUX_C (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_c.e):
inherit AUX_B redefine foo, foo2 end
        ^                           
Line 10 column 4 in AUX_C (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_c.e):
   foo2(bar: AUX_A) is
   ^                  
Line 10 column 4 in AUX_B (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_b.e):
   foo2(bar: like Current) is
   ^                         
------
