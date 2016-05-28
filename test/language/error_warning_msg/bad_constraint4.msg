****** Error: Actual generic derivation ANY must insert STRING
which is the generic constraint.

The source lines relevant to this message are the following:

Line 14 column 15 in BAD_CONSTRAINT4 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_constraint4.e):
         loc: AUX_CONSTRAINT4[ANY,STRING]
              ^                          
Line 4 column 29 in AUX_CONSTRAINT4 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_constraint4.e):
class AUX_CONSTRAINT4[X_ -> Y_, Y_]
                            ^      
------
****** Fatal Error:  Constraint Generic Violation.

The source lines relevant to this message are the following:

Line 14 column 15 in BAD_CONSTRAINT4 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_constraint4.e):
         loc: AUX_CONSTRAINT4[ANY,STRING]
              ^                          
Line 4 column 23 in AUX_CONSTRAINT4 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_constraint4.e):
class AUX_CONSTRAINT4[X_ -> Y_, Y_]
                      ^            
------
