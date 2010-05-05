****** Fatal Error: Cannot pass Void into formal argument which
is of type INTEGER_32.

The source lines involved by the message are the following:

Line 14 column 42 in BAD_CREATION7 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_creation7.e):
         fast_array := {FAST_ARRAY[INTEGER] << Void, 2 >> }
                                               ^           
Line 384 column 41 in FAST_ARRAY (/home/colnet/SmartEiffel/lib/storage/collection/fast_array.e):
   manifest_put (index: INTEGER; element: like item) is
                                          ^            
------
