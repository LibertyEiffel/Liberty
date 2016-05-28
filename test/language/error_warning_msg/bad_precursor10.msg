****** Error: This Precursor call is ambiguous because the type
AUX_PRECURSOR10 is inherited more than once.

The source lines relevant to this message are the following:

Line 10 column 4 in BAD_PRECURSOR10 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_precursor10.e):
   AUX_PRECURSOR10 redefine foo end
   ^                               
Line 12 column 4 in BAD_PRECURSOR10 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_precursor10.e):
   AUX_PRECURSOR10 redefine foo end
   ^                               
Line 25 column 21 in BAD_PRECURSOR10 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_precursor10.e):
         Precursor {AUX_PRECURSOR10} -- Is really ambiguous !
                    ^                                        
------
****** Fatal Error: To fix this ambiguous Precursor call you have
to remove direct repeated inheritance. You may thus consider to
add a new class which inherit AUX_PRECURSOR10 in order to use
it as a unique parent qualifier.

Line 25 column 21 in BAD_PRECURSOR10 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_precursor10.e):
         Precursor {AUX_PRECURSOR10} -- Is really ambiguous !
                    ^                                        
------
