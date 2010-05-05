****** Error: Feature found is not a procedure.

The source lines involved by the message are the following:

Line 14 column 7 in BAD_CALL3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_call3.e):
    foo.max(foo)
        ^       
Line 115 column 2 in COMPARABLE (/home/colnet/SmartEiffel/lib/abilities/comparable.e):
   max (other: like Current): like Current is
   ^                                         
------
****** Fatal Error: This call has a result value (and you must
use it).

Line 14 column 7 in BAD_CALL3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_call3.e):
    foo.max(foo)
        ^       
------
