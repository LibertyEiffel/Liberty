****** Fatal Error: Cannot pass `a' which is of type AUX_LIKE8A
into formal type AUX_LIKE8B.

The source lines relevant to this message are the following:

Line 16 column 23 in BAD_LIKE9 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_like9.e):
         b := same_as(a)
                      ^ 
Line 19 column 18 in BAD_LIKE9 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_like9.e):
   same_as(some: AUX_LIKE8B): like some
                 ^                     
------
