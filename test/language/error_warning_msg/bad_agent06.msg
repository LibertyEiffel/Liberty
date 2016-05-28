****** Fatal Error: Cannot pass `[6]' which is of type TUPLE[INTEGER_8]
into formal type TUPLE[CHARACTER].

The source lines relevant to this message are the following:

Line 15 column 17 in BAD_AGENT06 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_agent06.e):
         p.call([6]);
                ^    
Line 19 column 13 in FUNCTION (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/function.e):
   call (o: O_)
            ^  
------
