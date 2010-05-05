****** Error: Actual generic derivation AUX_HASH_CODE1 must insert
HASHABLE which is the generic constraint.

The source lines involved by the message are the following:

Line 11 column 6 in BAD_HASH_CODE1 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_hash_code1.e):
    d: HASHED_DICTIONARY[INTEGER,AUX_HASH_CODE1]
       ^                                        
Line 3 column 35 in HASHED_DICTIONARY (/home/colnet/SmartEiffel/lib/storage/dictionary/hashed_dictionary.e):
class HASHED_DICTIONARY[V_, K_ -> HASHABLE]
                                  ^        
------
****** Fatal Error:  Constraint Generic Violation.

The source lines involved by the message are the following:

Line 11 column 6 in BAD_HASH_CODE1 (/home/colnet/SmartEiffel/test_suite/language/error_warning_msg/bad_hash_code1.e):
    d: HASHED_DICTIONARY[INTEGER,AUX_HASH_CODE1]
       ^                                        
Line 3 column 29 in HASHED_DICTIONARY (/home/colnet/SmartEiffel/lib/storage/dictionary/hashed_dictionary.e):
class HASHED_DICTIONARY[V_, K_ -> HASHABLE]
                            ^              
------
