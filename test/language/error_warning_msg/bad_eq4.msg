****** Fatal Error: In an object-oriented language, the receiver
of a call is always associated to some existing object (i.e. `Current'
is never Void). Hence, such a weird comparison is not allowed.

The source lines relevant to this message are the following:

Line 13 columns 13, 23 in BAD_EQ4 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_eq4.e):
         if Current = Void then
            ^         ^        
------
