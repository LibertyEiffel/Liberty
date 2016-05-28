****** Error: Actual generic derivation ANY must insert STRING
which is the generic constraint.

The source lines relevant to this message are the following:

Line 14 column 15 in BAD_CONSTRAINT3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_constraint3.e):
         loc: AUX_CONSTRAINT3[STRING,ANY]
              ^                          
Line 4 column 33 in AUX_CONSTRAINT3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_constraint3.e):
class AUX_CONSTRAINT3[X_, Y_ -> X_]
                                ^  
------
****** Fatal Error:  Constraint Generic Violation.

The source lines relevant to this message are the following:

Line 14 column 15 in BAD_CONSTRAINT3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_constraint3.e):
         loc: AUX_CONSTRAINT3[STRING,ANY]
              ^                          
Line 4 column 27 in AUX_CONSTRAINT3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_constraint3.e):
class AUX_CONSTRAINT3[X_, Y_ -> X_]
                          ^        
------
