****** Fatal Error: A frozen feature must not be redefined. What
is frozen _is_ frozen.

The source lines relevant to this message are the following:

Line 6 column 32 in BAD_REDEFINE2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine2.e):
inherit AUX_REDEFINE2 redefine test end
                               ^       
Line 7 column 11 in AUX_REDEFINE2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine2.e):
   frozen test
          ^   
------
