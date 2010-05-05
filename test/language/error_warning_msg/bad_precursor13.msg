****** Fatal Error: Cannot pass `bidule' which is of type REAL_64
into formal type NUMERIC.

The source lines involved by the message are the following:

Line 18 column 14 in BAD_PRECURSOR13 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_precursor13.e):
         Precursor(bidule)
                   ^      
Line 7 column 15 in AUX_PRECURSOR13 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_precursor13.e):
   foo (bidule: NUMERIC) is
                ^          
------
