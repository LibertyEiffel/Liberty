****** Fatal Error: Class COLLECTION is a generic class (missing
actual generic).

The source lines involved by the message are the following:

Line 6 column 9 in BAD_INHERIT1 (/home/colnet/SmartEiffel/work/lib_test3/bad_inherit1.e):
inherit COLLECTION;
        ^          
Line 3 column 26 in COLLECTION (/home/colnet/SmartEiffel/lib/storage/collection.e):
deferred class COLLECTION[E_]
                         ^   
------
