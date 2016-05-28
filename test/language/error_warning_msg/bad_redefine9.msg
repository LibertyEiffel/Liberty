****** Fatal Error: Bad redefinition. An attribute must be redefined
as an attribute only (VDRD.6).

The source lines relevant to this message are the following:

Line 17 column 4 in BAD_REDEFINE9 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine9.e):
   dummy: BOOLEAN
   ^             
Line 6 column 4 in AUX_REDEFINE9 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine9.e):
   dummy : BOOLEAN;
   ^               
------
