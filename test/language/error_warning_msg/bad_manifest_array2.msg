****** Warning: Actually, `Void' has no accurate type. Keep in
mind that `Void' is just a way to denote the default value for
a type or to denote the lack of an object. One can use `Void'
as the left-hand-side of an assignment or to replace some actual
argument. (See "http://SmartEiffel.loria.fr/wiki/en/index.php/Void"
for details.) At time being, the type ANY will be used for this
occurrence `Void'. Please update your code with a more accurate
expression, may be by adding an extra non-initialized local variable.

Line 10 column 11 in BAD_MANIFEST_ARRAY2 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_manifest_array2.e):
         if (<< Void , Void >>) = Void then
                ^                          
------
****** Fatal Error: Cannot create an ARRAY with only `Void' items.

Line 10 column 8 in BAD_MANIFEST_ARRAY2 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_manifest_array2.e):
         if (<< Void , Void >>) = Void then
             ^                             
------
