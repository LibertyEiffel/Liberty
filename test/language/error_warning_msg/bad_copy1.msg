****** Fatal Error: Cannot pass `Current' which is of type BAD_COPY1
into formal type AUX_COPY1.

The source lines involved by the message are the following:

Line 88 column 15 in ANY (/home/colnet/SmartEiffel/lib/kernel/any.e):
   copy (other: like Current) is
                ^               
Line 15 column 12 in BAD_COPY1 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_copy1.e):
    aux.copy(Current);
             ^        
------
