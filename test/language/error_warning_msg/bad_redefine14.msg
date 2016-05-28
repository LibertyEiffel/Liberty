****** Error: Type INTEGER_16 is not a valid redefinition for
INTEGER_32. Signature of the redefined feature is not valid.

The source lines relevant to this message are the following:

Line 15 column 14 in BAD_REDEFINE14 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine14.e):
   foo (bar: INTEGER_16)
             ^          
Line 7 column 14 in AUX_REDEFINE14 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine14.e):
   foo (bar: INTEGER_32)
             ^          
------
****** Error: 

------
****** Fatal Error: Signature of the redefined feature is not
valid.

The source lines relevant to this message are the following:

Line 7 column 4 in BAD_REDEFINE14 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine14.e):
   AUX_REDEFINE14
   ^             
Line 15 column 4 in BAD_REDEFINE14 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine14.e):
   foo (bar: INTEGER_16)
   ^                    
Line 7 column 4 in AUX_REDEFINE14 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine14.e):
   foo (bar: INTEGER_32)
   ^                    
------
