****** Fatal Error: Cannot pass `agent io.put_string' which is
of type PROCEDURE[TUPLE[STRING]] into formal type PROCEDURE[TUPLE].

The source lines involved by the message are the following:

Line 12 column 14 in BAD_AGENT11 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_agent11.e):
         foo(agent io.put_string)
             ^                   
Line 15 column 11 in BAD_AGENT11 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_agent11.e):
   foo(p: PROCEDURE[TUPLE]) is
          ^                   
------
