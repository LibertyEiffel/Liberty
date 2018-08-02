-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PYTHON_REGULAR_EXPRESSION_BUILDER

inherit
   PERL5_REGULAR_EXPRESSION_BUILDER
      redefine parse_extended_pattern
      end

create {ANY}
   make

feature {} -- parsing
   parse_extended_pattern
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
            when 'P' then
               parse_named_group
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

   parse_named_group
      local
         group_name: FIXED_STRING; group_id: INTEGER
      do
         read_character
         if not end_of_input then
            inspect
               last_character
            when '=' then
               -- backtrack match by name
               from
                  last_string.clear_count
                  read_character
               until
                  end_of_input or else last_character = ')'
               loop
                  last_string.add_last(last_character)
                  read_character
               end
               if end_of_input or else last_string.is_empty then
                  set_error(once "premature end of group name")
               else
                  group_name := last_string.intern
                  if last_substrings_names.fast_has(group_name) then
                     group_id := last_substrings_names.fast_at(group_name)
                     check
                        group_id.in_range(1, last_group_count)
                     end
                     if group_stack.has(group_id) then
                        set_error(once "unsupported forward group number")
                     else
                        emit_match_previous_group(group_id)
                     end
                  else
                     set_error(once "undefined named group")
                  end
               end
            when '<' then
               -- new named group
               from
                  last_string.clear_count
                  read_character
               until
                  end_of_input or else last_character = '>' or else last_character = ')'
               loop
                  last_string.add_last(last_character)
                  read_character
               end
               if end_of_input or else last_character = ')' or else last_string.is_empty then
                  set_error(once "unfinished group name")
               else
                  group_name := last_string.intern
                  if last_substrings_names.fast_has(group_name) then
                     set_error(once "duplicate group name")
                  else
                     check
                        last_character = '>'
                     end
                     read_character
                     prepare_group
                     group_id := last_group_count
                     parse_alternative
                     if not has_error then
                        emit_group
                        if not has_error then
                           last_substrings_names.add(group_id, group_name)
                        end
                     end
                  end
               end
            else
               set_error(once "unknown character following a ?P grouping")
            end
         end
      ensure
         error_or_stack_incremented_by_one: has_error or else stack.count = old stack.count + 1
      end

end -- class PYTHON_REGULAR_EXPRESSION_BUILDER
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
