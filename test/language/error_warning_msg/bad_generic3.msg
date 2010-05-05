****** Fatal Error: Wrong number of generic arguments (compare
usage and definition below).

The source lines involved by the message are the following:

Line 4 column 37 in AUX_GENERIC3B (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_generic3b.e):
class AUX_GENERIC3B[G->ANY] inherit AUX_GENERIC3A[G] end -- class AUX_GENERIC3B
                                    ^                                          
Line 4 column 29 in AUX_GENERIC3A (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_generic3a.e):
deferred class AUX_GENERIC3A[G,K] 
                            ^     
------
