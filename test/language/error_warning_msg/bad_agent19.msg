****** Error: TUPLE type expected for open arguments of agent
type.

The source lines relevant to this message are the following:

Line 12 columns 26, 36 in BAD_AGENT19 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent19.e):
         agent1, agent2: PROCEDURE[STRING]
                         ^         ^      
------
****** Error: TUPLE type expected for open arguments of agent
type.

The source lines relevant to this message are the following:

Line 345 column 44 in ANY (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/any.e):
   frozen tagged_out_memory_ref: REFERENCE[STRING]
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
****** Fatal Error: When the context of the validation is PROCEDURE[STRING],
this type mark is not a TUPLE. (This is actually STRING.)

Line 10 column 12 in PROCEDURE (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/procedure.e):
   ROUTINE[O_]
           ^  
------
