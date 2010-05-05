****** Fatal Error: The local definition in BAD_INHERIT8 (given
first) can't be accepted because a concrete feature is inherited.
What's called a concrete feature here is a feature which is not
deferred. You may consider to add a redefine or an undefine. May
be.

The source lines involved by the message are the following:

Line 68 column 2 in STRING (/home/colnet/SmartEiffel/lib/string/./string.e):
   make, with_capacity (needed_capacity: INTEGER) is
   ^                                                
Line 7 column 4 in BAD_INHERIT8 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inherit8.e):
   STRING
   ^     
Line 13 column 4 in BAD_INHERIT8 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inherit8.e):
   make is do end
   ^             
------
