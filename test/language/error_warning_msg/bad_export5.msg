****** Warning: A missing client clause is interpreted as {ANY}. It is better to be explicit.

Line 6 column 4 in AUX_EXPORT5A (/home/r/Liberty/test/language/error_warning_msg/aux_export5a.e):
   f
   ^
------
****** Error: Forbidden call (i.e. exportation rules violated) when the type of Current is AUX_EXPORT5B. (See the next error report for details.)

Line 11 column 16 in AUX_EXPORT5A (/home/r/Liberty/test/language/error_warning_msg/aux_export5a.e):
            a1.g
               ^
------
****** Warning: The "feature" clause declares a narrower client list than the conforming parent(s) for AUX_EXPORT5B1.`g'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 5 column 9 in AUX_EXPORT5A1 (/home/r/Liberty/test/language/error_warning_msg/aux_export5a1.e):
feature {AUX_EXPORT5A}
        ^             
Line 6 column 9 in AUX_EXPORT5B1 (/home/r/Liberty/test/language/error_warning_msg/aux_export5b1.e):
feature {}
        ^ 
Line 7 column 4 in AUX_EXPORT5B1 (/home/r/Liberty/test/language/error_warning_msg/aux_export5b1.e):
   g
   ^
------
****** Fatal Error: This feature is only exported to {}.

The source lines involved by the message are the following:

Line 6 column 9 in AUX_EXPORT5B1 (/home/r/Liberty/test/language/error_warning_msg/aux_export5b1.e):
feature {}
        ^ 
Line 7 column 4 in AUX_EXPORT5B1 (/home/r/Liberty/test/language/error_warning_msg/aux_export5b1.e):
   g
   ^
------
