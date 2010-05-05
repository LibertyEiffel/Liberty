****** Fatal Error: Only manifest strings are accepted in "when"
clauses of "inspect" (in order to ensure that the STRING won't
change at runtime). Not that even a constant of type STRING can
have its content changed at runtime.

The source lines involved by the message are the following:

Line 12 column 10 in BAD_INSPECT3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inspect3.e):
         inspect "toto"
         ^             
Line 13 column 15 in BAD_INSPECT3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inspect3.e):
         when toto then
              ^        
------
