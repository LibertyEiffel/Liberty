****** Fatal Error: Cannot pass `b' which is of type AUX_LIKE8B
into formal type AUX_LIKE8A.

The source lines relevant to this message are the following:

Line 16 column 20 in BAD_LIKE8 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_like8.e):
         same_as(a,b)
                   ^ 
Line 19 column 37 in BAD_LIKE8 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_like8.e):
   same_as(some: AUX_LIKE8A; other: like some)
                                    ^         
------
