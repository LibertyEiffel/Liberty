****** Fatal Error: Cannot pass `a' which is of type AUX_LIKE8A
into formal type AUX_LIKE8B.

The source lines involved by the message are the following:

Line 17 column 17 in BAD_LIKE9 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_like9.e):
         b := same_as(a)
                      ^ 
Line 20 column 18 in BAD_LIKE9 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_like9.e):
   same_as(some: AUX_LIKE8B): like some is
                 ^                        
------
