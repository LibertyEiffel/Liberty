****** Fatal Error: The value is already part of previously encountered
slice. (Wrong inspect statement.)

The source lines involved by the message are the following:

Line 14 column 8 in BAD_INSPECT8 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inspect8.e):
    when 1 .. 3 then
         ^          
Line 15 column 8 in BAD_INSPECT8 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inspect8.e):
    when 2 then -- Second occurrence !
         ^                            
------
