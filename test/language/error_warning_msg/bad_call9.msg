****** Fatal Error: The feature called has 1 formal argument while
the actual argument list has 3 arguments.

The source lines relevant to this message are the following:

Line 16 column 30 in BAD_CALL9 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call9.e):
         string.append_string(to_string, i + 1, to_string.count)
                             ^                                  
Line 7 column 26 in AUX_CALL9_STRING (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_call9_string.e):
   append, append_string (s: STRING)
                         ^          
------
