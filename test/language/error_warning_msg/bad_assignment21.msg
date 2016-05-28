****** Fatal Error:  Bad assignment. Cannot assign `a' which is
of type ARRAY[INTEGER_32] into `c' which is of type COLLECTION[ANY].

The source lines relevant to this message are the following:

Line 14 columns 10, 15 in BAD_ASSIGNMENT21 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_assignment21.e):
         c := a -- <-- Must be rejected.
         ^    ^                         
------
