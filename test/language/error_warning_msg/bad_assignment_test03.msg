****** Warning: The expression `aux2.get_x' which is of type AUX_ASSIGNMENT_TEST03_B
can be assigned into `b' which is of type AUX_ASSIGNMENT_TEST03_B
by using an ordinary ":=" assignment  ("?=" is not necessary).

The source lines relevant to this message are the following:

Line 28 columns 10, 20 in BAD_ASSIGNMENT_TEST03 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_assignment_test03.e):
         b ?= aux2.get_x
         ^         ^    
------
****** Warning: The expression `aux3.get_x' which is of type AUX_ASSIGNMENT_TEST03_C
can be assigned into `c' which is of type AUX_ASSIGNMENT_TEST03_C
by using an ordinary ":=" assignment  ("?=" is not necessary).

The source lines relevant to this message are the following:

Line 29 columns 10, 20 in BAD_ASSIGNMENT_TEST03 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_assignment_test03.e):
         c ?= aux3.get_x
         ^         ^    
------
****** Fatal Error: Invalid assignment attempt ("?="). The left-hand
side expression must conform to the right-hand side. The expression
`c' is of type AUX_ASSIGNMENT_TEST03_C while the expression `aux1.get_x'
is of type AUX_ASSIGNMENT_TEST03_A.

The source lines relevant to this message are the following:

Line 30 columns 10, 20 in BAD_ASSIGNMENT_TEST03 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_assignment_test03.e):
         c ?= aux1.get_x
         ^         ^    
------
