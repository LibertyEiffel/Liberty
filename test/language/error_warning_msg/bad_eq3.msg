****** Error: Such a weird comparison with Void is not allowed
because it would be always False. (See explaination below.)

Line 14 column 15 in BAD_EQ3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_eq3.e):
         if i = Void then
              ^          
------
****** Fatal Error: The declaration type of `i' is obviously expanded
(i.e. the written type mark is "INTEGER_32"). You can use the
Void comparison only when other type mark is a reference type
or, if it is an expanded type, it must be an anchor or some formal
generic argument. Fix this error first.

Line 14 column 13 in BAD_EQ3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_eq3.e):
         if i = Void then
            ^            
------
