****** Fatal Error: Cannot pass `2' which is of type INTEGER_8
into formal type STRING.

The source lines involved by the message are the following:

Line 12 column 18 in BAD_AGENT08 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_agent08.e):
    r := agent f(?,2)
                   ^ 
Line 17 column 20 in BAD_AGENT08 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_agent08.e):
   f(s: STRING; i: STRING) is
                   ^         
------
