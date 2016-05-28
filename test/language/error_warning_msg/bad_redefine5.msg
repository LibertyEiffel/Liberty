****** Fatal Error: A frozen feature must not be redefined. What
is frozen _is_ frozen.

The source lines relevant to this message are the following:

Line 8 column 16 in BAD_REDEFINE5 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine5.e):
      redefine frozen_routine
               ^             
Line 7 column 11 in AUX_REDEFINE5 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine5.e):
   frozen frozen_routine (other: AUX_REDEFINE5)
          ^                                    
------
