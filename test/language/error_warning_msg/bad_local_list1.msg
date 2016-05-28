****** Fatal Error: Same local name appears twice in this "local"
variable list.

The source lines relevant to this message are the following:

Line 12 column 10 in BAD_LOCAL_LIST1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_local_list1.e):
         bar, foo: INTEGER;
         ^                 
Line 13 column 10 in BAD_LOCAL_LIST1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_local_list1.e):
         bar: INTEGER;
         ^            
------
