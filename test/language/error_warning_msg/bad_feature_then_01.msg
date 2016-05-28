****** Fatal Error: Assignment of a reference type into an expanded type is not allowed. Cannot assign `"foo"' which is of type STRING into `Result' which is of type INTEGER_32.

The source lines relevant to this message are the following:

Line 15 columns 4, 22 in BAD_FEATURE_THEN_01 (/home/et/Liberty/test/language/error_warning_msg/bad_feature_then_01.e):
   foo: INTEGER then "foo" end
   ^                 ^        
------
