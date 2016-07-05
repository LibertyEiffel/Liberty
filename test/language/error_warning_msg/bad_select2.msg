****** Fatal Error: In type BAD_SELECT2, features "aux_foo" and
"foo" come from the same original feature via multiple "inherit"
paths.
Below, you get the feature evolution step by step. Note that in
the end (type BAD_SELECT2) there are two versions of the same
initial feature with two different names. To fix this, either
use an "insert" link in place of one of the "inherit" links or
rename the feature to get the same name in BAD_SELECT2 type.

First "inherit" path (from parent to child):
   `foo' in AUX_SELECT
      inherited as `aux_foo' in BAD_SELECT2

Second "inherit" path (from parent to child):
   `foo' in AUX_SELECT
      inherited as `foo' in BAD_SELECT2

------
