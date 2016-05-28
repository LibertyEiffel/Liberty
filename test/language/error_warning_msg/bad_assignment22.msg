****** Fatal Error:  Bad assignment. Cannot assign `a' which is
of type ARRAY[INTEGER_32] into `c' which is of type COLLECTION[COMPARABLE].

The source lines relevant to this message are the following:

Line 16 columns 10, 15 in BAD_ASSIGNMENT22 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_assignment22.e):
         c := a -- <-- Must be rejected.
         ^    ^                         
------
