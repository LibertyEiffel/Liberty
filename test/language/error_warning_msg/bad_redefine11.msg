****** Error: Type AUX_B is not a valid redefinition for AUX_C.
Signature of the redefined feature is not valid.

The source lines relevant to this message are the following:

Line 7 column 13 in AUX_C (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_c.e):
   foo(bar: AUX_B)
            ^     
Line 7 column 13 in AUX_B (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_b.e):
   foo(bar: AUX_C)
            ^     
------
****** Error: 

------
****** Fatal Error: Signature of the redefined feature is not
valid.

The source lines relevant to this message are the following:

Line 5 column 9 in AUX_C (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_c.e):
inherit AUX_B redefine foo, foo2 end
        ^                           
Line 7 column 4 in AUX_C (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_c.e):
   foo(bar: AUX_B)
   ^              
Line 7 column 4 in AUX_B (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_b.e):
   foo(bar: AUX_C)
   ^              
------
