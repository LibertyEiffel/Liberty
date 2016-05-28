****** Fatal Error:  Bad assignment. Cannot assign `2147483648'
which is of type INTEGER_64 into `i32' which is of type INTEGER_32.

The source lines relevant to this message are the following:

Line 14 columns 10, 17 in BAD_INTEGER_CONSTANT11 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_integer_constant11.e):
         i32 := - -2147483648
         ^      ^            
------
