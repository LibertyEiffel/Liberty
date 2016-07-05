****** Fatal Error: In type BAD_INHERIT14, features "o" and "out"
come from the same original feature via multiple "inherit" paths.
Below, you get the feature evolution step by step. Note that in
the end (type BAD_INHERIT14) there are two versions of the same
initial feature with two different names. To fix this, either
use an "insert" link in place of one of the "inherit" links or
rename the feature to get the same name in BAD_INHERIT14 type.

First "inherit" path (from parent to child):
   `out' in ANY
      inherited as `o' in AUX_INHERIT14A
      inherited as `o' in BAD_INHERIT14

Second "inherit" path (from parent to child):
   `out' in ANY
      inherited as `out' in AUX_INHERIT14B
      inherited as `out' in BAD_INHERIT14

------
