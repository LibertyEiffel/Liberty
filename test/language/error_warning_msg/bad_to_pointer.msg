****** Warning: Invalid usage of feature `to_pointer' of class
ANY. (The target which is of type REAL_64 cannot be converted
as a memory address.)

The source lines involved by the message are the following:

Line 324 column 2 in ANY (/home/colnet/SmartEiffel/lib/kernel/any.e):
   to_pointer: POINTER is
   ^                     
Line 14 column 9 in BAD_TO_POINTER (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_to_pointer.e):
         p := d.to_pointer
              ^           
------
****** 1 warning.
