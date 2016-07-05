****** Error: In type BAD_GENERIC12, features "foo" and "bar"
come from the same original feature via multiple "insert" paths,
but none comes via an "inherit" path.
Below, you get the feature evolution step by step. Note that in
the end (type BAD_GENERIC12) there are two versions of the same
initial feature with two different names. To fix this, either
use enough "inherit" links in place of "insert" links to have
one "inherit" path or rename the feature to get the same name
in BAD_GENERIC12 type.

First "insert" path (from parent to child):
   `print_on' in ANY
      inserted as `foo' in BAD_GENERIC12

Second "insert" path (from parent to child):
   `print_on' in ANY
      inserted as `bar' in BAD_GENERIC12

------
****** Fatal Error: Correct the previous error first.

------
