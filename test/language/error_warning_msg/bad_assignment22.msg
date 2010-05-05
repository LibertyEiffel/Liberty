****** Fatal Error:  Bad assignment. Cannot assign `a' which is
of type ARRAY[INTEGER_32] into `c' which is of type COLLECTION[COMPARABLE].

The source lines involved by the message are the following:

Line 16 columns 4, 9 in BAD_ASSIGNMENT22 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_assignment22.e):
         c := a -- <-- Must be rejected.
         ^    ^                         
------
