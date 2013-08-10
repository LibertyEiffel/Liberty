****** Fatal Error: An expanded value can be compared only with
the same other expanded value. Expression `integer_64' is of type
INTEGER_64 while expression `real_64' is of type REAL_64. Comparison
not allowed (VWEQ).

Line 15 column 24 in BAD_EQ5 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_eq5.e):
         if integer_64 = real_64 then -- Yes, rejected because we must truncate_to_real_64 !
                       ^                                                                    
------
