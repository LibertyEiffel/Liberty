****** Fatal Error: The value is already part of previously encountered
slice. (Wrong inspect statement.)

The source lines relevant to this message are the following:

Line 16 column 15 in BAD_INSPECT8 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_inspect8.e):
         when 1 .. 3 then
              ^          
Line 17 column 15 in BAD_INSPECT8 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_inspect8.e):
         when 2 then -- Second occurrence !
              ^                            
------
