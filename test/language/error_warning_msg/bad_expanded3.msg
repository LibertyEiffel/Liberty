****** Fatal Error: Found two possible default creation procedures
for expanded type AUX_EXPANDED3. An expanded type must have one
unique creation procedure with no argument: the creation procedure
used for automatic initialization.

The source lines relevant to this message are the following:

Line 7 columns 4, 20 in AUX_EXPANDED3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_expanded3.e):
   make_1, make_2, make_3
   ^               ^     
Line 10 column 4 in AUX_EXPANDED3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_expanded3.e):
   make_1
   ^     
Line 24 column 4 in AUX_EXPANDED3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_expanded3.e):
   make_3
   ^     
------
