****** Fatal Error:  Bad assignment. Cannot assign `["foo", "bar"]'
which is of type TUPLE[STRING,STRING] into `any' which is of type
TUPLE[STRING,STRING,ANY].

The source lines relevant to this message are the following:

Line 15 columns 10, 17 in BAD_ASSIGNMENT3 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_assignment3.e):
         any := ["foo", "bar"]
         ^      ^             
------
