****** Fatal Error: Class LINKED_LIST is a generic class (missing
actual generic).

The source lines involved by the message are the following:

Line 16 column 4 in BAD_GENERIC4 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_generic4.e):
    !LINKED_LIST!m.make;
     ^                  
Line 3 column 18 in LINKED_LIST (/home/colnet/SmartEiffel/lib/storage/collection/linked_list.e):
class LINKED_LIST[E_]
                 ^   
------
