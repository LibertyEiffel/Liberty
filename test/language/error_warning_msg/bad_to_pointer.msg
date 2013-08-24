****** Error: Invalid usage of feature `to_pointer' of class ANY.
(The target which is of type REAL_64 cannot be converted to a
memory address.)

The source lines involved by the message are the following:

Line 418 column 4 in ANY (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/any.e):
   to_pointer: POINTER is
   ^                     
Line 14 column 15 in BAD_TO_POINTER (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_to_pointer.e):
         p := d.to_pointer
              ^           
------
****** 1 error.
