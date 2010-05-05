****** Warning: Expression `aux3.get_x' which is of type AUX_ASSIGNMENT_TEST03_C
can be assigned into `c' which is of type AUX_ASSIGNMENT_TEST03_C
by using an ordinary ":=" assignment ("?=" is not necessary).

The source lines involved by the message are the following:

Line 30 columns 4, 14 in BAD_ASSIGNMENT_TEST03 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_assignment_test03.e):
         c ?= aux3.get_x
         ^         ^    
------
****** Warning: Expression `aux2.get_x' which is of type AUX_ASSIGNMENT_TEST03_B
can be assigned into `b' which is of type AUX_ASSIGNMENT_TEST03_B
by using an ordinary ":=" assignment ("?=" is not necessary).

The source lines involved by the message are the following:

Line 29 columns 4, 14 in BAD_ASSIGNMENT_TEST03 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_assignment_test03.e):
         b ?= aux2.get_x
         ^         ^    
------
****** Fatal Error: Invalid assignment attempt ("?="). The left-hand
side expression must conforms with the right-hand side. Expression
`c' is of type AUX_ASSIGNMENT_TEST03_C while expression `aux1.get_x'
is of type AUX_ASSIGNMENT_TEST03_A.

The source lines involved by the message are the following:

Line 19 columns 4, 14 in BAD_ASSIGNMENT_TEST03 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_assignment_test03.e):
         c ?= aux1.get_x
         ^         ^    
------
