****** Fatal Error: Overlapping slices. (Wrong inspect statement.)

The source lines relevant to this message are the following:

Line 16 column 15 in BAD_INSPECT9 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_inspect9.e):
         when 1 .. 3 then
              ^          
Line 17 column 15 in BAD_INSPECT9 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_inspect9.e):
         when 3 .. 4 then -- Overlapped slice !
              ^                                
------
