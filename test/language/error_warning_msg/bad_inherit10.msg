****** Fatal Error: Cyclic inheritance graph: AUX_INHERIT10B,
BAD_INHERIT10, AUX_INHERIT10A, AUX_INHERIT10B, ...

The source lines relevant to this message are the following:

Line 9 column 4 in BAD_INHERIT10 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_inherit10.e):
   AUX_INHERIT10A -- (Parent dans le cycle.)
   ^                                        
Line 6 column 4 in AUX_INHERIT10A (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_inherit10a.e):
   AUX_INHERIT10B -- (Parent dans le cycle.)
   ^                                        
Line 6 column 4 in AUX_INHERIT10B (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_inherit10b.e):
   BAD_INHERIT10 -- (Parent dans le cycle.)
   ^                                       
------
