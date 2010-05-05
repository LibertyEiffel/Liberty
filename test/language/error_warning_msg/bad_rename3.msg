****** Fatal Error: Can't join these two concrete features. What's
called a concrete feature here is a feature which is not deferred.
You may consider to undefine one feature. May be.

The source lines involved by the message are the following:

Line 194 column 9 in ANY (/home/colnet/SmartEiffel/lib/kernel/any.e):
   frozen print (some: STRING) is
          ^                      
Line 7 column 2 in BAD_RENAME3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_rename3.e):
   AUX_RENAME3
   ^          
Line 7 column 9 in AUX_RENAME3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_rename3.e):
   frozen do_nothing is
          ^            
------
