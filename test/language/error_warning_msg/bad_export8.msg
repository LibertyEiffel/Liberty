****** Error: Forbidden call (i.e. exportation rules violated) when the type of Current is BAD_EXPORT8. (See the next error report for details.)

Line 15 column 17 in BAD_EXPORT8 (/home/r/Liberty/test/language/error_warning_msg/bad_export8.e):
            aux.make
                ^   
------
****** Fatal Error: This feature is only exported to {INTROUVABLE}.

The source lines involved by the message are the following:

Line 9 column 10 in BAD_EXPORT8 (/home/r/Liberty/test/language/error_warning_msg/bad_export8.e):
feature {INTROUVABLE} -- To be sure that this place is in the error message.
         ^                                                                  
Line 10 column 4 in BAD_EXPORT8 (/home/r/Liberty/test/language/error_warning_msg/bad_export8.e):
   make
   ^   
------
