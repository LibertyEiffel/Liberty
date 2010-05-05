****** Warning: Expanded classes can be inserted only.

Line 5 column 9 in AUX_ASSIGNMENT2REF (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_assignment2ref.e):
inherit AUX_ASSIGNMENT2EXP
        ^                 
------
****** Fatal Error: Assignment of a reference type into an expanded
type is not allowed. Cannot assign `ref' which is of type AUX_ASSIGNMENT2REF
into `exp' which is of type AUX_ASSIGNMENT2EXP.

The source lines involved by the message are the following:

Line 16 columns 10, 17 in BAD_ASSIGNMENT2 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_assignment2.e):
         exp := ref -- This one is not allowed !
         ^      ^                               
------
