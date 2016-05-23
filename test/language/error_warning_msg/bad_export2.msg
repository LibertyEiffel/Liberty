****** Error: Forbidden call (i.e. exportation rules violated) when the type of Current is BAD_EXPORT2. (See the next error report for details.)

Line 15 column 14 in BAD_EXPORT2 (/home/r/Liberty/test/language/error_warning_msg/bad_export2.e):
         aux.foo;
             ^   
------
****** Fatal Error: This feature is only exported to {}.

The source lines involved by the message are the following:

Line 6 column 9 in AUX_EXPORT2A (/home/r/Liberty/test/language/error_warning_msg/aux_export2a.e):
feature {}
        ^ 
Line 7 column 4 in AUX_EXPORT2A (/home/r/Liberty/test/language/error_warning_msg/aux_export2a.e):
   foo do end;
   ^          
------
