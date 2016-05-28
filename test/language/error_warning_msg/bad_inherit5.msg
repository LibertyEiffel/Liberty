****** Fatal Error: Class COLLECTION is a generic class (missing
actual generic).

The source lines relevant to this message are the following:

Line 6 column 9 in BAD_INHERIT5 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_inherit5.e):
inherit COLLECTION;
        ^          
Line 4 column 26 in COLLECTION (/home/cadrian/Workspace/Dev/Liberty/src/lib/storage/collection.e):
deferred class COLLECTION[E_]
                         ^   
------
