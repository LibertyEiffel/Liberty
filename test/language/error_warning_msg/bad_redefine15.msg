****** Error: Type ARRAY[INTEGER_16] is not a valid redefinition
for ARRAY[INTEGER_32]. Signature of the redefined feature is not
valid.

The source lines relevant to this message are the following:

Line 14 column 14 in BAD_REDEFINE15 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine15.e):
   foo (bar: ARRAY[INTEGER_16])
             ^                 
Line 7 column 14 in AUX_REDEFINE15 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine15.e):
   foo (bar: ARRAY[INTEGER_32])
             ^                 
------
****** Error: 

------
****** Fatal Error: Signature of the redefined feature is not
valid.

The source lines relevant to this message are the following:

Line 6 column 4 in BAD_REDEFINE15 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine15.e):
   AUX_REDEFINE15
   ^             
Line 14 column 4 in BAD_REDEFINE15 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_redefine15.e):
   foo (bar: ARRAY[INTEGER_16])
   ^                           
Line 7 column 4 in AUX_REDEFINE15 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine15.e):
   foo (bar: ARRAY[INTEGER_32])
   ^                           
------
