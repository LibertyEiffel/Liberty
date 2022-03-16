-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class POSIX_REGULAR_EXPRESSION_BUILDER
   --
   -- Parses POSIX regular expressions and build its matchable form
   --
   -- regular-expression ::= alternative
   -- alternative ::= sequence [ '|' sequence ]...
   -- sequence    ::= term [ term ]...
   -- term        ::= factor [ repeat-spec ]
   -- repeat-spec ::= '?' | '*' | '+' | '{' integer [',' [integer]] '}'
   -- factor      ::= group | union | '.' | '^' | '$' | escaped | text
   -- group       ::= '(' alternative ')'
   -- union       ::= '[' union ']'
   -- union       ::= '[' ['^'] union_term... ']'
   -- union_term  ::= union_factor ['-' union_factor]
   -- union_factor::= '[.' TEXT '.]' | '[:' CLASS ':]' | '[:<:]' | '[:>:]' | CHARACTER
   -- escaped     ::= '\' CHARACTER
   -- text        ::= A SEQUENCE NOT FOLLOWED BY EITHER '*', '+', '?', '{' OF NOT ESCAPED CHARACTERS

inherit
   BACKTRACKING_REGULAR_EXPRESSION_BUILDER

create {ANY}
   make

feature {BACKTRACKING_REGULAR_EXPRESSION_BUILDER} -- parsing
   internal_parse
         -- Main parse of a POSIX regular expression.
      do
         if end_of_input then
            set_error(once "empty regular expression")
         else
            set_greedy
            parse_alternative
            if not has_error and then not end_of_input then
               set_error(once "extra character(s) found")
            end
         end
      end

feature {POSIX_REGULAR_EXPRESSION_BUILDER} -- parsing
   parse_alternative
         -- Parses an alternative of sequences.
         -- alternative ::= sequence [ '|' sequence ]...
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
      local
         has_empty: BOOLEAN
      do
         begin_collect
         from
            if last_character = '|' or else last_character = ')' then
               has_empty := True
            else
               parse_sequence
            end
         until
            has_error or else end_of_input or else last_character /= '|'
         loop
            read_character
            if end_of_input or else last_character = '|' or else last_character = ')' then
               has_empty := True
            else
               parse_sequence
            end
         end
         if not has_error then
            if is_collect_empty then
               end_collect_true
               --set_error(once "empty expression is not allowed")
            else
               end_collect_or
               if has_empty then
                  emit_controled_or_true
               end
            end
         end
      ensure
         error_or_stack_incremented_by_one: has_error or else stack.count = old stack.count + 1
         state_known: has_error or else end_of_input or else last_character = ')'
      end

   parse_sequence
         -- Parses a sequence of terms.
         -- sequence ::= term [ term ]...
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         end_excluded: last_character /= '|' and then last_character /= ')'
      do
         begin_collect
         from
            parse_term
         until
            has_error or else end_of_input or else last_character = '|' or else last_character = ')'
         loop
            parse_term
         end
         if not has_error then
            if is_collect_empty then
               --emit(the_true_node)
               set_error(once "empty expression is not allowed")
            else
               end_collect_and
            end
         end
      ensure
         error_or_stack_incremented_by_one: has_error or else stack.count = old stack.count + 1
         state_known: has_error or else end_of_input or else last_character = '|' or else last_character = ')'
      end

   parse_term
         -- Parses a term.
         -- term        ::= factor [ repeat-spec ]
         -- repeat-spec ::= '?' | '*' | '+' | '{' integer [',' [integer]] '}'
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         end_excluded: last_character /= '|' and then last_character /= ')'
      local
         mini, maxi: INTEGER
      do
         parse_factor
         if not has_error and then not end_of_input then
            inspect
               last_character
            when '*' then
               read_character
               emit_repeat(0, Repeat_infiny)
            when '+' then
               read_character
               emit_repeat(1, Repeat_infiny)
            when '?' then
               read_character
               emit_repeat(0, 1)
            when '{' then
               save_position
               read_character
               if end_of_input or else not last_character.is_decimal_digit then
                  restore_saved_position
               else
                  read_integer
                  mini := last_integer
                  if not end_of_input then
                     if last_character /= ',' then
                        maxi := mini
                     else
                        read_character
                        if end_of_input or else not last_character.is_decimal_digit then
                           maxi := Repeat_infiny
                        else
                           read_integer
                           maxi := last_integer
                        end
                     end
                  end
                  if end_of_input or else last_character /= '}' then
                     set_error(once "expected '}' not found")
                  elseif maxi /= Repeat_infiny and then maxi < mini then
                     set_error(once "repeat count error (lower > upper is not allowed)")
                  else
                     read_character
                     emit_repeat(mini, maxi)
                  end
               end
            else
            end
         end
      ensure
         error_or_stack_incremented_by_one: has_error or else stack.count = old stack.count + 1
      end

   parse_factor
         -- Parses a factor.
         -- factor      ::= group | union | '.' | '^' | '$' | escaped | text
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         end_excluded: last_character /= '|' and then last_character /= ')'
      do
         inspect
            last_character
         when '(' then
            parse_group
         when '[' then
            parse_union
         when '.' then
            emit_any_character
            read_character
         when '^' then
            emit_begin_of_line
            read_character
         when '$' then
            emit_end_of_line
            read_character
         when '\' then
            parse_escaped
         when '*', '+', '?', '{' then
            set_error(once "unescaped reserved char")
         else
            parse_text
         end
      ensure
         error_or_stack_incremented_by_one: has_error or else stack.count = old stack.count + 1
      end

   parse_group
         -- Parses a group.
         -- group       ::= '(' alternative ')'
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         begin_with_open_parenthesis: last_character = '('
      do
         read_character
         if not end_of_input then
            prepare_group
            parse_alternative
         end
         if not has_error then
            if end_of_input or else last_character /= ')' then
               set_error(once "expected ')' not found")
            else
               read_character
               emit_group
            end
         end
      ensure
         error_or_stack_incremented_by_one: has_error or else stack.count = old stack.count + 1
      end

   parse_escaped
         -- Parses an escaped character.
         -- escaped     ::= '\' CHARACTER
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         begin_with_escape: last_character = '\'
      do
         read_character
         if end_of_input then
            set_error(once "invalid '\' at the end of the expression")
         else
            emit_match_single(last_character)
            read_character
         end
      ensure
         error_or_stack_incremented_by_one: has_error or else stack.count = old stack.count + 1
      end

   parse_text
         -- Parses a text.
         -- text        ::= A SEQUENCE NOT FOLLOWED BY EITHER '*', '+', '?', '{' OF NOT ESCAPED CHARACTERS
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         current_character_is_valid: valid_last_character and then not (once "([.^$\*+?{").has(last_character)
      local
         stop: BOOLEAN
      do
         from
            last_string.clear_count
            last_string.add_last(last_character)
            read_character
            if not end_of_input then
               inspect
                  last_character
               when '*', '+', '?', '{' then
                  stop := True
               else
               end
            end
         until
            end_of_input or else stop
         loop
            inspect
               last_character
            when '.', '(', ')', '[', '^', '$', '|', '\' then
               stop := True
            else
               if valid_next_character then
                  inspect
                     next_character
                  when '*', '+', '?', '{' then
                     stop := True
                  else
                     last_string.add_last(last_character)
                     read_character
                  end
               else
                  last_string.add_last(last_character)
                  read_character
               end
            end
         end
         check
            last_string.count > 0
         end
         if last_string.count = 1 then
            emit_match_single(last_string.first)
         else
            emit_match_text(last_string)
         end
      ensure
         error_or_stack_incremented_by_one: has_error or else stack.count = old stack.count + 1
      end

   parse_union
         -- Parses a union.
         -- union       ::= '[' ['^'] union_term... ']'
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         begin_with_open_bracket: last_character = '['
      local
         negate: BOOLEAN
      do
         read_character
         if not end_of_input and then last_character = '^' then
            negate := True
            read_character
         end
         if not end_of_input then
            begin_collect
            from
               parse_union_term
            until
               has_error or else end_of_input or else last_character = ']'
            loop
               parse_union_term
            end
         end
         if not has_error then
            if end_of_input then
               set_error(once "expected ']' not found")
            else
               end_collect_or
               check
                  last_character = ']'
               end
               read_character
               if negate then
                  emit_not_then_any
               end
            end
         end
      ensure
         error_or_stack_incremented_by_one: has_error or else stack.count = old stack.count + 1
      end

feature {POSIX_REGULAR_EXPRESSION_BUILDER} -- sub parts of union
   parse_union_term
         -- Parses a union term.
         -- union_term  ::= union_factor ['-' union_factor]
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
      local
         mini, maxi: CHARACTER
      do
         parse_union_factor
         if not has_error then
            if end_of_input or else last_character /= '-' or else valid_next_character and then next_character = ']' then
               emit_recorded
            else
               if recorded_item /= Void then
                  set_error(once "first factor of an interval must be a single character")
               else
                  read_character
                  if end_of_input then
                     set_error(once "unterminated interval")
                  else
                     mini := recorded_character
                     parse_union_factor
                     if not has_error then
                        if recorded_item /= Void then
                           set_error(once "second factor of an interval must be a single character")
                        else
                           maxi := recorded_character
                           if mini > maxi then
                              set_error(once "invalid interval because the first factor has a character code greater than the last factor one")
                           else
                              emit_match_range(mini, maxi)
                           end
                        end
                     end
                  end
               end
            end
         end
      ensure
         error_or_stack_incremented_by_one: has_error or else stack.count = old stack.count + 1
      end

   parse_union_factor
         -- Parses a union factor.
         -- union_factor::= '[.' TEXT '.]' | '[:' CLASS ':]' | '[:<:]' | '[:>:]' | CHARACTER
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
      do
         inspect
            last_character
         when '[' then
            read_character
            if end_of_input then
               set_recorded_character('[')
            else
               inspect
                  last_character
               when '.' then
                  read_embedded
                  if not has_error then
                     inspect
                        last_string.count
                     when 0 then
                        set_error(once "empty merge list")
                     when 1 then
                        set_recorded_character(last_string.first)
                     else
                        emit_match_text(last_string)
                        set_recorded_item(unemit)
                     end
                  end
               when ':' then
                  read_embedded
                  if not has_error then
                     inspect
                        last_string
                     when "<" then
                        set_recorded_item(the_begin_of_word_item)
                     when ">" then
                        set_recorded_item(the_end_of_word_item)
                     else
                        if has_named_posix_item(last_string) then
                           set_recorded_item(named_posix_item(last_string))
                        else
                           set_error(once "unkwon posix class")
                        end
                     end
                  end
               when '=' then
                  set_error(once "unimplemented class expression '[=....=]'")
               else
                  set_recorded_character('[')
               end
            end
         else
            set_recorded_character(last_character)
            read_character
         end
      end

   read_embedded
         -- Parses the text embedded in one of '[.' TEXT '.]',
         -- '[:' TEXT ':]' or '[=' TEXT '=]'.
         -- The parsed text is put in feature 'last_string'.
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         previous_character_is_open_brace: valid_previous_character and then previous_character = '['
         current_character_is_valid: valid_last_character and then (once ".:=").has(last_character)
      local
         tag: CHARACTER; stop: BOOLEAN
      do
         from
            last_string.clear_count
            tag := last_character
            read_character
         until
            stop
         loop
            from
            until
               end_of_input or else last_character = tag
            loop
               last_string.add_last(last_character)
               read_character
            end
            if end_of_input then
               set_error(once "unmatched '[.' or '[:' or '[='")
               stop := True
            else
               read_character
               if not end_of_input then
                  if last_character = ']' then
                     read_character
                     stop := True
                  else
                     last_string.add_last(tag)
                  end
               end
            end
         end
      end

   recorded_character: CHARACTER
         -- Last union_factor's character recorded.

   recorded_item: BACKTRACKING_NODE
         -- Last union_factor's item (complex expression) recorded.

   set_recorded_character (value: CHARACTER)
         -- Records the union_factor's character 'value'.
      do
         recorded_item := Void
         recorded_character := value
      ensure
         recorded_item = Void
         recorded_character = value
      end

   set_recorded_item (value: BACKTRACKING_NODE)
         -- Records the union_factor's item (complex expression) 'value'.
      require
         item_not_void: value /= Void
      do
         recorded_item := value
      ensure
         recorded_item /= Void
         recorded_item = value
      end

   emit_recorded
         -- Emits the last union_factor's recorded character or item,
         -- depending on its kind.
      do
         if recorded_item = Void then
            emit_match_single(recorded_character)
         else
            emit(recorded_item)
         end
      ensure
         incremented_by_one: stack.count = old stack.count + 1
      end

end -- class POSIX_REGULAR_EXPRESSION_BUILDER
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
