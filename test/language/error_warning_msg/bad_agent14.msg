****** Fatal Error: The feature called has 2 formal arguments
while the actual argument list has 1 argument.

The source lines relevant to this message are the following:

Line 15 column 49 in BAD_AGENT14 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent14.e):
         my_collection.for_each(agent print_item(?))
                                                ^   
Line 19 column 14 in BAD_AGENT14 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent14.e):
   print_item(item: STRING; c: CHARACTER)
             ^                           
------
