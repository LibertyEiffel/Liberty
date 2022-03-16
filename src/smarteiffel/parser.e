-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class PARSER
   --
   -- To share some features among parsers (actually the
   -- EIFFEL_PARSER, the ACE parser and the INI_PARSER).
   --

inherit
   ANY

insert
   PLATFORM
   GLOBALS

feature {}
   line, column: INTEGER
         -- Current `line' number and current `column' number.

   current_line: STRING
         -- Current line string of `text'.

   cc: CHARACTER
         -- Current character in the `current_line'.

   pos (l, c: INTEGER): POSITION
         -- Initialize a new one at line `l' and column `c'.
      require
         l >= 1
         c >= 1
      deferred
      end

   end_of_text: CHARACTER '%/0/'
         -- Flag of the end of the `text'.

   update_last_manifest_string (p: POSITION; once_flag, unicode_flag: BOOLEAN; string: STRING; source_view: STRING)
      deferred
      end

   may_expand_var
         -- Expand an environment variable in curly brackets into
         -- buffer, if variable expansion is active. Else just append
         -- '$' to buffer.
      deferred
      end

   last_manifest_string: MANIFEST_STRING

   S_somewhere_inside_manifest_string:   INTEGER_8 0
   S_just_after_a_percent_character:     INTEGER_8 1
   S_extended_form_at_end_of_line:       INTEGER_8 2
   S_extended_form_at_beginning_of_line: INTEGER_8 3
   S_inside_ascii_code_after_slash:      INTEGER_8 4
   S_inside_ascii_code_after_slash_0x:   INTEGER_8 5
   S_inside_unicode_after_slash_ux:      INTEGER_8 6
   S_after_multiline_open_square:        INTEGER_8 7
   S_after_multiline_open_curly:         INTEGER_8 8
   S_inside_multiline_closing:           INTEGER_8 9
   --
   S_end_of_correct_manifest_string:     INTEGER_8 10
   S_error_in_manifest_string:           INTEGER_8 11

   a_manifest_string (skip_comments_flag: BOOLEAN): BOOLEAN
      local
         state, l, c: INTEGER; once_flag, unicode_flag, stop, source_view_flag: BOOLEAN
         ascii_code, unicode, digit_count: INTEGER; source_view: STRING
         multi_line_end: STRING; left_alignment, current_alignment: INTEGER
         source_view_start_line, source_view_start_column: INTEGER
         source_view_end_line, source_view_end_column: INTEGER
      do
         l := line
         c := column
         if a_keyword(fz_once) then
            once_flag := True
         end
         if cc = 'U' then
            unicode_flag := True
            next_char
         end
         if cc = '%"' then
            Result := True
            if smart_eiffel.short_or_class_check_flag or else smart_eiffel.pretty_flag then
               source_view_flag := True
               source_view_start_line := line
               source_view_start_column := column
            end
            from
               buffer.clear_count
            until
               state >= S_end_of_correct_manifest_string
            loop
               next_char
               inspect
                  state
               when S_somewhere_inside_manifest_string then
                  inspect
                     cc
                  when '%N' then
                     from
                     until
                        multi_line_end /= Void
                     loop
                        if buffer.is_empty then
                           error_handler.add_position(current_position)
                           error_handler.append(em8)
                           error_handler.print_as_fatal_error
                        else
                           inspect
                              buffer.last
                           when ' ', '%T' then
                              buffer.remove_last
                              error_handler.add_position(current_position)
                              error_handler.append(em42)
                              error_handler.print_as_warning
                           when '{', '[' then
                              multi_line_end := once "]foo%""
                              multi_line_end.clear_count
                              if buffer.last = '{' then
                                 multi_line_end.extend('}')
                                 left_alignment := 1
                                 state := S_after_multiline_open_curly
                              else
                                 multi_line_end.extend(']')
                                 state := S_after_multiline_open_square
                              end
                              multi_line_end.append(buffer)
                              current_alignment := 1
                              multi_line_end.remove_last
                              multi_line_end.extend('%"')
                              buffer.clear_count
                           else
                              error_handler.add_position(current_position)
                              error_handler.append(em8)
                              error_handler.print_as_fatal_error
                           end
                        end
                     end
                  when '%"' then
                     state := S_error_in_manifest_string
                  when '%%' then
                     state := S_just_after_a_percent_character
                  when '$' then
                     may_expand_var
                  else
                     buffer.extend(cc)
                  end
               when S_just_after_a_percent_character then
                  state := S_somewhere_inside_manifest_string
                  inspect
                     cc
                  when '%N' then
                     state := S_extended_form_at_beginning_of_line
                  when 'A' then
                     buffer.extend('%A')
                  when 'B' then
                     buffer.extend('%B')
                  when 'C' then
                     buffer.extend('%C')
                  when 'D' then
                     buffer.extend('%D')
                  when 'F' then
                     buffer.extend('%F')
                  when 'H' then
                     buffer.extend('%H')
                  when 'L' then
                     buffer.extend('%L')
                  when 'N' then
                     buffer.extend('%N')
                  when 'Q' then
                     buffer.extend('%Q')
                  when 'R' then
                     buffer.extend('%R')
                  when 'S' then
                     buffer.extend('%S')
                  when 'T' then
                     buffer.extend('%T')
                  when 'U' then
                     buffer.extend('%U')
                  when 'V' then
                     buffer.extend('%V')
                  when '%%' then
                     buffer.extend('%%')
                  when '%'' then
                     buffer.extend('%'')
                  when '%"' then
                     buffer.extend('%"')
                  when '(' then
                     buffer.extend('%(')
                  when ')' then
                     buffer.extend('%)')
                  when '<' then
                     buffer.extend('%<')
                  when '>' then
                     buffer.extend('%>')
                  when '/' then
                     ascii_code := 0
                     digit_count := 0
                     state := S_inside_ascii_code_after_slash
                  when ' ', '%T' then
                     state := S_extended_form_at_end_of_line
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(em37)
                     error_handler.print_as_fatal_error
                  end
               when S_extended_form_at_end_of_line then
                  inspect
                     cc
                  when '%N' then
                     state := S_extended_form_at_beginning_of_line
                  when ' ', '%T' then
                     error_handler.add_position(current_position)
                     error_handler.append(em42)
                     error_handler.print_as_warning
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(once "In extended form of manifest string. Bad character after '%%'.")
                     error_handler.print_as_fatal_error
                  end
               when S_extended_form_at_beginning_of_line then
                  inspect
                     cc
                  when ' ', '%T' then
                  when '%%' then
                     state := S_somewhere_inside_manifest_string
                  when '%N' then
                     error_handler.add_position(current_position)
                     error_handler.append(em8)
                     error_handler.print_as_fatal_error
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(once "In extended form of manifest string. Bad character before '%%'.")
                     error_handler.print_as_fatal_error
                  end
               when S_inside_ascii_code_after_slash then
                  inspect
                     cc
                  when '0' .. '9' then
                     digit_count := digit_count + 1
                     ascii_code := ascii_code * 10 + cc.decimal_value
                  when 'x' then
                     if digit_count = 1 and then ascii_code = 0 then
                        digit_count := 0
                        state := S_inside_ascii_code_after_slash_0x
                     else
                        error_handler.add_position(current_position)
                        error_handler.append(em38)
                        error_handler.print_as_fatal_error
                     end
                  when 'U' then
                     if digit_count = 0 then
                        next_char
                        if cc = 'x' then
                           state := S_inside_unicode_after_slash_ux
                           unicode := 0
                           digit_count := 0
                        else
                           error_handler.add_position(current_position)
                           error_handler.append(em38)
                           error_handler.print_as_fatal_error
                        end
                     else
                        error_handler.add_position(current_position)
                        error_handler.append(em38)
                        error_handler.print_as_fatal_error
                     end
                  when '/' then
                     buffer.extend(ascii_code.to_character)
                     state := S_somewhere_inside_manifest_string
                     if digit_count = 0 then
                        error_handler.add_position(current_position)
                        error_handler.append(em39)
                        error_handler.print_as_error
                     elseif ascii_code > Maximum_character_code then
                        ascii_code := 0
                        error_handler.add_position(current_position)
                        error_handler.append(em40)
                        error_handler.print_as_error
                     end
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(em38)
                     error_handler.print_as_fatal_error
                  end
               when S_inside_ascii_code_after_slash_0x then
                  if cc.is_hexadecimal_digit then
                     ascii_code := ascii_code * 16 + cc.hexadecimal_value
                     digit_count := digit_count + 1
                     if digit_count.is_even then
                        buffer.extend(ascii_code.to_character)
                        ascii_code := 0
                     end
                  elseif cc = '/' then
                     state := S_somewhere_inside_manifest_string
                     if digit_count = 0 then
                        error_handler.add_position(current_position)
                        error_handler.append(em45)
                        error_handler.print_as_error
                     elseif digit_count.is_odd then
                        error_handler.add_position(current_position)
                        error_handler.append(once "You must use an even number of hexadecimal %
                        %digits to denote a sequence of CHARACTERs.")
                        error_handler.print_as_error
                     end
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(em45)
                     error_handler.print_as_fatal_error
                  end
               when S_inside_unicode_after_slash_ux then
                  if cc.is_hexadecimal_digit then
                     unicode := unicode * 16 + cc.hexadecimal_value
                     digit_count := digit_count + 1
                  elseif cc = '/' then
                     state := S_somewhere_inside_manifest_string
                     if digit_count = 0 then
                        error_handler.add_position(current_position)
                        error_handler.append(em46)
                        error_handler.print_as_error
                     elseif digit_count > 8 then
                        error_handler.add_position(current_position)
                        error_handler.append(once "Too long hexadecimal sequence %
                        %for a single unicode value.")
                        error_handler.print_as_error
                     else
                        unicode_string_buffer.clear_count
                        if unicode_string_buffer.valid_unicode(unicode) then
                           unicode_string_buffer.add_last(unicode)
                           unicode_string_buffer.utf8_encode_in(buffer)
                        else
                           error_handler.add_position(current_position)
                           error_handler.append(once "Invalid unicode notation (see also http://%
                               %www.unicode.org as well as feature %
                                                %{UNICODE_STRING}.valid_unicode).")
                           error_handler.print_as_error
                        end
                     end
                  else
                     error_handler.add_position(current_position)
                     error_handler.append(em46)
                     error_handler.print_as_fatal_error
                  end
               when S_after_multiline_open_square then
                  check
                     left_alignment = 0
                  end
                  inspect
                     cc
                  when ' ', '%T' then
                     current_alignment := current_alignment + 1
                  when '%N' then
                     buffer.extend('%N')
                     current_alignment := 1
                  when end_of_text then
                     error_handler.add_position(pos(l, c))
                     error_handler.add_position(current_position)
                     error_handler.append(em41)
                     error_handler.print_as_fatal_error
                  else
                     buffer.extend(cc)
                     if left_alignment = 0 then
                        left_alignment := current_alignment
                     end
                     state := S_after_multiline_open_curly
                  end
               when S_after_multiline_open_curly then
                  current_alignment := current_alignment + 1
                  inspect
                     cc
                  when ' ', '%T' then
                     if current_alignment >= left_alignment then
                        buffer.extend(cc)
                     end
                  when '%N' then
                     buffer.extend(cc)
                     current_alignment := 0
                  when end_of_text then
                     error_handler.add_position(pos(l, c))
                     error_handler.add_position(current_position)
                     error_handler.append(em41)
                     error_handler.print_as_fatal_error
                  when '%"' then
                     buffer.extend(cc)
                     if buffer.has_suffix(multi_line_end) then
                        state := S_end_of_correct_manifest_string
                     end
                  else
                     if current_alignment < left_alignment then
                        if cc = multi_line_end.first then
                           buffer.extend(cc)
                           state := S_inside_multiline_closing
                        else
                           error_handler.add_position(pos(l, c))
                           error_handler.add_position(current_position)
                           error_handler.append(em41)
                           error_handler.print_as_fatal_error
                        end
                     else
                        buffer.extend(cc)
                     end
                  end
               when S_inside_multiline_closing then
                  inspect
                     cc
                  when end_of_text then
                     error_handler.add_position(pos(l, c))
                     error_handler.add_position(current_position)
                     error_handler.append(em41)
                     error_handler.print_as_fatal_error
                  when '%"' then
                     buffer.extend(cc)
                     if buffer.has_suffix(multi_line_end) then
                        state := S_end_of_correct_manifest_string
                     end
                  else
                     buffer.extend(cc)
                  end
               end
            end
            if state = S_end_of_correct_manifest_string then
               -- Good verbatim string.
               buffer.remove_suffix(multi_line_end)
               from
               until
                  stop
               loop
                  if buffer.is_empty then
                     stop := True
                  else
                     stop := buffer.last = '%N'
                     buffer.remove_last
                  end
               end
            end
            if source_view_flag then
               source_view := once "..............................................."
               source_view.clear_count
               source_view_end_line := line
               source_view_end_column := column
               from
                  go_back_at(source_view_start_line, source_view_start_column)
               until
                  line = source_view_end_line and then column = source_view_end_column
               loop
                  source_view.extend(cc)
                  next_char
               end
               source_view.extend('%"')
               source_view := source_view.twin
            end
            update_last_manifest_string(pos(l, c), once_flag, unicode_flag, buffer, source_view)
            next_char
            if skip_comments_flag then
               skip_comments
            end
         elseif once_flag or else unicode_flag then
            go_back_at(l, c)
         end
      end

   buffer: STRING
      once
         create Result.make(80)
      end

   unicode_string_buffer: UNICODE_STRING
      once
         create Result.make_empty
      end

   go_back_at (l, c: INTEGER)
         -- Go back to some existing line `l', and column `c'.
      require
         l >= 1
         c >= 1
      local
         sp: POSITION
      do
         line := l
         column := c
         current_line := parser_buffer.item(l)
         cc := current_line.item(c)
         if last_comment /= Void then
            sp := last_comment.start_position
            if l < sp.line then
               last_comment := Void
            elseif l = sp.line then
               if c < sp.column then
                  last_comment := Void
               end
            end
         end
      end

   last_comment: COMMENT
         -- Void or waiting comment.

   drop_comments: BOOLEAN
         -- When objects COMMENT are not necessary.

   skipped_new_line: BOOLEAN
         -- True when the last skip_comments skipped a new-line

   skip_comments
         -- Skip separators and comments if any. Unless `drop_comments',
         -- comments are stored in `last_comment'.
      local
         sp: POSITION; stop: BOOLEAN
      do
         from
            skipped_new_line := False
         until
            stop
         loop
            inspect
               cc
            when '%N', '%R' then
               skipped_new_line := True
               next_char
            when '%F', ' ', '%T' then
               next_char
            when '-' then
               next_char
               if cc = '-' then
                  if drop_comments then
                     if line = parser_buffer.count then
                        cc := end_of_text
                        stop := True
                     else
                        line := line + 1
                        column := 1
                        current_line := parser_buffer.item(line)
                        if current_line.count = 0 then
                           cc := '%N'
                        else
                           cc := current_line.first
                        end
                     end
                  else
                     from
                        sp := pos(line, column - 1)
                        next_char
                        lcs.clear_count
                     until
                        cc = '%N'
                     loop
                        lcs.extend(cc)
                        next_char
                     end
                     if last_comment = Void then
                        create last_comment.make(sp, lcs.twin)
                     else
                        last_comment.add_last(lcs.twin)
                     end
                  end
               else
                  cc := '-'
                  column := column - 1
                  stop := True
               end
            else
               stop := True
            end
         end
      end

   next_char
      do
         if column < current_line.count then
            column := column + 1
            cc := current_line.item(column)
         elseif column = current_line.count then
            column := column + 1
            cc := '%N'
         elseif line = parser_buffer.count then
            cc := end_of_text
         else
            line := line + 1
            column := 1
            current_line := parser_buffer.item(line)
            if current_line.count = 0 then
               cc := '%N'
            else
               cc := current_line.first
            end
         end
      end

   start_line, start_column: INTEGER
         -- To store beginning position of : `a_keyword', `a_integer',
         -- `a_real', `skip1', `skip2' and `skip1unless2'.

   a_keyword (keyword: STRING): BOOLEAN
         -- Look for a `keyword' beginning strictly at current position, then,
         -- `skip_comment' is automatically called. A keyword is never followed
         -- by a character of this set: {'A'..'Z','a'..'z','0'..'9','_'}.
      require
         keyword.count >= 1
         not keyword.has('%N')
      local
         c, i, j: INTEGER
      do
         i := column
         c := keyword.count
         if current_line.count - i + 1 >= c then
            from
               start_line := line
               start_column := i
               j := 1
            until
               c <= 0
            loop
               if current_line.item(i) = keyword.item(j) then
                  i := i + 1
                  j := j + 1
                  c := c - 1
               else
                  c := -1
               end
            end
         end
         if c = 0 then
            if i > current_line.count then
               Result := True
               cc := '%N'
               column := i
               skip_comments
            else
               inspect
                  current_line.item(i)
               when ' ', '%T', '-' then
                  Result := True
                  cc := current_line.item(i)
                  column := i
                  skip_comments
               when 'a' .. 'z', 'A' .. 'Z', '0' .. '9', '_' then
               else
                  Result := True
                  cc := current_line.item(i)
                  column := i
                  skip_comments
               end
            end
         end
      end

   skip1 (char: CHARACTER): BOOLEAN
      do
         if char = cc then
            start_line := line
            start_column := column
            Result := True
            next_char
            skip_comments
         end
      end

   current_position: POSITION
      do
         Result := pos(line, column)
      end

   lcs: STRING
         -- Last Comment String.
      once
         create Result.make(80)
      end

   token_buffer: TOKEN_BUFFER
         -- The temporary buffer for some name.

   em1: STRING "Underscore in fractional part must group 3 digits."

   em2: STRING "Right hand side expression of := assignment expected here."

   em3: STRING "Index value expected (%"indexing ...%")."

   em4: STRING "Error in inspect."

   em5: STRING "Added missing %",%"."

   em6: STRING "Added missing %";%"."

   em8: STRING "Unexpected new line in manifest string."

   em10: STRING "Right hand side expression of ::= assignment expected here."

   em11: STRING "Bad clients list."

   em12: STRING "Deleted extra comma."

   em13: STRING "Deleted extra separator."

   em14: STRING "Variable `Result' is valid only inside a function."

   em16: STRING "Type mark expected."

   em17: STRING "Unexpected character."

   em18: STRING "Deleted useless keyword."

   em19: STRING "Added missing brackets to enclose the previous %"once%" manifest STRING."

   em20: STRING "Right hand side expression of ?= assignment expected here."

   em21: STRING "Expression expected after assignment test %"?:=%"."

   em22: STRING "Bad creation/create (writable expected)."

   em23: STRING "Bad creation/create (procedure name expected)."

   em24: STRING "Deleted extra semi-colon."

   em26: STRING "Same identifier appears twice (local/formal)."

   em26_2: STRING "Same identifier appears twice (local/closure)."

   em27: STRING "Added missing %"(%"."

   em28: STRING "Added missing %")%"."

   em29: STRING "Added missing %":%"."

   em30: STRING "Expected %"[%" (to start generic argument list)."

   em31: STRING "Expected %"]%" (to finish generic argument list)."

   em32: STRING "Type mark expected."

   em34: STRING "Bad agent (call expected)."

   em36: STRING "Closing %"}%" expected."

   em37: STRING "Unknown special character."

   em38: STRING "Unexpected character in decimal ascii code."

   em39: STRING "Bad (empty?) ascii code."

   em40: STRING "Decimal CHARACTER code out of range."

   em41: STRING "Error inside multi-line manifest string."

   em42: STRING "Extra blank or tab character removed in multi-line %
         %manifest string."

   em43: STRING "Invalid free operator (the last character must be %
         %a member of this +-*/\=<>@#|& character list.)."

   em44: STRING "Invalid free operator. (This character cannot be used.)"

   em45: STRING "Unexpected character in hexadecimal ascii code."

   em46: STRING "Unexpected character in hexadecimal unicode."

end -- class PARSER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
