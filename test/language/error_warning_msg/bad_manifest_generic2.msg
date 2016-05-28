****** Fatal Error: Class BAD_MANIFEST_GENERIC2 not correctly
equiped for manifest generic creation (`manifest_creation' missing
in the creation clause).

The source lines relevant to this message are the following:

Line 6 column 1 in BAD_MANIFEST_GENERIC2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_manifest_generic2.e):
create {}
^        
Line 14 column 17 in BAD_MANIFEST_GENERIC2 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_manifest_generic2.e):
         foo := {BAD_MANIFEST_GENERIC2 << "class", "not", "equiped" >> }
                ^                                                       
------
