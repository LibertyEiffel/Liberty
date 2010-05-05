****** Fatal Error: Cyclic inheritance graph: AUX_INHERIT10B,
BAD_INHERIT10, AUX_INHERIT10A, AUX_INHERIT10B, ...

The source lines involved by the message are the following:

Line 8 column 4 in BAD_INHERIT10 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inherit10.e):
   AUX_INHERIT10A -- (Parent dans le cycle.)
   ^                                        
Line 6 column 4 in AUX_INHERIT10A (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_inherit10a.e):
   AUX_INHERIT10B -- (Parent dans le cycle.)
   ^                                        
Line 6 column 4 in AUX_INHERIT10B (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_inherit10b.e):
   BAD_INHERIT10 -- (Parent dans le cycle.)
   ^                                       
------
