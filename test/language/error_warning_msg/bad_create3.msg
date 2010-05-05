****** Error: Procedure "default_create" does not belong to a
creation clause of AUX_CREATE3. This creation call is thus not
allowed.

The source lines involved by the message are the following:

Line 12 column 2 in ANY (/home/colnet/SmartEiffel/lib/kernel/any.e):
   default_create is
   ^                
Line 14 column 10 in BAD_CREATE3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_create3.e):
         create aux
         ^         
------
****** Fatal Error: Creation clause exists for type AUX_CREATE3
and the default creation procedure (see `default_create' in class
ANY) is not allowed. You must use one of the available creation
procedure here.

The source lines involved by the message are the following:

Line 14 column 10 in BAD_CREATE3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_create3.e):
         create aux
         ^         
Line 7 column 4 in AUX_CREATE3 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_create3.e):
   make
   ^   
------
