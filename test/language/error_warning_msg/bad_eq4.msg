****** Fatal Error: In an object-oriented language, the receiver
of a call is always associated to some existing object (i.e. `Current'
is never Void). Hence, such a weird comparison is not allowed.

The source lines involved by the message are the following:

Line 11 columns 6, 16 in BAD_EQ4 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_eq4.e):
    if Current = Void then
       ^         ^        
------
