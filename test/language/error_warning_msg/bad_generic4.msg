****** Fatal Error: Class LINKED_LIST is a generic class (missing
actual generic).

The source lines relevant to this message are the following:

Line 17 column 18 in BAD_GENERIC4 (/home/persocad/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_generic4.e):
         create {LINKED_LIST} m.make;
                 ^                   
Line 4 column 18 in LINKED_LIST (/home/persocad/Workspace/Dev/Liberty/src/lib/storage/collection/linked_list.e):
class LINKED_LIST[E_]
                 ^   
------
