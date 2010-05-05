****** Error: Forbidden call (i.e. exportation rules violated)
when the type of Current is BAD_EXPORT8. (See the next error report
for details.)

Line 13 column 10 in BAD_EXPORT8 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_export8.e):
       aux.make
           ^   
------
****** Fatal Error: This feature is only exported to {INTROUVABLE}.

The source lines involved by the message are the following:

Line 7 column 10 in BAD_EXPORT8 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_export8.e):
feature {INTROUVABLE} -- To be sure that this place is in the error message.
         ^                                                                  
Line 8 column 4 in BAD_EXPORT8 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_export8.e):
   make is
   ^      
------
