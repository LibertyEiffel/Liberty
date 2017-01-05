-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PERL5_REGULAR_EXPRESSION_BUILDER

inherit
   POSIX_REGULAR_EXPRESSION_BUILDER
      redefine emit_repeat, parse_alternative, parse_group, parse_escaped, parse_union_factor, read_character, read_integer,
         set_default_options
      end

create {ANY}
   make

feature {ANY} -- options
   has_extended_legibility: BOOLEAN
         -- Is the extended legibility active?

   has_extended_ligibility: BOOLEAN
      obsolete "Use `has_extended_legibility' instead."
      do
         Result := has_extended_legibility
      end

   set_extended_legibility
         -- Activate extended legibility.
      do
         has_extended_legibility := True
      ensure
         definition: has_extended_legibility = True
      end

   set_extended_ligibility
      obsolete "Use `set_extended_legibility' instead."
      do
         set_extended_legibility
      ensure
         definition: has_extended_legibility = True
      end

   set_no_extended_legibility
         -- Deactivate extended legibility.
      do
         has_extended_legibility := False
      ensure
         definition: has_extended_legibility = False
      end

   set_no_extended_ligibility
      obsolete "Use `set_no_extended_legibility' instead."
      do
         set_no_extended_legibility
      ensure
         definition: has_extended_legibility = False
      end

   set_default_options
         -- Set the default options
      do
         Precursor
         set_no_extended_legibility
      ensure then
         not has_extended_legibility
      end

feature {PERL5_REGULAR_EXPRESSION_BUILDER} -- scanning
   has_unterminated_comment: BOOLEAN
         -- was an unterminated comment sequence (?#... detected

   skip_blanks_and_comments
         -- Skips the blanks and comments when the extended legibility
         -- option is set.
      require
         has_no_error: not has_error
      local
         stop: BOOLEAN
      do
         from
         until
            end_of_input or else stop
         loop
            if last_character = '(' and then expression.valid_index(position + 2) and then expression.item(position + 1) = '?' and then expression.item(position + 2) = '#' then
               from
                  goto_position(position + 3)
               until
                  end_of_input or else stop
               loop
                  stop := last_character = ')'
                  goto_position(position + 1)
               end
               has_unterminated_comment := not stop
               stop := False
            elseif has_extended_legibility then
               inspect
                  last_character
               when ' ', '%T', '%N', '%R' then
                  goto_position(position + 1)
               when '#' then
                  from
                     goto_position(position + 1)
                  until
                     end_of_input or else last_character = '%N'
                  loop
                     goto_position(position + 1)
                  end
               else
                  stop := True
               end
            else
               stop := True
            end
         end
      ensure
         has_no_error: not has_error
      end

feature {BACKTRACKING_REGULAR_EXPRESSION_BUILDER} -- parsing
   read_character
         -- Goto to the next character that is not a blank or a comment.
      do
         Precursor
         skip_blanks_and_comments
      end

   read_integer
         -- Reads in 'last_integer' the current integer values and
         -- then goto to the next character that is not a blank or a comment.
      do
         Precursor
         skip_blanks_and_comments
      end

   emit_repeat (mini, maxi: INTEGER)
         -- Takes the top of the stack and replace it with
         -- a construction that will evaluate the repeating of
         -- it from 'mini' to 'maxi' times.
         -- If current character is '?' it means that the repeat
         -- is not greedy.
      do
         if not end_of_input and then last_character = '?' then
            read_character
            set_not_greedy
         end
         Precursor(mini, maxi)
         set_greedy
      end

feature {POSIX_REGULAR_EXPRESSION_BUILDER} -- parsing
   parse_alternative
      local
         saved_is_case_insensitive, saved_does_match_line_boundary, saved_does_any_match_newline,
         saved_has_extended_legibility: BOOLEAN
      do
         has_unterminated_comment := False
         saved_is_case_insensitive := is_case_insensitive
         saved_does_match_line_boundary := does_match_line_boundary
         saved_does_any_match_newline := does_any_match_newline
         saved_has_extended_legibility := has_extended_legibility
         Precursor
         is_case_insensitive := saved_is_case_insensitive
         does_match_line_boundary := saved_does_match_line_boundary
         does_any_match_newline := saved_does_any_match_newline
         has_extended_legibility := saved_has_extended_legibility
         if has_unterminated_comment then
            set_error(once "unterminated comment sequence (?#...")
         end
      end

   parse_group
         -- Parses a group. A group is either a POSIX group
         -- or an extended pattern group.
      local
         saved_is_case_insensitive, saved_does_match_line_boundary, saved_does_any_match_newline,
         saved_has_extended_legibility: BOOLEAN
      do
         if valid_next_character and then next_character = '?' then
            parse_extended_pattern
         else
            saved_is_case_insensitive := is_case_insensitive
            saved_does_match_line_boundary := does_match_line_boundary
            saved_does_any_match_newline := does_any_match_newline
            saved_has_extended_legibility := has_extended_legibility
            Precursor
            is_case_insensitive := saved_is_case_insensitive
            does_match_line_boundary := saved_does_match_line_boundary
            does_any_match_newline := saved_does_any_match_newline
            has_extended_legibility := saved_has_extended_legibility
         end
      end

   parse_escaped
         -- Parses an escaped character.
         -- escaped     ::= '\' CHARACTER
      do
         internal_parse_escaped(False)
         if not has_error then
            emit_recorded
         end
      end

   parse_union_factor
         -- Parses a union factor.
         -- union_factor::= '[.' TEXT '.]' | '[:' CLASS ':]' | '[:<:]' | '[:>:]' | CHARACTER
      local
         not_class: BOOLEAN
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
                     if last_string.first = '^' then
                        last_string.remove_first
                        not_class := True
                     end
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
                     if not_class and then not has_error then
                        emit(recorded_item)
                        emit_not_then_any
                        set_recorded_item(unemit)
                     end
                  end
               when '=' then
                  set_error(once "unimplemented class expression '[=....=]'")
               else
                  set_recorded_character('[')
               end
            end
         when '\' then
            internal_parse_escaped(True)
         else
            set_recorded_character(last_character)
            read_character
         end
      end

feature {} -- parsing
   internal_parse_escaped (in_union: BOOLEAN)
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         begin_with_escape: last_character = '\'
      do
         read_character
         if end_of_input then
            set_error(once "invalid '\' at the end of the expression")
         elseif in_union then
            inspect
               last_character
            when 'b', 'B', 'A', 'Z', 'z', '0' .. '9', '<', '>' then
               set_error(once "prohibited in unions")
            else
            end
         end
         if not has_error then
            inspect
               last_character
            when 'b', 'B' then
               -- word boundary or not
               begin_collect
               emit(the_begin_of_word_item)
               emit(the_end_of_word_item)
               end_collect_or
               if last_character = 'B' then
                  emit_not
               end
               set_recorded_item(unemit)
               read_character
            when '<' then
               -- begin of word
               set_recorded_item(the_begin_of_word_item)
               read_character
            when '>' then
               -- end of word
               set_recorded_item(the_end_of_word_item)
               read_character
            when 'A' then
               -- begin of text
               set_recorded_item(the_begin_of_text_item)
               read_character
            when 'Z' then
               -- end of text
               set_recorded_item(the_end_of_text_item)
               read_character
            when 'z' then
               -- end of text
               set_recorded_item(the_real_end_of_text_item)
               read_character
            when 'w', 'W' then
               -- word or not word
               emit(the_is_posix_word_item)
               if last_character = 'W' then
                  emit_not_then_any
               end
               set_recorded_item(unemit)
               read_character
            when 's', 'S' then
               -- space or not space
               emit(the_is_posix_space_item)
               if last_character = 'S' then
                  emit_not_then_any
               end
               set_recorded_item(unemit)
               read_character
            when 'd', 'D' then
               -- space or not space
               emit(the_is_posix_digit_item)
               if last_character = 'D' then
                  emit_not_then_any
               end
               set_recorded_item(unemit)
               read_character
            when '0' .. '9' then
               -- backtrack match
               read_integer
               if last_integer.in_range(1, last_group_count) and then not group_stack.has(last_integer) then
                  emit_match_previous_group(last_integer)
                  set_recorded_item(unemit)
               else
                  set_error(once "unsupported forward group number")
               end
            when 'p' then
               -- positive POSIX indication
               read_character
               parse_posix_indication
               if not has_error then
                  set_recorded_item(unemit)
               end
            when 'P' then
               -- negative POSIX indication
               read_character
               parse_posix_indication
               if not has_error then
                  emit_not_then_any
                  set_recorded_item(unemit)
               end
            else
               set_recorded_character(last_character)
               read_character
            end
         end
      end

   parse_posix_indication
      do
         if end_of_input then
            set_error(once "class missing in \p or \P construct")
         else
            inspect
               last_character
            when '{' then
               from
                  last_string.clear_count
                  read_character
               until
                  end_of_input or else last_character = '}'
               loop
                  last_string.add_last(last_character)
                  read_character
               end
               if end_of_input then
                  set_error(once "unmatched '{'")
               else
                  if not has_named_perl_item(last_string) then
                     set_error(once "invalid perl class name")
                  else
                     emit(named_perl_item(last_string))
                     read_character
                  end
               end
            else
               set_error(once "currently, only \p{..} or \P{..} construct is allowed")
            end
         end
      end

   parse_extended_pattern
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         begin_with_open_parenthesis: last_character = '('
         followed_with_question_mark: valid_next_character and next_character = '?'
      local
         dont_restore, saved_is_case_insensitive, saved_does_match_line_boundary, saved_does_any_match_newline,
         saved_has_extended_legibility: BOOLEAN
      do
         -- skip known characters
         read_character
         read_character
         -- save the state of the flags
         saved_is_case_insensitive := is_case_insensitive
         saved_does_match_line_boundary := does_match_line_boundary
         saved_does_any_match_newline := does_any_match_newline
         saved_has_extended_legibility := has_extended_legibility
         -- read the flags
         read_modifiers(True)
         if not end_of_input and then last_character = '-' then
            read_character
            read_modifiers(False)
         end
         if not end_of_input then
            inspect
               last_character
            when ')' then
               -- flag alteration only
               emit(the_true_node)
               dont_restore := True
            when '#' then
               -- comment
               emit(the_true_node)
               from
               until
                  end_of_input or else last_character = ')'
               loop
                  read_character
               end
            when ':' then
               -- not capturing
               read_character
               if not end_of_input then
                  parse_alternative
               end
            when '=' then
               -- zero width positive look-ahead
               parse_looking(True)
            when '!' then
               -- zero width negative look-ahead
               parse_looking(True)
            when '<' then
               -- zero width look-behind
               read_character
               if not end_of_input then
                  inspect
                     last_character
                  when '=' then
                     -- zero width positive look-behind
                     parse_looking(False)
                  when '!' then
                     -- zero width negative look-behind
                     parse_looking(False)
                  else
                     set_error(once "bad zero width look-behind")
                  end
               end
            when '{', '?', '(', '>' then
               -- unsupported
               set_error(once "unsupported experimental extended pattern")
            else
               set_error(once "unknown extended pattern")
            end
         end
         if not has_error then
            if end_of_input or else last_character /= ')' then
               set_error(once "extended pattern not finished")
            else
               if dont_restore then
               else
                  -- restore the flags
                  is_case_insensitive := saved_is_case_insensitive
                  does_match_line_boundary := saved_does_match_line_boundary
                  does_any_match_newline := saved_does_any_match_newline
                  has_extended_legibility := saved_has_extended_legibility
               end
               read_character
            end
         end
      end

   parse_looking (ahead: BOOLEAN)
      require
         has_no_error: not has_error
         not_at_end: not end_of_input
         begin_with: last_character = '=' or else last_character = '!'
      do
         if is_looking_around then
            set_error(once "nested mix look-ahead / look-behind not implemented")
         else
            is_looking_ahead := ahead
            is_looking_behind := not ahead
            is_looking_positive := last_character = '='
            read_character
            if not end_of_input then
               parse_alternative
               if not has_error then
                  emit_looking
               end
            end
            is_looking_ahead := False
            is_looking_behind := False
         end
      end

   read_modifiers (level: BOOLEAN)
      require
         has_no_error: not has_error
      local
         stop: BOOLEAN
      do
         from
         until
            end_of_input or else stop
         loop
            inspect
               last_character
            when 'i' then
               is_case_insensitive := level
               read_character
            when 'm' then
               does_match_line_boundary := level
               read_character
            when 's' then
               does_any_match_newline := level
               read_character
            when 'x' then
               has_extended_legibility := level
               read_character
            else
               stop := True
            end
         end
      ensure
         has_no_error: not has_error
      end

end -- class PERL5_REGULAR_EXPRESSION_BUILDER
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
