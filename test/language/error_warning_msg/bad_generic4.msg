****** Fatal Error: Class LINKED_LIST is a generic class (missing
actual generic).

The source lines involved by the message are the following:

Line 17 column 11 in BAD_GENERIC4 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_generic4.e):
         !LINKED_LIST!m.make;
          ^                  
Line 4 column 18 in LINKED_LIST (/home/cadrian/Workspace/Dev/Liberty/src/lib/storage/collection/linked_list.e):
class LINKED_LIST[E_]
                 ^   
------
