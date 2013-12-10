****** Fatal Error: Cannot pass `Current' which is of type BAD_COPY1
into formal type AUX_COPY1.

The source lines involved by the message are the following:

Line 97 column 17 in ANY (/home/persocad/Workspace/Dev/Liberty/src/lib/kernel/any.e):
   copy (other: like Current) is
                ^               
Line 16 column 19 in BAD_COPY1 (/home/persocad/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_copy1.e):
         aux.copy(Current);
                  ^        
------
