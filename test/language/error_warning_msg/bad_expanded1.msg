****** Fatal Error: Cannot pass `clock' which is of type MICROSECOND_TIME
into formal type TIME.

The source lines involved by the message are the following:

Line 19 column 20 in BAD_EXPANDED1 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_expanded1.e):
      golden_call( clock )
                   ^      
Line 22 column 26 in BAD_EXPANDED1 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_expanded1.e):
  golden_call( p_clock : TIME ) is
                         ^        
------
