****** Fatal Error: Can't join these two concrete features. What's
called a concrete feature here is a feature which is not deferred.
You may consider to undefine one feature. May be.

The source lines relevant to this message are the following:

Line 214 column 11 in ANY (/home/cadrian/Workspace/Dev/Liberty/src/lib/kernel/any.e):
   frozen print (some: STRING)
          ^                   
Line 7 column 4 in BAD_RENAME3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_rename3.e):
   AUX_RENAME3
   ^          
Line 7 column 11 in AUX_RENAME3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_rename3.e):
   frozen do_nothing
          ^         
------
