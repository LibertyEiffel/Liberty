****** Error: The old manifest ARRAY notation can only be used
when the common type mark for all items of the manifest ARRAY
exists, is not ambiguous and is easy to compute! By the way, it
is not easy or possible to compute the most general type for the
following set of types: {INTEGER_8, STRING}. See the next error
message.

Line 12 column 14 in BAD_MANIFEST_ARRAY1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_manifest_array1.e):
         if (<< "foo" , 3 >>) = Void then
             ^                           
------
****** Fatal Error: This obsolete manifest ARRAY creation is no
longer supported. See our "tutorial/manifest_notation.e"
in order to use the new notation.

Line 12 column 14 in BAD_MANIFEST_ARRAY1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_manifest_array1.e):
         if (<< "foo" , 3 >>) = Void then
             ^                           
------
