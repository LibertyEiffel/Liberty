****** Error: Procedure "make" does not belong to a creation clause
of AUX_CREATE5. This creation call is thus not allowed.

The source lines relevant to this message are the following:

Line 14 column 10 in BAD_CREATE5 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_create5.e):
         create aux_create5
         ^                 
Line 8 column 32 in AUX_CREATE5 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_create5.e):
      rename default_create as make
                               ^   
------
****** Fatal Error: Creation clause exists for type AUX_CREATE5
and the default creation procedure (see `default_create' in class
ANY) is not allowed. You must use one of the available creation
procedure here.

The source lines relevant to this message are the following:

Line 14 column 10 in BAD_CREATE5 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_create5.e):
         create aux_create5
         ^                 
Line 12 column 4 in AUX_CREATE5 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_create5.e):
   default_create
   ^             
------
