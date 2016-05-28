****** Error: TUPLE type expected for open arguments of agent
type.

The source lines relevant to this message are the following:

Line 4 column 7 in BAD_AGENT13 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent13.e):
class BAD_AGENT13
      ^          
Line 14 column 13 in BAD_AGENT13 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent13.e):
         p: PROCEDURE[like bad_type]
            ^                       
------
****** Error: TUPLE type expected for open arguments of agent
type.

The source lines relevant to this message are the following:

Line 4 column 7 in BAD_AGENT13 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent13.e):
class BAD_AGENT13
      ^          
Line 10 column 4 in PROCEDURE (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/procedure.e):
   ROUTINE[O_]
   ^          
------
****** Error: TUPLE type expected for open arguments of agent
type. (See also the next fatal error message.)

Line 10 column 12 in PROCEDURE (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/procedure.e):
   ROUTINE[O_]
           ^  
------
****** Fatal Error: When the context of the validation is PROCEDURE[BAD_AGENT13],
this type mark is not a TUPLE. (This is actually BAD_AGENT13.)

Line 10 column 12 in PROCEDURE (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/procedure.e):
   ROUTINE[O_]
           ^  
------
