class MANIFEST_NOTATION
   --
   -- To know more or to discover manifest notation syntax and semantic, you
   -- can just read this file, or even better, run this code under our debugger:
   --
   --           se c -sedb manifest_notation -o manifest_notation
   --           ./manifest_notation

create {ANY}
   make

feature {}
   boolean_examples
         -- Examples of notations for the BOOLEAN type.
      local
         boolean: BOOLEAN
      do
         -- Simply True or False:
         boolean := True

         boolean := False

         check
            True -- Is always correct.
         end
      end

   character_examples
         -- Examples of notations for the CHARACTER type.
      local
         character: CHARACTER
      do
         -- The ordinary notation:
         character := 'a'
         character := 'b'
         character := 'c'
         character := 'A'
         character := 'B'
         character := 'C'
         character := '.'
         character := '+'
         character := '-'
         -- The new_line character:

         character := '%N'
         -- The tab character:

         character := '%T'
         -- The default initialization value:

         character := '%U'
         -- The percent itself:

         character := '%%'
         -- The simple quote:

         character := '%''
         -- The double quote:

         character := '%"'

         check
         -- The At-sign  (just in case you have a strange keyboard ;-)
            '@' = '%A'
         end
         -- The Backspace:
         character := '%B'

         check
         -- Circumflex (just in case you have a strange keyboard ;-)
            '^' = '%C'
         end
         check
         -- The dollar sign (just in case you have a strange keyboard ;-)
            '$' = '%D'
         end
         -- The Form feed:
         character := '%F'

         check
         -- The backslasH (just in case you have a strange keyboard ;-)
            '\' = '%H'
         end
         check
         -- The tiLda (just in case you have a strange keyboard ;-)
            '~' = '%L'
         end
         check
         -- The back Quote
            '`' = '%Q'
         end
         -- The carriage Return
         character := '%R'

         check
         -- The Sharp (just in case you have a strange keyboard ;-)
            '#' = '%S'
         end
         check
         -- The Vertical bar (just in case you have a strange keyboard ;-)
            '|' = '%V'
         end
         check
         -- The opening bracket (just in case you have a strange keyboard ;-)
            '[' = '%('
         end
         check
         -- The closing bracket (just in case you have a strange keyboard ;-)
            ']' = '%)'
         end
         check
         -- The opening brace (just in case you have a strange keyboard ;-)
            '{' = '%<'
         end
         check
         -- The closing brace (just in case you have a strange keyboard ;-)
            '}' = '%>'
         end
         -- The decimal ascii notation:
         character := '%/97/' -- is equivalent to 'a'
         character := '%/32/' -- is equivalent to ' '
         character := '%/0/'
         -- is equivalent to '%U' (which is the default initialization value)
         -- The hexadecimal notation:

         character := '%/0x30/' -- is equivalent to '0'
         character := '%/0x31/' -- is equivalent to '1'
         character := '%/0x32/' -- is equivalent to '2'
         character := '%/0x00/' -- is equivalent to '%U'
      end

   string_examples
         -- Examples of notations for the STRING type.
      local
         string: STRING
      do
         string := "Hello!"
         string := "The escape percent for new-line %N (try to print it).%N"

         string := "The escape percent for tab: %T <- its a tab%N"

         string := "As you may guess %% <- its a percent"

         string := "As you may guess %" <- its a double quote !"

         string := "When the string is too long you%
                   %can continue on more than one line"

         string := "{
         Look this verbatim two lines string using
         our debugger !

         }"

         string := "[
         Look left-aligned verbatim string using
         our debugger !

         ]"

         string := "{
         No escape percent in %T verbatim
         %N strings !
         ... cool.
         }"
         -- Hexadecimal notation is available too:

         string := "One %/0x43414645/ pl%/0x65/ase"
         sedb_breakpoint
         -- Use the -sedb option to view the string !
         -- Finally, keep in mind that "once" can precede the STRING
         -- notation to avoid multiple allocations:

         string := once "I am allocated once even when used inside a loop !"
      end

   unicode_string_examples
         -- Examples of notations for the UNICODE_STRING type.
      local
         unicode_string: UNICODE_STRING
      do
         unicode_string := U"I am not a STRING, but a UNICODE_STRING !"
         unicode_string := U"<- the big U indicates that."

         unicode_string := U"{
         As for STRING, you can write UNICODE_STRING on
         more
         than
         one
         line with the verbatim notation.

         }"
         -- Inside UNICODE_STRING only, you have the Ux notation to denote
         -- any character you want (http://www.unicode.org):

         unicode_string := U"The EURO sign is %/Ux20AC/!%N"
      end

   integer_examples
      local
         integer_8: INTEGER_8; integer_16: INTEGER_16; integer_32: INTEGER_32; integer_64: INTEGER_64
         integer: INTEGER
      do
         -- 0 is of type INTEGER_8:
         integer_8 := 0
         -- The minimum value for INTEGER_8:

         integer_8 := -128
         -- The maximum value for INTEGER_8:

         integer_8 := 127

         inspect
            integer_8
         when -128 .. 127 then
            -- The INTEGER_8 range
            -- We should always go here...
         else
            check
               False -- ... and never here !
            end
         end
         -- The INTEGER_16 range:
         integer_16 := -32768
         integer_16 := 32767
         -- The INTEGER_32 range:

         integer_32 := -2147483648
         integer_32 := 2147483647
         -- INTEGER is, at time being, equivalent to INTEGER_32:

         integer := integer_32
         integer := 0
         integer_32 := integer
         -- INTEGER_64 range:

         integer_64 := -9223372036854775808
         integer_64 := 9223372036854775807
         -- Now using the hexadecimal notation to denote INTEGER.
         -- A 2 hexadecimal digit denote an INTEGER_8.
         -- Setting all bits of an INTEGER_8 is achieved with:

         integer_8 := 0xFF
         check
            integer_8 = -1
         end
         -- A 4 hexadecimal digit denote an INTEGER_16.
         -- As an example, the greater positive value for an INTEGER_16 is:

         integer_16 := 0x7FFF
         check
            integer_16 = 32767
         end
         -- A 8 hexadecimal digit denote an INTEGER_32.
         -- As an example, the smallest negative value for an INTEGER_32 is:

         integer_32 := 0x80000000
         check
            integer_32 = -2147483648
         end
         -- A 16 hexadecimal digit denote an INTEGER_64.
         -- The `Maximum_integer_64':

         integer_64 := 0x7FFFFFFFFFFFFFFF
         check
            integer_64 = 9223372036854775807
         end
         -- The `Minimum_integer_64':
         integer_64 := 0x8000000000000000
         check
            integer_64 = -9223372036854775808
         end
         -- When you need to do so, the complete type notation can also be used for all kinds
         -- of INTEGERs:

         integer_32 := {INTEGER_32 1}
         check
            integer_32 = 1
         end
         integer_16 := {INTEGER_16 0xFFFF}
         check
            integer_16 = -1
         end
      end

   real_examples
      local
         real_32: REAL_32; real_64: REAL_64; real: REAL; real_extended: REAL_EXTENDED
      do
         -- At time being, REAL is equivalent of REAL_64. The classic notation always
         -- denote a REAL (i.e. a REAL_64):
         real := 0.0
         real_64 := 0.0
         check
            real = real_64
         end
         real_64 := 35.5
         -- The scientific notation is possible too:

         real_64 := 3.55e+1
         check
            real_64 = 35.5
         end
         -- You can omit the fractional part when using scientific notation:
         check
            3E2 = 300.0
         end
         -- In order to denote a REAL_32, you must always rely on the explicit following notation:
         real_32 := {REAL_32 1.5}
         real_32 := {REAL_32 156.5E-2}
         -- You can as well denote REAL_80, REAL_128 or REAL_EXTENDED:

         real_extended := {REAL_EXTENDED 156.5E-287}
      end

   array_examples
      local
         array_of_character: ARRAY[CHARACTER]; array_of_integer: ARRAY[INTEGER]
      do
         -- A four elements ARRAY[CHARACTER] with the lower bound set to 1:
         array_of_character := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd', 'e' >> }
         -- A three elements ARRAY[INTEGER] with the lower bound set to -1:

         array_of_integer := {ARRAY[INTEGER] -1, << 1, 2, 3 >> }
      end

   fast_array_examples
      local
         fast_array_of_character: FAST_ARRAY[CHARACTER]; fast_array_of_integer: FAST_ARRAY[INTEGER]
      do
         -- A four elements FAST_ARRAY[CHARACTER]:
         fast_array_of_character := {FAST_ARRAY[CHARACTER] << 'a', 'b', 'c', 'd', 'e' >> }
         -- A three elements FAST_ARRAY[INTEGER]:

         fast_array_of_integer := {FAST_ARRAY[INTEGER] << 1, 2, 3 >> }
      end

   linked_list_examples
      local
         linked_list_of_character: LINKED_LIST[CHARACTER]; linked_list_of_integer: LINKED_LIST[INTEGER]
      do
         -- A four elements LINKED_LIST[CHARACTER]:
         linked_list_of_character := {LINKED_LIST[CHARACTER] << 'a', 'b', 'c', 'd', 'e' >> }
         -- A three elements LINKED_LIST[INTEGER]:

         linked_list_of_integer := {LINKED_LIST[INTEGER] << 1, 2, 3 >> }
      end

   two_way_linked_list_examples
      local
         two_way_linked_list_of_character: TWO_WAY_LINKED_LIST[CHARACTER]
         two_way_linked_list_of_integer: TWO_WAY_LINKED_LIST[INTEGER]
      do
         -- A four elements TWO_WAY_LINKED_LIST[CHARACTER]:
         two_way_linked_list_of_character := {TWO_WAY_LINKED_LIST[CHARACTER] << 'a', 'b', 'c', 'd', 'e' >> }
         -- A three elements TWO_WAY_LINKED_LIST[INTEGER]:

         two_way_linked_list_of_integer := {TWO_WAY_LINKED_LIST[INTEGER] << 1, 2, 3 >> }
      end

   ring_array_examples
      local
         ring_array_of_character: RING_ARRAY[CHARACTER]; ring_array_of_integer: RING_ARRAY[INTEGER]
      do
         -- A four elements RING_ARRAY[CHARACTER]:
         ring_array_of_character := {RING_ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd', 'e' >> }
         -- A three elements RING_ARRAY[INTEGER]:

         ring_array_of_integer := {RING_ARRAY[INTEGER] 1, << 1, 2, 3 >> }
      end

   set_examples
      local
         set_of_character: SET[CHARACTER]; set_of_integer: SET[INTEGER]
      do
         -- A four elements HASHED_SET[CHARACTER]:
         set_of_character := {HASHED_SET[CHARACTER] << 'a', 'b', 'c', 'd', 'e', 'f' >> }
         -- A three elements HASHED_SET[INTEGER]:

         set_of_integer := {AVL_SET[INTEGER] << 1, 2, 3 >> }
      end

   dictionary_examples
      local
         dictionary: DICTIONARY[CHARACTER, STRING]
      do
         -- You can as well denote a DICTIONARY creation like this:
         dictionary := {HASHED_DICTIONARY[CHARACTER, STRING] << 'a', "key #1";
                                                                'z', "key #2";
                                                                'z', "key #3";
                                                                'a', "key #4" >> }
         -- Note that the ; (semicolon) is here to separate pairs.
      end

   bijective_dictionary_examples
      local
         bijective_dictionary: BIJECTIVE_DICTIONARY[STRING, STRING]
      do
         -- You can as well denote a DICTIONARY creation like this:
         bijective_dictionary := {HASHED_BIJECTIVE_DICTIONARY[STRING, STRING] << "value #1", "key #1";
                                                                                 "value #2", "key #2";
                                                                                 "value #3", "key #3" >> }
         -- Note that the ; (semicolon) is here to separate pairs.
      end

   array2_examples
      local
         collection2: COLLECTION2[CHARACTER]
      do
         collection2 := {ARRAY2[CHARACTER] 1, 4, 1, 6, << 'a', 'b', 'c', 'd', 'e', 'f';
                                                          'a', 'b', 'c', 'd', 'e', 'f';
                                                          'a', 'b', 'c', 'd', 'e', 'f';
                                                          'a', 'b', 'c', 'd', 'e', 'f' >> }
      end

   fast_array2_examples
      local
         collection2: COLLECTION2[CHARACTER]
      do
         collection2 := {FAST_ARRAY2[CHARACTER] 4, 6, << 'a', 'b', 'c', 'd', 'e', 'f';
                                                         'a', 'b', 'c', 'd', 'e', 'f';
                                                         'a', 'b', 'c', 'd', 'e', 'f';
                                                         'a', 'b', 'c', 'd', 'e', 'f' >> }
      end

   native_array_examples
      local
         native_array_character: NATIVE_ARRAY[CHARACTER]; native_array_integer_8: NATIVE_ARRAY[INTEGER_8]
      do
         native_array_character := {NATIVE_ARRAY[CHARACTER] << 'a', 'b', 'c', 'd', 'e', 'f' >> }
         check
            native_array_character.item(0) = 'a'
            native_array_character.item(5) = 'f'
         end
         native_array_integer_8 := {NATIVE_ARRAY[INTEGER_8] << 0, 1, 2, 3, 4, 5, 6, 7, 8 >> }
      end

   make
      do
         boolean_examples
         character_examples
         string_examples
         unicode_string_examples
         integer_examples
         real_examples
         array_examples
         fast_array_examples
         linked_list_examples
         two_way_linked_list_examples
         ring_array_examples
         set_examples
         dictionary_examples
         bijective_dictionary_examples
         array2_examples
         fast_array2_examples
         native_array_examples
      end

end -- class MANIFEST_NOTATION
