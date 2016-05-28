****** Fatal Error: The feature called has 2 formal arguments
while the actual argument list has 1 argument.

The source lines relevant to this message are the following:

Line 16 column 49 in BAD_AGENT02 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent02.e):
         my_collection.for_each(agent print_item(?))
                                                ^   
Line 20 column 14 in BAD_AGENT02 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent02.e):
   print_item(c: CHARACTER; item: STRING)
             ^                           
------
