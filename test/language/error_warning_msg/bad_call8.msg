****** Fatal Error: Unknown feature `to_integer_32' in type REAL.
(For this call, the target `(toto * p_scalaire).rounded' is of
type REAL.)

The source lines relevant to this message are the following:

Line 20 columns 38, 46 in BAD_CALL8 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call8.e):
         toto := (toto * p_scalaire).rounded.to_integer_32
                                     ^       ^            
------
