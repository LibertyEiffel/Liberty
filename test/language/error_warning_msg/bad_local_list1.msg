****** Fatal Error: Same local name appears twice in this "local"
variable list.

The source lines involved by the message are the following:

Line 12 column 3 in BAD_LOCAL_LIST1 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_local_list1.e):
    bar, foo: INTEGER;
    ^                 
Line 13 column 3 in BAD_LOCAL_LIST1 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_local_list1.e):
    bar: INTEGER;
    ^            
------
