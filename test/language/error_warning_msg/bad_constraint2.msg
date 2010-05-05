****** Error: Actual generic derivation CHARACTER must insert
NUMERIC which is the generic constraint.

The source lines involved by the message are the following:

Line 12 column 6 in BAD_CONSTRAINT2 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_constraint2.e):
    a: AUX_CONSTRAINT_A[CHARACTER]
       ^                          
Line 4 column 29 in AUX_CONSTRAINT_A (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_constraint_a.e):
class AUX_CONSTRAINT_A[X -> NUMERIC]
                            ^       
------
****** Fatal Error:  Constraint Generic Violation.

The source lines involved by the message are the following:

Line 12 column 6 in BAD_CONSTRAINT2 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_constraint2.e):
    a: AUX_CONSTRAINT_A[CHARACTER]
       ^                          
Line 4 column 24 in AUX_CONSTRAINT_A (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_constraint_a.e):
class AUX_CONSTRAINT_A[X -> NUMERIC]
                       ^            
------
