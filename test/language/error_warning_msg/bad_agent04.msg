****** Fatal Error: The feature called has 1 formal argument while
the actual argument list has 2 arguments.

The source lines involved by the message are the following:

Line 17 column 23 in BAD_AGENT04 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent04.e):
         my_agent.call([tuple.first],3);
                      ^                 
Line 13 column 21 in PROCEDURE (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/procedure.e):
   call alias "()" (o: O_) is
                    ^        
------
