****** Error: A formal generic argument must not use the name
of some existing class.

The source lines involved by the message are the following:

Line 3 column 16 in COMPARABLE (/home/colnet/SmartEiffel/lib/abilities/comparable.e):
deferred class COMPARABLE
               ^         
Line 4 column 20 in AUX_GENERIC5 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_generic5.e):
class AUX_GENERIC5[COMPARABLE]
                   ^          
------
****** Fatal Error: You have to use another name for this formal
generic argument. The common usage is to add an extra trailing
underscore character (see for example COLLECTION, ARRAY or DICTIONARY).

Line 4 column 20 in AUX_GENERIC5 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/aux_generic5.e):
class AUX_GENERIC5[COMPARABLE]
                   ^          
------
