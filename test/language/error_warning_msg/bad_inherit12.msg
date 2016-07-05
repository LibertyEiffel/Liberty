****** Fatal Error: In type AUX_INHERIT12_D, features "bar" and
"foo" come from the same original feature via multiple "inherit"
paths.
Below, you get the feature evolution step by step. Note that in
the end (type AUX_INHERIT12_D) there are two versions of the same
initial feature with two different names. To fix this, either
use an "insert" link in place of one of the "inherit" links or
rename the feature to get the same name in AUX_INHERIT12_D type.

First "inherit" path (from top to bottom):
   `foo' in AUX_INHERIT12_A
      inherited as `bar' in AUX_INHERIT12_C
      inherited as `bar' in AUX_INHERIT12_D

Second "inherit" path (from top to bottom):
   `foo' in AUX_INHERIT12_A
      inherited as `foo' in AUX_INHERIT12_D

------
