****** Error: In type BAD_REDEFINE16, features "bar1" and "bar2"
come from the same original feature via multiple "insert" paths,
but none comes via an "inherit" path.
Below, you get the feature evolution step by step. Note that in
the end (type BAD_REDEFINE16) there are two versions of the same
initial feature with two different names. To fix this, either
use enough "inherit" links in place of "insert" links to have
one "inherit" path or rename the feature to get the same name
in BAD_REDEFINE16 type.

First "insert" path (from parent to child):
   `bar' in AUX_REDEFINE16
      inserted as `bar1' in BAD_REDEFINE16

Second "insert" path (from parent to child):
   `bar' in AUX_REDEFINE16
      inserted as `bar2' in BAD_REDEFINE16

------
****** Fatal Error: Correct the previous error first.

------
