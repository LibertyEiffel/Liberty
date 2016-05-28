****** Fatal Error: Unknown feature `does_not_exist' in type STRING.
(For this call, the target `{STRING}' is of type STRING.)

The source lines relevant to this message are the following:

Line 14 column 36 in BAD_CREATE9 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_create9.e):
         string := create {STRING}.does_not_exist
                                   ^             
------
