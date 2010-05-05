****** Fatal Error: Class COLLECTION is a generic class (missing
actual generic).

The source lines involved by the message are the following:

Line 6 column 9 in BAD_INHERIT5 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_inherit5.e):
inherit COLLECTION;
        ^          
Line 3 column 26 in COLLECTION (/home/colnet/SmartEiffel/lib/storage/./collection.e):
deferred class COLLECTION[E_]
                         ^   
------
