****** Fatal Error: Cannot pass `2' which is of type INTEGER_8
into formal type STRING.

The source lines relevant to this message are the following:

Line 15 column 25 in BAD_AGENT08 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent08.e):
         r := agent f(?,2)
                        ^ 
Line 20 column 20 in BAD_AGENT08 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent08.e):
   f(s: STRING; i: STRING)
                   ^      
------
