****** Error: Procedure "default_create" does not belong to a
creation clause of AUX_CREATE3. This creation call is thus not
allowed.

The source lines relevant to this message are the following:

Line 11 column 4 in ANY (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/any.e):
   default_create
   ^             
Line 14 column 10 in BAD_CREATE3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_create3.e):
         create aux
         ^         
------
****** Fatal Error: Creation clause exists for type AUX_CREATE3
and the default creation procedure (see `default_create' in class
ANY) is not allowed. You must use one of the available creation
procedure here.

The source lines relevant to this message are the following:

Line 14 column 10 in BAD_CREATE3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_create3.e):
         create aux
         ^         
Line 7 column 4 in AUX_CREATE3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_create3.e):
   make
   ^   
------
