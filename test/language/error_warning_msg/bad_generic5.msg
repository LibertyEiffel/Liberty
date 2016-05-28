****** Warning: A formal generic argument should not use the name
of some existing class (VCFG).

The source lines relevant to this message are the following:

Line 4 column 16 in COMPARABLE (/home/cadrian/Workspace/Dev/Liberty/src/lib/abilities/comparable.e):
deferred class COMPARABLE
               ^         
Line 4 column 20 in AUX_GENERIC5 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_generic5.e):
class AUX_GENERIC5[COMPARABLE]
                   ^          
------
****** Warning: You should consider using another name for this
formal generic argument. The common usage is to add an extra trailing
underscore character (see for example COLLECTION, ARRAY or DICTIONARY).

Line 4 column 20 in AUX_GENERIC5 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/aux_generic5.e):
class AUX_GENERIC5[COMPARABLE]
                   ^          
------
****** 2 warnings.
