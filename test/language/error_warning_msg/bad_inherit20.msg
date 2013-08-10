****** Warning: An expanded class cannot inherit from other classes,
it can only have an "insert" clause (replaced).

Line 6 column 1 in AUX_INHERIT20 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_inherit20.e):
inherit
^      
------
****** 1 warning.
****** Fatal Error:  Bad assignment. Cannot assign `foo' which
is of type AUX_INHERIT20 into `bar' which is of type BAD_INHERIT20.

The source lines involved by the message are the following:

Line 15 columns 10, 17 in BAD_INHERIT20 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_inherit20.e):
         bar := foo
         ^      ^  
------
