****** Fatal Error:  Bad assignment. Cannot assign `2147483648'
which is of type INTEGER_64 into `i32' which is of type INTEGER_32.

The source lines involved by the message are the following:

Line 14 columns 4, 11 in BAD_INTEGER_CONSTANT11 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_integer_constant11.e):
         i32 := - -2147483648
         ^      ^            
------
