****** Fatal Error: In type BAD_INHERIT11, features "foo" and
"bar" come from the same original feature via multiple "inherit"
paths.
Below, you get the feature evolution step by step. Note that in
the end (type BAD_INHERIT11) there are two versions of the same
initial feature with two different names. To fix this, either
use an "insert" link in place of one of the "inherit" links or
rename the feature to get the same name in BAD_INHERIT11 type.

First "inherit" path (from parent to child):
   `io' in ANY
      inherited as `foo' in BAD_INHERIT11

Second "inherit" path (from parent to child):
   `io' in ANY
      inherited as `bar' in BAD_INHERIT11

------
