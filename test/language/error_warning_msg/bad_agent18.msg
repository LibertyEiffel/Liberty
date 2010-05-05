****** Fatal Error: The feature called has 1 formal argument while
the actual argument list has 2 arguments.

The source lines involved by the message are the following:

Line 8 column 8 in BAD_AGENT18 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_agent18.e):
   f1 (max_depth: INTEGER) is
       ^                     
Line 17 column 45 in BAD_AGENT18 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_agent18.e):
         list.do_all(agent {BAD_AGENT18}.f1(1,2))
                                            ^    
------
