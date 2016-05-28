****** Fatal Error: Cannot pass `bidule' which is of type REAL_64
into formal type NUMERIC.

The source lines relevant to this message are the following:

Line 18 column 20 in BAD_PRECURSOR13 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_precursor13.e):
         Precursor(bidule)
                   ^      
Line 7 column 17 in AUX_PRECURSOR13 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_precursor13.e):
   foo (bidule: NUMERIC)
                ^       
------
