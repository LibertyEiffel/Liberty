****** Error: Forbidden call (i.e. exportation rules violated) when the type of Current is AUX_EXPORT6B. (See the next error report for details.)

Line 11 column 16 in AUX_EXPORT6A (/home/r/Liberty/test/language/error_warning_msg/aux_export6a.e):
            a1.g
               ^
------
****** Warning: The client list computed from the "export" clauses is narrower than the one from the conforming parent(s) for AUX_EXPORT6B1.`g'. This can lead to catcalls! The final export list is {}.

The source lines involved by the message are the following:

Line 5 column 9 in AUX_EXPORT6A1 (/home/r/Liberty/test/language/error_warning_msg/aux_export6a1.e):
feature {AUX_EXPORT6A}
        ^             
Line 5 column 30 in AUX_EXPORT6B1 (/home/r/Liberty/test/language/error_warning_msg/aux_export6b1.e):
inherit AUX_EXPORT6A1 export {} g end
                             ^       
------
****** Fatal Error: This feature is only exported to {}.

The source lines involved by the message are the following:

Line 6 column 4 in AUX_EXPORT6A1 (/home/r/Liberty/test/language/error_warning_msg/aux_export6a1.e):
   g
   ^
Line 5 column 30 in AUX_EXPORT6B1 (/home/r/Liberty/test/language/error_warning_msg/aux_export6b1.e):
inherit AUX_EXPORT6A1 export {} g end
                             ^       
------
