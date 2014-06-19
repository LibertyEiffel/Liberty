****** Fatal Error: Cannot pass Void into formal argument which
is of type INTEGER_32.

The source lines involved by the message are the following:

Line 14 column 48 in BAD_CREATION7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_creation7.e):
         fast_array := {FAST_ARRAY[INTEGER] << Void, 2 >> }
                                               ^           
Line 408 column 43 in FAST_ARRAY (/home/cadrian/Workspace/Dev/Liberty/src/lib/storage/collection/fast_array.e):
   manifest_put (index: INTEGER; element: like item)
                                          ^         
------
