****** Error: Forbidden call (i.e. exportation rules violated) when the type of Current is BAD_EXPORT4. (See the next error report for details.)

Line 15 column 14 in BAD_EXPORT4 (/home/r/Liberty/test/language/error_warning_msg/bad_export4.e):
         aux.foo;
             ^   
------
****** Fatal Error: This feature is only exported to {AUX_EXPORT4}.

The source lines relevant to this message are the following:

Line 6 column 10 in AUX_EXPORT4 (/home/r/Liberty/test/language/error_warning_msg/aux_export4.e):
feature {AUX_EXPORT4}
         ^           
Line 7 column 4 in AUX_EXPORT4 (/home/r/Liberty/test/language/error_warning_msg/aux_export4.e):
   foo
   ^  
------
