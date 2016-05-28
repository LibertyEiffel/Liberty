****** Fatal Error: Cannot pass `agent io.put_string' which is
of type PROCEDURE[TUPLE[ABSTRACT_STRING]] into formal type PROCEDURE[TUPLE].

The source lines relevant to this message are the following:

Line 13 column 14 in BAD_AGENT11 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent11.e):
         foo(agent io.put_string)
             ^                   
Line 16 column 11 in BAD_AGENT11 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent11.e):
   foo(p: PROCEDURE[TUPLE])
          ^                
------
