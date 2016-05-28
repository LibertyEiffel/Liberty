****** Warning: Added missing "then" keyword.

Line 13 column 10 in BAD_IF2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_if2.e):
         elseif 1
         ^       
------
****** Warning: Added missing "then" keyword.

Line 14 column 10 in BAD_IF2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_if2.e):
         else
         ^   
------
****** Warning: Added missing "end" keyword to finish this "if" instruction.

The source lines relevant to this message are the following:

Line 17 column 10 in BAD_IF2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_if2.e):
         if True then
         ^           
Line 18 column 7 in BAD_IF2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_if2.e):
      ensure
      ^     
------
****** Error: "if" (or "elseif" as well) must be followed by a
BOOLEAN expression.

Line 13 column 10 in BAD_IF2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_if2.e):
         elseif 1
         ^       
------
****** Fatal Error: The declaration type of this expression is
INTEGER_8 (this is not BOOLEAN).

Line 13 column 17 in BAD_IF2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_if2.e):
         elseif 1
                ^
------
