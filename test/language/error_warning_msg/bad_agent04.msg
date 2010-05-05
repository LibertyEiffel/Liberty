****** Fatal Error: The feature called has 1 formal argument while
the actual argument list has 2 arguments.

The source lines involved by the message are the following:

Line 17 column 17 in BAD_AGENT04 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_agent04.e):
    my_agent.call([tuple.first],3);
                  ^                
Line 16 column 8 in ROUTINE (/home/colnet/SmartEiffel/lib/kernel/routine.e):
   call (o: O_) is
         ^        
------
