-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class REGULAR_EXPRESSION_ITEM_GLOBALS
   --
   -- common invariant nodes and POSIX classes naming
   --

inherit
   BACKTRACKING_NODE_GLOBALS

feature {ANY} -- assertions
   the_any_character_item: REGULAR_EXPRESSION_ITEM_ANY
      once
         create Result
      end

   the_not_end_of_line_item: REGULAR_EXPRESSION_ITEM_NOT_END_OF_LINE
      once
         create Result
      end

   the_begin_of_line_item: REGULAR_EXPRESSION_ITEM_BEGIN_OF_LINE
      once
         create Result
      end

   the_end_of_line_item: REGULAR_EXPRESSION_ITEM_END_OF_LINE
      once
         create Result
      end

   the_begin_of_text_item: REGULAR_EXPRESSION_ITEM_BEGIN_OF_TEXT
      once
         create Result
      end

   the_real_end_of_text_item: REGULAR_EXPRESSION_ITEM_END_OF_TEXT
      once
         create Result.make(True)
      end

   the_end_of_text_item: REGULAR_EXPRESSION_ITEM_END_OF_TEXT
      once
         create Result.make(False)
      end

   the_begin_of_word_item: REGULAR_EXPRESSION_ITEM_BEGIN_OF_WORD
      once
         create Result
      end

   the_end_of_word_item: REGULAR_EXPRESSION_ITEM_END_OF_WORD
      once
         create Result
      end

feature {ANY} -- character classes
   the_is_posix_alnum_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_ALNUM
      once
         create Result
      end

   the_is_posix_alpha_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_ALPHA
      once
         create Result
      end

   the_is_posix_ascii_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_ASCII
      once
         create Result
      end

   the_is_posix_blank_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_BLANK
      once
         create Result
      end

   the_is_posix_cntrl_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_CNTRL
      once
         create Result
      end

   the_is_posix_digit_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_DIGIT
      once
         create Result
      end

   the_is_posix_graph_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_GRAPH
      once
         create Result
      end

   the_is_posix_lower_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_LOWER
      once
         create Result
      end

   the_is_posix_print_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_PRINT
      once
         create Result
      end

   the_is_posix_punct_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_PUNCT
      once
         create Result
      end

   the_is_posix_space_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_SPACE
      once
         create Result
      end

   the_is_posix_upper_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_UPPER
      once
         create Result
      end

   the_is_posix_word_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_WORD
      once
         create Result
      end

   the_is_posix_xdigit_item: REGULAR_EXPRESSION_ITEM_IS_POSIX_XDIGIT
      once
         create Result
      end

feature {ANY} -- character class naming
   has_named_posix_item (name: STRING): BOOLEAN
         -- True if 'name' is for a valid POSIX character class
      require
         name_not_void: name /= Void
      do
         Result := internal_named_posix_item(name) /= Void
      end

   named_posix_item (name: STRING): REGULAR_EXPRESSION_ITEM
         -- the item for the valid POSIX character class 'name'
      require
         name_not_void: name /= Void
         good_name: has_named_posix_item(name)
      do
         Result := internal_named_posix_item(name)
      ensure
         good_result: Result /= Void
      end

   has_named_perl_item (name: STRING): BOOLEAN
         -- True if 'name' is for a valid Perl character class
      require
         name_not_void: name /= Void
      do
         Result := internal_named_perl_item(name) /= Void
      end

   named_perl_item (name: STRING): REGULAR_EXPRESSION_ITEM
         -- the item for the valid Perl character class 'name'
      require
         name_not_void: name /= Void
         good_name: has_named_perl_item(name)
      do
         Result := internal_named_perl_item(name)
      ensure
         good_result: Result /= Void
      end

feature {}
   internal_named_posix_item (name: STRING): REGULAR_EXPRESSION_ITEM
         -- the item for a presumed POSIX character class 'name'
      require
         name_not_void: name /= Void
      do
         inspect
            name
         when "alnum" then
            Result := the_is_posix_alnum_item
         when "alpha" then
            Result := the_is_posix_alpha_item
         when "ascii" then
            Result := the_is_posix_ascii_item
         when "blank" then
            Result := the_is_posix_blank_item
         when "cntrl" then
            Result := the_is_posix_cntrl_item
         when "digit" then
            Result := the_is_posix_digit_item
         when "graph" then
            Result := the_is_posix_graph_item
         when "lower" then
            Result := the_is_posix_lower_item
         when "print" then
            Result := the_is_posix_print_item
         when "punct" then
            Result := the_is_posix_punct_item
         when "space" then
            Result := the_is_posix_space_item
         when "upper" then
            Result := the_is_posix_upper_item
         when "word" then
            Result := the_is_posix_word_item
         when "xdigit" then
            Result := the_is_posix_xdigit_item
         else
         end
      end

   internal_named_perl_item (name: STRING): REGULAR_EXPRESSION_ITEM
         -- the item for a presumed Perl character class 'name'
      require
         name_not_void: name /= Void
      do
         inspect
            name
         when "IsAlnum" then
            Result := the_is_posix_alnum_item
         when "IsAlpha" then
            Result := the_is_posix_alpha_item
         when "IsASCII" then
            Result := the_is_posix_ascii_item
            --when "blank" then Result := the_is_posix_blank_item
         when "IsCntrl" then
            Result := the_is_posix_cntrl_item
         when "IsDigit" then
            Result := the_is_posix_digit_item
         when "IsGraph" then
            Result := the_is_posix_graph_item
         when "IsLower" then
            Result := the_is_posix_lower_item
         when "IsPrint" then
            Result := the_is_posix_print_item
         when "IsPunct" then
            Result := the_is_posix_punct_item
         when "IsSpace", "IsSpacePerl" then
            Result := the_is_posix_space_item
         when "IsUpper" then
            Result := the_is_posix_upper_item
         when "IsWord" then
            Result := the_is_posix_word_item
         when "IsXDigit" then
            Result := the_is_posix_xdigit_item
         else
         end
      end

end -- class REGULAR_EXPRESSION_ITEM_GLOBALS
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
