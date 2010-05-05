****** Fatal Error: The feature called has 1 formal argument while
the actual argument list has 2 arguments.

The source lines involved by the message are the following:

Line 14 column 18 in BAD_CALL4 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_call4.e):
    foo := foo.max(foo, foo)
                   ^        
Line 115 column 7 in COMPARABLE (/home/colnet/SmartEiffel/lib/abilities/comparable.e):
   max (other: like Current): like Current is
        ^                                    
------
