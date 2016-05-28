****** Warning: Add undefine or redefine to all inherited version
of feature path in BAD_REDEFINE7 because there is a local definition
in this class. Redefine has been automatically added. Please check.

The source lines relevant to this message are the following:

Line 8 column 4 in BAD_REDEFINE7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine7.e):
   AUX_REDEFINE7B;
   ^              
Line 14 column 4 in BAD_REDEFINE7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine7.e):
   path: STRING;
   ^            
Line 6 column 4 in AUX_REDEFINE7B (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine7b.e):
   path: STRING;
   ^            
------
****** Fatal Error: Unknown feature `i_want_to_crash_here_to_keep_track_of_the_previous_warning'
in type BAD_REDEFINE7. (For this call, the target is the implicit
non written `Current' which is of type BAD_REDEFINE7.)

Line 19 column 10 in BAD_REDEFINE7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine7.e):
         i_want_to_crash_here_to_keep_track_of_the_previous_warning
         ^                                                         
------
