****** Fatal Error: Cannot pass `h.item' which is of type AUX_JW01NAMED_THING
into formal type ABSTRACT_STRING.

The source lines relevant to this message are the following:

Line 18 column 26 in BAD_JW02 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_jw02.e):
         io.put_string(h.item);
                         ^     
Line 66 column 19 in OUTPUT_STREAM_TOOLS (/home/cadrian/Workspace/Dev/Liberty/src/lib/io/low_level/output_stream_tools.e):
   put_string (s: ABSTRACT_STRING)
                  ^               
------
