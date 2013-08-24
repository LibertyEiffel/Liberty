****** Error: Invalid unicode notation (see also http://www.unicode.org
as well as feature {UNICODE_STRING}.valid_unicode).

Line 15 column 27 in BAD_UNICODE_STRING1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_unicode_string1.e):
         s := "Hi %/UxFFFF/"
                          ^ 
------
****** Error: Too long hexadecimal sequence for a single unicode
value.

Line 16 column 32 in BAD_UNICODE_STRING1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_unicode_string1.e):
         s := "Hi %/Ux0000FFFF0/"
                               ^ 
------
****** Error: Unexpected character in hexadecimal unicode.

Line 17 column 20 in BAD_UNICODE_STRING1 (/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_unicode_string1.e):
         s := "%/Ux/"
                   ^ 
------
****** 3 errors.
Load class "/home/cadrian/Workspace/Dev/Liberty/test/language/error_warning_msg/bad_unicode_string1.e" aborted.
****** Fatal Error: Unable to load class "BAD_UNICODE_STRING1".

------
