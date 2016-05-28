****** Fatal Error: Cannot pass `clock' which is of type MICROSECOND_TIME
into formal type TIME.

The source lines relevant to this message are the following:

Line 17 column 23 in BAD_EXPANDED1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_expanded1.e):
         golden_call( clock )
                      ^      
Line 20 column 27 in BAD_EXPANDED1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_expanded1.e):
   golden_call( p_clock : TIME )
                          ^     
------
