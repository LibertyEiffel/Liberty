****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to apply a function using the
previous manifest STRING as target).

Line 17 column 26 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := "foo" .to_string                      -- <-- Warning #01 on this line.
                         ^                                                               
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to apply a procedure using the
previous STRING as target).

Line 18 column 16 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         "foo" .print_on(io)                             -- <-- Warning #02 on this line.
               ^                                                                         
------
****** Warning: Added missing brackets to enclose the previous
"once" manifest STRING.

Line 20 column 30 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := once "foo".to_string                  -- <-- Warning #03 on this line.
                             ^                                                           
------
****** Warning: Added missing brackets to enclose the previous
"once" manifest STRING.

Line 21 column 20 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         once "foo".print_on(io)                         -- <-- Warning #04 on this line.
                   ^                                                                     
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to apply a function using the
previous `True' constant as target).

Line 26 column 24 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := True .to_string                       -- <-- Warning #05 on this line.
                       ^                                                                 
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to apply a procedure to the previous
`False' constant as target).

Line 28 column 25 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := False .to_string                      -- <-- Warning #06 on this line.
                        ^                                                                
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a function using the
previous manifest expression as the target).

Line 30 column 22 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := 7 .to_string                          -- <-- Warning #07 on this line.
                     ^                                                                   
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a procedure using the
previous manifest expression as the target).

Line 31 column 12 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         8 .print_on(io)                                 -- <-- Warning #08 on this line.
           ^                                                                             
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a function using the
previous manifest expression as the target).

Line 33 column 36 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := {INTEGER_8 124} .to_string            -- <-- Warning #09 on this line.
                                   ^                                                     
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a procedure using the
previous manifest expression as the target).

Line 34 column 25 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         {INTEGER_64 8} .print_on(io)                    -- <-- Warning #10 on this line.
                        ^                                                                
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a function using the
previous manifest expression as the target).

Line 36 column 25 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := 0xFF .to_string                       -- <-- Warning #11 on this line.
                        ^                                                                
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a procedure using the
previous manifest expression as the target).

Line 37 column 15 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         0x00 .print_on(io)                              -- <-- Warning #12 on this line.
              ^                                                                          
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a function using the
previous manifest expression as the target).

Line 39 column 24 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := 1.5 .to_string                        -- <-- Warning #13 on this line.
                       ^                                                                 
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a procedure using the
previous manifest expression as the target).

Line 40 column 14 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         1.5 .print_on(io)                               -- <-- Warning #14 on this line.
             ^                                                                           
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a function using the
previous manifest expression as the target).

Line 42 column 35 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := {REAL_32 1.5 } .to_string             -- <-- Warning #15 on this line.
                                  ^                                                      
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a procedure using the
previous manifest expression as the target).

Line 43 column 25 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         {REAL_32 1.5 } .print_on(io)                    -- <-- Warning #16 on this line.
                        ^                                                                
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to apply a function using the
previous CHARACTER constant as the target).

Line 45 column 24 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := 'a' .to_string                        -- <-- Warning #17 on this line.
                       ^                                                                 
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to apply a procedure using the
previous CHARACTER constant as the target).

Line 46 column 14 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         'a' .print_on(io)                               -- <-- Warning #18 on this line.
             ^                                                                           
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a function using the
previous manifest expression as the target).

Line 48 column 50 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := {ARRAY[STRING] 1, <<"foo">> } .first  -- <-- Warning #19 on this line.
                                                 ^                                       
------
****** Warning: Removed unexpected blank space(s) just before
this dot (assume you really want to call a procedure using the
previous manifest expression as the target).

Line 49 column 40 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         {ARRAY[STRING] 1, <<"foo">> } .print_on(io)     -- <-- Warning #20 on this line.
                                       ^                                                 
------
****** Fatal Error: Simple identifier expected just after a dot.
Nothing else but a simple feature name is meaningful just after
a dot.

Line 51 column 26 in BAD_CALL7 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_call7.e):
         string := "foo". print_on(io)                   -- <-- Fatal error here.
                         ^                                                       
------
