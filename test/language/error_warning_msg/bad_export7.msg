****** Error: Forbidden call (i.e. exportation rules violated)
when the type of Current is BAD_EXPORT7. (See the next error report
for details.)

Line 13 column 18 in BAD_EXPORT7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_export7.e):
         Current.ga      -- This one is forbidden
                 ^                               
------
****** Fatal Error: This feature is only exported to {}.

The source lines relevant to this message are the following:

Line 9 column 9 in BAD_EXPORT7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_export7.e):
feature {}
        ^ 
Line 18 column 4 in BAD_EXPORT7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_export7.e):
   ga is
   ^    
------
