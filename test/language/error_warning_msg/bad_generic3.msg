****** Fatal Error: Wrong number of generic arguments (compare
usage and definition below).

The source lines relevant to this message are the following:

Line 4 column 38 in AUX_GENERIC3B (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_generic3b.e):
class AUX_GENERIC3B[G_->ANY] inherit AUX_GENERIC3A[G_] end -- class AUX_GENERIC3B
                                     ^                                           
Line 4 column 29 in AUX_GENERIC3A (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_generic3a.e):
deferred class AUX_GENERIC3A[G_,K_]
                            ^      
------
