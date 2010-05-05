****** Error: TUPLE type expected for open arguments of agent
type.

The source lines involved by the message are the following:

Line 12 columns 20, 30 in BAD_AGENT19 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_agent19.e):
         agent1, agent2: PROCEDURE[STRING]
                         ^         ^      
------
****** Error: TUPLE type expected for open arguments of agent
type.

Line 9 column 2 in PROCEDURE (/home/colnet/SmartEiffel/lib/kernel/procedure.e):
   ROUTINE[O_]
   ^          
------
****** Error: TUPLE type expected for open arguments of agent
type. (See also the next fatal error message.)

Line 9 column 10 in PROCEDURE (/home/colnet/SmartEiffel/lib/kernel/procedure.e):
   ROUTINE[O_]
           ^  
------
****** Fatal Error: When the context of the validation is PROCEDURE[STRING],
this type mark is not a TUPLE. (This is actually STRING.)

Line 9 column 10 in PROCEDURE (/home/colnet/SmartEiffel/lib/kernel/procedure.e):
   ROUTINE[O_]
           ^  
------
