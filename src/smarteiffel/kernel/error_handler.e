-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ERROR_HANDLER
   --
   -- The unique `error_handler' object for Warning, Error and Fatal Error
   -- handling.
   -- This handler uses an asynchronous strategy.
   --

insert
   GLOBALS
      undefine is_equal
      redefine default_create
      end
   SINGLETON
      redefine default_create
      end
   TAGGER
      undefine is_equal
      redefine default_create
      end

feature {ANY}
   error_counter, warning_counter: INTEGER
         -- Global counters.

   no_warning: BOOLEAN
         -- To avoid warning messages.

   style_warning: BOOLEAN
         -- To display style warning messages.

   flymake_mode: BOOLEAN
         -- To display messages in a format recognized by emacs (flymake)

   is_empty: BOOLEAN
         -- True when nothing stored in `explanation' and `positions'.
      do
         Result := explanation.is_empty and then positions.is_empty
      end

   set_no_warning
      do
         no_warning := True
      end

   set_style_warning
      do
         style_warning := True
      end

   set_flymake_mode
      do
         flymake_mode := True
      end

   append (s: STRING)
         -- Append text `s' to the current `explanation'.
      require
         not s.is_empty
      do
         explanation.append(s)
      ensure
         not is_empty
      end

   append_integer (i: INTEGER)
         -- Append integer `i' to the current `explanation'.
      do
         i.append_in(explanation)
      ensure
         not is_empty
      end

   append_integer_64 (i: INTEGER_64)
         -- Append integer `i' to the current `explanation'.
      do
         i.append_in(explanation)
      ensure
         not is_empty
      end

   extend (c: CHARACTER)
         -- Append `c' to the current `explanation'.
      do
         explanation.extend(c)
      ensure
         not is_empty
      end

   add_position (p: POSITION)
         -- If necessary, add `p' to the already known `positions'.
      do
         if p.is_unknown then
         else
            positions.add_last(p)
         end
      end

   add_type_mark (type_mark: TYPE_MARK)
      require
         type_mark /= Void
      do
         type_mark.pretty_in(explanation)
      end

   add_type (type: TYPE)
      require
         type /= Void
      do
         type.canonical_type_mark.pretty_in(explanation)
      end

   add_raw_code (code: CODE)
         -- Add a piece of `code' in the message.
         -- Note: the `start_position' of `code' is not automatically added by this call because it may be not
         -- meaningful in some context (it is up to the caller to do it when useful).
      require
         code /= Void
      do
         pretty_printer.code_in(explanation, code)
      end

   add_expression (expression: EXPRESSION)
         -- Add a piece of `expression' in the message.
         -- Note: the `start_position' of `expression' is not automatically added by this call because it may be not
         -- meaningful in some context (it is up to the caller to do it when useful).
      require
         expression /= Void
      do
         explanation.extend('`')
         pretty_printer.expression_in(explanation, expression)
         explanation.extend('%'')
      end

   add_instruction (instruction: INSTRUCTION)
         -- Add a piece of `instruction' in the message.
         -- Note: the `start_position' of `instruction' is not automatically added by this call because it may be not
         -- meaningful in some context (it is up to the caller to do it when useful).
      require
         instruction /= Void
      do
         explanation.extend('%N')
         pretty_printer.instruction_in(explanation, instruction)
         explanation.extend('%N')
      end

   add_feature_name (fn: FEATURE_NAME)
         -- Useful to show `fn' which may be an infix or a prefix name as well as an ordinary feature name.
         -- Note: the `start_position' of `fn' is not automatically added by this call because it may be not
         -- meaningful in some context (it is up to the caller to do it when useful).
      require
         fn /= Void
      do
         if fn.is_infix_name then
            append(once "infix %"")
            append(fn.to_string)
            extend('%"')
         elseif fn.is_prefix_name then
            append(once "prefix %"")
            append(fn.to_string)
            extend('%"')
         else
            extend('`')
            append(fn.to_string)
            extend('%'')
         end
      end

   add_context_info (ct: TYPE_MARK)
      require
         ct.is_static
      do
         append(once " (The validation context is ")
         append(ct.written_mark)
         append(once " . The validation context is used to compute all anchored type marks.)")
      end

   print_as_style_warning
         -- Print `explanation' as a Warning report.
         -- After printing, `explanation' and `positions' are reset.
      require
         not is_empty
      do
         if style_warning then
            print_as_warning
         else
            cancel
         end
      end

   print_as_warning
         -- Print or save `explanation' as a Warning report.
         -- After printing, `explanation' and `positions' are reset.
      require
         not is_empty
      do
         if no_warning then
            cancel
         elseif positions.is_empty then
            do_print(warning_tag)
            warning_counter := warning_counter + 1
            sedb_breakpoint
         else
            save_error(warning_tag)
         end
      end

   print_live_warnings
         -- Print all warnings not already printed, provided that they belong to a live type.
      local
         i: INTEGER; lt: LIVE_TYPE
      do
         if smart_eiffel.live_type_map /= Void then
            from
               i := smart_eiffel.live_type_map.lower
            until
               i > smart_eiffel.live_type_map.upper
            loop
               lt := smart_eiffel.live_type_map.item(i)
               if not lt.run_time_set.is_empty then
                  emit_warnings(lt.class_text)
               end
               i := i + 1
            end
         end
      end

   print_as_error
         -- Print `explanation' as an Error report.
         -- After printing, `explanation' and `positions' are reset.
      require
         not is_empty
      do
         emit_all_warnings
         do_print(once "Error")
         sedb_breakpoint
         error_counter := error_counter + 1
         if error_counter >= 6 then
            echo.w_put_string(fz_error_stars)
            echo.w_put_string(once "Too many errors.%N")
            echo.before_exit_close
            die_with_code(exit_failure_code)
         end
      ensure
         error_counter = old error_counter + 1
      end

   print_as_fatal_error
         -- Print `explanation' as a Fatal Error.
         -- Execution is stopped after this call.
      require
         not is_empty
      do
         emit_all_warnings
         do_print(once "Fatal Error")
         sedb_breakpoint
         if action /= Void then
            action.call([])
         else
            echo.before_exit_close
            die_with_code(exit_failure_code)
         end
      end

   print_as_internal_error
         -- Print `explanation' as an Internal Error.
         -- Execution is crashed after this call.
      require
         not is_empty
      do
         do_print(once "Internal Error")
         sedb_breakpoint
         --se_fault
         crash
      end

   cancel
         -- Cancel a prepared report without printing it.
      do
         explanation.clear_count
         positions.clear_count
      ensure
         is_empty
      end

   cancel_positions
         -- Cancel only the positions, keeping the Message.
      do
         positions.clear_count
      end

feature {}
   save_error (tag: STRING)
      require
         not is_empty
         not positions.is_empty
      local
         inttag: FIXED_STRING
         errors: TAGGED_ERRORS
         error: TAGGED_ERROR
         i: INTEGER; saved: BOOLEAN
         class_text: CLASS_TEXT
      do
         error := new_error
         inttag := tag.intern
         from
            i := positions.lower
         until
            i > positions.upper
         loop
            class_text := positions.item(i).class_text
            if class_text /= Void then
               errors ::= class_text.tag(inttag)
               if errors = Void then
                  create errors.make
                  class_text.set_tag(inttag, errors)
               end
               errors.data.add_last(error)
               saved := True
            end
            i := i + 1
         end
         if saved then
            cancel
         else
            do_print(tag)
         end
      ensure
         is_empty
      end

   emit_all_warnings
      local
         i: INTEGER
         error: TAGGED_ERROR
         class_text: CLASS_TEXT
      do
         error := new_error
         cancel
         from
            i := error.positions.lower
         until
            i > error.positions.upper
         loop
            class_text := error.positions.item(i).class_text
            if class_text /= Void then
               emit_warnings(class_text)
            end
            i := i + 1
         end
         explanation.copy(error.explanation)
         positions.copy(error.positions)
         errors_pool.recycle(error)
      ensure
         explanation.is_equal(old explanation.twin)
         positions.is_equal(old positions.twin)
      end

   emit_warnings (class_text: CLASS_TEXT)
      require
         class_text /= Void
      local
         inttag: FIXED_STRING
         errors: TAGGED_ERRORS
         error: TAGGED_ERROR
      do
         inttag := warning_tag.intern
         errors ::= class_text.tag(inttag)
         if errors /= Void then
            from
            until
               errors.data.is_empty
            loop
               error := errors.data.first
               if not error.is_emitted then
                  emit_error(warning_tag, error)
                  warning_counter := warning_counter + 1
               end
               errors_pool.recycle(error)
               errors.data.remove_first
            end
         end
      end

   emit_error (tag: STRING; error: TAGGED_ERROR)
      require
         is_empty
         not error.is_emitted
      do
         explanation.copy(error.explanation)
         positions.copy(error.positions)
         do_print(tag)
         error.set_emitted
         cancel
      ensure
         is_empty
         error.is_emitted
      end

   errors_pool: RECYCLING_POOL[TAGGED_ERROR]

   new_error: TAGGED_ERROR
      do
         --Result := errors_pool.item
         --if Result = Void then
         --   create Result.make(explanation, positions)
         --else
         --   Result.make(explanation, positions)
         --end
         create Result.make(explanation, positions)
      end

feature {ANY}
   when_fatal_error (a_action: like action)
      do
         action := a_action
      end

feature {}
   action: PROCEDURE[TUPLE]

feature {}
   explanation: STRING
         -- Current `explanation' text to be print with next Warning,
         -- the next Error or the next Fatal Error.

   positions: FAST_ARRAY[POSITION]
         -- The list of `positions' to be shown with next Warning,
         -- the next Error or the next Fatal Error.

   do_print (tag: STRING)
      do
         if flymake_mode then
            do_print_flymake(tag)
         else
            do_print_standard(tag)
         end
         cancel
      ensure
         is_empty
      end

   do_print_flymake (tag: STRING)
      local
         err: INTEGER; pos: POSITION
      do
         from
            err := positions.lower
         until
            err > positions.upper
         loop
            pos := positions.item(err)
            echo.w_put_string(pos.path)
            echo.w_put_character(':')
            echo.w_put_integer(pos.line)
            echo.w_put_character(':')
            echo.w_put_integer(pos.column)
            if err < positions.upper then
               echo.w_put_line(once ": and")
            end
            err := err + 1
         end
         echo.w_put_string(once ": ")
         echo.w_put_string(tag)
         echo.w_put_string(once ": ")
         echo.w_put_line(explanation)
      end

   do_print_standard (tag: STRING)
      local
         i: INTEGER; cc: CHARACTER
      do
         echo.w_put_string(fz_error_stars)
         echo.w_put_string(tag)
         echo.w_put_character(':')
         echo.w_put_character(' ')
         --
         from
            i := explanation.lower
         until
            i > explanation.upper
         loop
            cc := explanation.item(i)
            i := i + 1
            echo.w_put_character(cc)
         end
         echo.w_put_character('%N')
         echo.w_put_character('%N')
         if positions.count >= 2 then
            echo.w_put_string(once "The source lines relevant to this message are the following:%N%N")
         end
         display_lines
         echo.w_put_string(once "------%N")
      end

   get_positions_on_same_line (p: FAST_ARRAY[POSITION])
         -- Find the suffix of `positions' such that all POSITIONS of
         -- the suffix are on the same line of the same source file.
         -- Remove this suffix from `positions' and put in into `p',
         -- reversed, discarding redundant positions.
      require
         not positions.is_empty
         p /= Void
         (create {REVERSE_COLLECTION_SORTER[POSITION]}).is_sorted(positions)
      local
         pos1, pos2: POSITION
         no_column_pos: POSITION
         stop: BOOLEAN
      do
         p.clear_count
         from
            pos1 := positions.last
            if pos1.column = 0 then
               no_column_pos := pos1
            else
               p.add_last(pos1)
            end
            positions.remove_last
            stop := positions.is_empty
         until
            stop
         loop
            pos2 := positions.last
            if pos2.same_line_as(pos1) then
               if pos2.column /= pos1.column then
                  p.add_last(pos2)
                  pos1 := pos2
               end
               positions.remove_last
               stop := positions.is_empty
            else
               stop := True
            end
         end
         if p.is_empty then
            check
               not no_column_pos.is_unknown
            end
            p.add_last(no_column_pos)
         end
      ensure
         (create {COLLECTION_SORTER[POSITION]}).is_sorted(p)
         p.first.line = p.last.line -- i.e. all positions of p are on the same line
      end

   print_error_header (cn: CLASS_NAME; file_path: STRING; line_number: INTEGER; pos: FAST_ARRAY[POSITION])
         -- Print a line of the form "Line xx column(s) yy, zz in CLASS_NAME (some/file/path):%N"
      require
         pos.count > 0
         (create {COLLECTION_SORTER[POSITION]}).is_sorted(pos)
      local
         i, col: INTEGER
      do
         echo.w_put_string("Line ")
         echo.w_put_integer(line_number)
         if pos.count > 1 then
            echo.w_put_string(" columns ")
            from
               i := pos.lower
               echo.w_put_integer(pos.item(i).column)
               i := i + 1
            until
               i > pos.upper
            loop
               echo.w_put_string(", ")
               echo.w_put_integer(pos.item(i).column)
               i := i + 1
            end
         elseif pos.count = 1 then
            col := pos.first.column
            if col > 0 then
               echo.w_put_string(" column ")
               echo.w_put_integer(col)
            end
         end
         echo.w_put_string(" in ")
         if cn /= Void then
            echo.w_put_string(cn.to_string)
         end
         if file_path /= Void then
            echo.w_put_string(" (")
            echo.w_put_string(file_path)
            echo.w_put_character(')')
         end
         echo.w_put_string(":%N")
      end

   detab_line (line: STRING): INTEGER
         -- Replace all leading tabs of `line' with spaces, and return the number of spaces that must
         -- be prepended to `line' to compensate for this change.
      require
         line.count > 0
      local
         i: INTEGER
      do
         from
            i := line.lower
         until
            i > line.upper or else not line.item(i).is_separator
         loop
            if line.item(i) = '%T' then
               line.put(' ', i)
               Result := Result + 2 - ((i + Result - 1) \\ 3)
            end
            i := i + 1
         end
      ensure
         line.count = old (line.count)
      end

   put_arrows_into (line: STRING; p: FAST_ARRAY[POSITION])
         -- Replace the characters of `line' that are at column numbers from `p' by '^'. Replace
         -- all remaining non-tab characters by spaces.
      require
         (create {COLLECTION_SORTER[POSITION]}).is_sorted(p)
         line.count >= p.last.column
         p.first.line = p.last.line -- I.e. all positions of p are on the same line
      local
         i: INTEGER
      do
         from
            i := line.lower
         until
            i >= line.upper
         loop
            if line.item(i) /= '%T' then
               line.put(' ', i)
            end
            i := i + 1
         end
         if p.first.column > 0 then
            from
               i := p.lower
            until
               i > p.upper
            loop
               line.put('^', p.item(i).column)
               i := i + 1
            end
         end
      ensure
         line.count = old (line.count)
      end

   print_spaces (number: INTEGER)
         -- Print `number' spaces.
      require
         number >= 0
      local
         i: INTEGER
      do
         from
            i := number
         until
            i = 0
         loop
            echo.w_put_character(' ')
            i := i - 1
         end
      end

   display_lines
         -- Sort `positions' and display them.
      local
         pos: POSITION; s: REVERSE_COLLECTION_SORTER[POSITION]; cn: CLASS_NAME; li, offset: INTEGER
         file_path, the_line: STRING; line_positions: FAST_ARRAY[POSITION]
      do
         s.sort(positions)
         from
            create line_positions.with_capacity(2)
         until
            positions.is_empty
         loop
            get_positions_on_same_line(line_positions)
            pos := line_positions.first
            file_path := pos.path
            cn := pos.class_text_name
            li := pos.line
            print_error_header(cn, file_path, li, line_positions)
            if file_path /= Void and then li > 0 then
               the_line := get_line(file_path, li)
               if the_line /= Void then
                  the_line.extend('%N')
                  offset := detab_line(the_line)
                  print_spaces(offset)
                  echo.w_put_string(the_line)
                  print_spaces(offset)
                  put_arrows_into(the_line, line_positions)
                  echo.w_put_string(the_line)
               end
            end
         end
      ensure
         positions.is_empty
      end

   get_line (file_path: STRING; li: INTEGER): STRING
      require
         not file_path.is_empty
         li > 0
      local
         i: INTEGER
      do
         echo.tfr_connect(tmp_file_read, file_path)
         if tmp_file_read.is_connected then
            from
            until
               tmp_file_read.end_of_input or else i = li
            loop
               tmp_file_read.read_line
               i := i + 1
            end
            if not tmp_file_read.end_of_input then
               Result := tmp_file_read.last_string
            end
            tmp_file_read.disconnect
         end
      end

   warning_tag: STRING "Warning"

feature {}
   default_create
      do
         create explanation.make(1024)
         create positions.with_capacity(16)
         create errors_pool.make
      end

invariant
   explanation /= Void
   positions /= Void
   errors_pool /= Void

end -- class ERROR_HANDLER
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
