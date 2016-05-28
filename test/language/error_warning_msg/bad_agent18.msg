****** Fatal Error: The feature called has 1 formal argument while
the actual argument list has 2 arguments.

The source lines relevant to this message are the following:

Line 11 column 7 in BAD_AGENT18 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent18.e):
   f1 (max_depth: INTEGER)
      ^                   
Line 20 column 46 in BAD_AGENT18 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent18.e):
         list.for_each(agent {BAD_AGENT18}.f1(1,2))
                                             ^     
------
