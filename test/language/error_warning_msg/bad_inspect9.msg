****** Fatal Error: Overlapping slices. (Wrong inspect statement.)

The source lines involved by the message are the following:

Line 14 column 8 in BAD_INSPECT9 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inspect9.e):
    when 1 .. 3 then
         ^          
Line 15 column 8 in BAD_INSPECT9 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inspect9.e):
    when 3 .. 4 then -- Overlapped slice !
         ^                                
------
