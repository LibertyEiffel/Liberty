****** Error: Actual generic derivation CHARACTER must insert
NUMERIC which is the generic constraint.

The source lines relevant to this message are the following:

Line 12 column 13 in BAD_CONSTRAINT2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_constraint2.e):
         a: AUX_CONSTRAINT_A[CHARACTER]
            ^                          
Line 4 column 30 in AUX_CONSTRAINT_A (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_constraint_a.e):
class AUX_CONSTRAINT_A[X_ -> NUMERIC]
                             ^       
------
****** Fatal Error:  Constraint Generic Violation.

The source lines relevant to this message are the following:

Line 12 column 13 in BAD_CONSTRAINT2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_constraint2.e):
         a: AUX_CONSTRAINT_A[CHARACTER]
            ^                          
Line 4 column 24 in AUX_CONSTRAINT_A (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_constraint_a.e):
class AUX_CONSTRAINT_A[X_ -> NUMERIC]
                       ^             
------
