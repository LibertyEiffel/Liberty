****** Error: Expression "old" can be used in ensure clause only
(VAOL.1).

Line 12 column 17 in BAD_OLD2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_old2.e):
         if i = old (old i) then
                ^               
------
****** Error: Expression "old" can be used in ensure clause only
(VAOL.1).

Line 12 column 22 in BAD_OLD2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_old2.e):
         if i = old (old i) then
                     ^          
------
****** 2 errors.
Load class "/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_old2.e" aborted.
****** Fatal Error: Unable to load class "BAD_OLD2".

------
