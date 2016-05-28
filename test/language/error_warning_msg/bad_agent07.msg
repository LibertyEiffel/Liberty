****** Fatal Error: Cannot pass `[]' which is of type TUPLE into
formal type TUPLE[CHARACTER].

The source lines relevant to this message are the following:

Line 15 column 17 in BAD_AGENT07 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent07.e):
         p.call([]);
                ^   
Line 19 column 13 in FUNCTION (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/function.e):
   call (o: O_)
            ^  
------
