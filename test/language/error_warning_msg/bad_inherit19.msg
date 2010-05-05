****** Warning: Expanded classes can be inserted only.

Line 7 column 2 in BAD_INHERIT19 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inherit19.e):
   AUX_INHERIT19
   ^            
------
****** Fatal Error: Assignment of a reference type into an expanded
type is not allowed. Cannot assign `Current' which is of type
BAD_INHERIT19 into `foo' which is of type AUX_INHERIT19.

The source lines involved by the message are the following:

Line 17 columns 4, 11 in BAD_INHERIT19 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inherit19.e):
         foo := Current
         ^      ^      
------
