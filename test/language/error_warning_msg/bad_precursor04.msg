****** Fatal Error: Cannot pass `'A'' which is of type CHARACTER
into formal type INTEGER_32.

The source lines relevant to this message are the following:

Line 23 column 20 in BAD_PRECURSOR04 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_precursor04.e):
         Precursor('A');
                   ^    
Line 7 column 15 in AUX_PRECURSOR04 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_precursor04.e):
   routine(i: INTEGER)
              ^       
------
