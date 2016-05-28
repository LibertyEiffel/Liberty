****** Fatal Error: Wrong number of generic arguments (compare
usage and definition below).

The source lines relevant to this message are the following:

Line 12 column 16 in BAD_GENERIC1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_generic1.e):
         dctn: DICTIONARY[INTEGER];
               ^                   
Line 4 column 26 in DICTIONARY (/home/cadrian/Workspace/Dev/Liberty/src/lib/storage/dictionary.e):
deferred class DICTIONARY[V_, K_]
                         ^       
------
