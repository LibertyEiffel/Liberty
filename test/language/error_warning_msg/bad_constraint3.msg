****** Error: Actual generic derivation ANY must insert STRING
which is the generic constraint.

The source lines involved by the message are the following:

Line 13 column 8 in BAD_CONSTRAINT3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_constraint3.e):
    loc: AUX_CONSTRAINT3[STRING,ANY]
         ^                          
Line 4 column 28 in AUX_CONSTRAINT3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_constraint3.e):
class AUX_CONSTRAINT3[X,Y->X]
                           ^ 
------
****** Fatal Error:  Constraint Generic Violation.

The source lines involved by the message are the following:

Line 13 column 8 in BAD_CONSTRAINT3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_constraint3.e):
    loc: AUX_CONSTRAINT3[STRING,ANY]
         ^                          
Line 4 column 25 in AUX_CONSTRAINT3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_constraint3.e):
class AUX_CONSTRAINT3[X,Y->X]
                        ^    
------
