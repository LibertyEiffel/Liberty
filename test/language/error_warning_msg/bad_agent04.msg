****** Fatal Error: The feature called has 1 formal argument while
the actual argument list has 2 arguments.

The source lines involved by the message are the following:

Line 17 column 24 in BAD_AGENT04 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent04.e):
         my_agent.call([tuple.first],3);
                       ^                
Line 17 column 10 in ROUTINE (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/routine.e):
   call (o: O_) is
         ^        
------
