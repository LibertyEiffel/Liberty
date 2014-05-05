****** Fatal Error: The feature called has 2 formal arguments
while the actual argument list has 1 argument.

The source lines involved by the message are the following:

Line 15 column 47 in BAD_AGENT02 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent02.e):
         my_collection.do_all(agent print_item(?))
                                              ^   
Line 19 column 16 in BAD_AGENT02 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent02.e):
   print_item (c: CHARACTER; item: STRING) is
               ^                             
------
