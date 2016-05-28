****** Fatal Error: The local definition in BAD_INHERIT8 (given
first) can't be accepted because a concrete feature is inherited.
What's called a concrete feature here is a feature which is not
deferred. You may consider to add a redefine or an undefine. May
be.

The source lines relevant to this message are the following:

Line 17 column 4 in STRING (/home/cadrian/Workspace/Dev/Liberty/src/lib/string/string.e):
   make, with_capacity (needed_capacity: INTEGER)
   ^                                             
Line 7 column 4 in BAD_INHERIT8 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_inherit8.e):
   STRING
   ^     
Line 12 column 4 in BAD_INHERIT8 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_inherit8.e):
   make do end
   ^          
------
