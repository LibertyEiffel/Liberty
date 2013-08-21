****** Error: Bad redefinition. Result types must be both expanded
or both non-expanded (VDRD.6).

The source lines involved by the message are the following:

Line 12 column 4 in AUX_REDEFINE13B (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine13b.e):
   foo: like Current is
   ^                   
Line 7 column 4 in AUX_REDEFINE13A (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine13a.e):
   foo: like Current is
   ^                   
------
****** Fatal Error: Signature of the redefined feature is not
valid.

The source lines involved by the message are the following:

Line 7 column 4 in AUX_REDEFINE13B (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine13b.e):
   AUX_REDEFINE13A
   ^              
Line 12 column 4 in AUX_REDEFINE13B (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine13b.e):
   foo: like Current is
   ^                   
Line 7 column 4 in AUX_REDEFINE13A (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_redefine13a.e):
   foo: like Current is
   ^                   
------
