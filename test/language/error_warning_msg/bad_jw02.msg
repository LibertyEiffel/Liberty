****** Fatal Error: Cannot pass `h.item' which is of type AUX_JW01NAMED_THING
into formal type STRING.

The source lines involved by the message are the following:

Line 15 column 19 in BAD_JW02 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_jw02.e):
    io.put_string(h.item);
                    ^     
Line 37 column 17 in OUTPUT_STREAM_TOOLS (/home/colnet/SmartEiffel/lib/io/low_level/output_stream_tools.e):
   put_string (s: STRING) is
                  ^         
------
