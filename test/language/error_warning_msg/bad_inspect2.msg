****** Fatal Error: Second occurrence of this value ("foo") in
the same inspect.

The source lines relevant to this message are the following:

Line 14 column 10 in BAD_INSPECT2 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inspect2.e):
         inspect s
         ^        
Line 17 column 15 in BAD_INSPECT2 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inspect2.e):
         when "foo" then
              ^         
------
