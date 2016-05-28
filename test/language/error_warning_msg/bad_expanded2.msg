****** Fatal Error: Unable to find the default creation procedure
for expanded type AUX_EXPANDED2. An expanded type must have one
unique creation procedure with no argument: the creation procedure
used for automatic initialization. Please, consider to add explicitely
the `default_create' procedure from ANY or some other existing
procedure with no arguments. For expanded class with no creation
clause, the `default_create' procedure is the one used for automatic
initialization.

The source lines relevant to this message are the following:

Line 16 column 7 in BAD_EXPANDED2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_expanded2.e):
   e: AUX_EXPANDED2
      ^            
Line 12 column 1 in AUX_EXPANDED2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_expanded2.e):
create {ANY}
^           
------
