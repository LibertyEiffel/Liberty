****** Fatal Error: The feature called has 1 formal argument while
the actual argument list has 2 arguments.

The source lines involved by the message are the following:

Line 11 column 8 in BAD_AGENT17 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent17.e):
   f1 (max_depth: INTEGER) is
       ^                     
Line 20 column 44 in BAD_AGENT17 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent17.e):
         list.do_all(agent {BAD_AGENT17}.f1(1,2))
                                           ^     
------
