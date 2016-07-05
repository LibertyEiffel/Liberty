****** Fatal Error: In type AUX_SELECT9CC, features "aa_f" and
"f" come from the same original feature via multiple "inherit"
paths.
Below, you get the feature evolution step by step. Note that in
the end (type AUX_SELECT9CC) there are two versions of the same
initial feature with two different names. To fix this, either
use an "insert" link in place of one of the "inherit" links or
rename the feature to get the same name in AUX_SELECT9CC type.

First "inherit" path (from parent to child):
   `f' in AUX_SELECT9RR
      inherited as `f' in AUX_SELECT9AA
      inherited as `aa_f' in AUX_SELECT9CC

Second "inherit" path (from parent to child):
   `f' in AUX_SELECT9RR
      inherited as `f' in AUX_SELECT9BB
      inherited as `f' in AUX_SELECT9CC

------
