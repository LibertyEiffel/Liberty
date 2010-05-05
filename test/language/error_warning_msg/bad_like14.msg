****** Fatal Error: Type mark "like <argument>" must not reference
another "like <argument>" type mark. (One level of indirection
is always possible and always better ;-)

The source lines involved by the message are the following:

Line 14 column 15 in BAD_LIKE14 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_like14.e):
   method (foo: like zoo; zoo: INTEGER) is
                ^                         
Line 16 column 9 in BAD_LIKE14 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_like14.e):
         bar: like foo
              ^       
------
