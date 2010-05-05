****** Fatal Error: Unknown feature `does_not_exist' in type STRING.
(For this call, the target `{STRING}' is of type STRING.)

The source lines involved by the message are the following:

Line 14 column 30 in BAD_CREATE9 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_create9.e):
         string := create {STRING}.does_not_exist
                                   ^             
------
