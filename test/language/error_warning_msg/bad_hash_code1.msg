****** Error: Actual generic derivation AUX_HASH_CODE1 must insert
HASHABLE which is the generic constraint.

The source lines relevant to this message are the following:

Line 13 column 13 in BAD_HASH_CODE1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_hash_code1.e):
         d: HASHED_DICTIONARY[INTEGER,AUX_HASH_CODE1]
            ^                                        
Line 4 column 35 in HASHED_DICTIONARY (/home/cadrian/Workspace/Dev/Liberty/src/lib/storage/dictionary/hashed_dictionary.e):
class HASHED_DICTIONARY[V_, K_ -> HASHABLE]
                                  ^        
------
****** Fatal Error:  Constraint Generic Violation.

The source lines relevant to this message are the following:

Line 13 column 13 in BAD_HASH_CODE1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_hash_code1.e):
         d: HASHED_DICTIONARY[INTEGER,AUX_HASH_CODE1]
            ^                                        
Line 4 column 29 in HASHED_DICTIONARY (/home/cadrian/Workspace/Dev/Liberty/src/lib/storage/dictionary/hashed_dictionary.e):
class HASHED_DICTIONARY[V_, K_ -> HASHABLE]
                            ^              
------
