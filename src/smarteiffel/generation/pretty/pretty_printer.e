-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class PRETTY_PRINTER
   --
   -- Singleton in charge of handling Eiffel code pretty printing (this is used to implement the well
   -- known "pretty" command).
   -- This singleton is shared via the GLOBALS.`pretty_printer' once function.
   --
   -- The `pretty_printer' singleton takes care of Eiffel source code output in a given file. The indent
   -- level, the current column number as well as already skipped lines is automatically memorized.
   -- The `pretty_printer' singleton is also in charge of replacing sequence of blank characters with
   -- tabulation in the output. In order to make this object easy to use, the output is automatically
   -- buffered so that indentation level can be changed without any trouble.
   --

insert
   GLOBALS
      undefine is_equal
      end
   STRING_HANDLER
      undefine is_equal
      end
   SINGLETON

create {ANY}
   make

feature {ANY}
   indent_level: INTEGER
         -- The current `indent_level'. As an example, this is 0 before the "class" keyword or 0 before
         -- the "feature" keyword, this is 1 before a feature name declaration and 2 for the "do" keyword.
      local
         i: INTEGER
      do
         if buffer.is_empty then
            Result := 0
         elseif buffer.last = '%N' then
            Result := 0
         elseif buffer.last = '%T' then
            from
               i := buffer.count
            until
               i = 0 or else buffer.item(i) /= '%T'
            loop
               Result := Result + 1
               i := i - 1
            end
         else
            Result := -1
         end
      ensure
         Result >= -1
      end

   set_indent_level (il: INTEGER)
         -- To be called each time we need a blank left margin of `il' characters '%T'.
         -- Actually, this method can be called more than once to increase or to
         -- decrease the actual left margin without starting a new line each time.
      require
         il >= 0
      local
         i: INTEGER; stop: BOOLEAN
      do
         -- Unset the previous `indent_level' or removes trailing ' ' or '%T' first:
         from
         until
            stop
         loop
            if buffer.is_empty then
               stop := True
            else
               inspect
                  buffer.last
               when ' ', '%T' then
                  buffer.remove_last
               else
                  stop := True
               end
            end
         end
         -- Set the '%N':
         if buffer.is_empty then
            -- No need to have a '%N'.
         elseif buffer.last /= '%N' then
            buffer.extend('%N')
         end
         -- Set `il' tabs:
         from
         until
            i = il
         loop
            buffer.extend('%T')
            i := i + 1
         end
      ensure
         indent_level = il
      end

   zen_mode: BOOLEAN
         -- Are we in the "-zen" mode?
      do
         Result := mode = C_zen
      end

   default_mode: BOOLEAN
         -- Are we in the "-default" mode?
      do
         Result := mode = C_default
      end

   end_mode: BOOLEAN
         -- Are we in the "-end" mode?
      do
         Result := mode = C_end
      end

   parano_mode: BOOLEAN
         -- Are we in the "-parano" mode?
      do
         Result := mode = C_parano
      end

   print_end_of_statement: BOOLEAN
         -- Do we have to print the end of a statement according to the current `mode'?
      do
         inspect
            mode
         when C_zen, C_default, C_end then
         when C_parano then
            Result := True
         end
      end

   print_end_of_feature: BOOLEAN
         -- Do we have to print the end of a feature according to the current `mode'?
      do
         inspect
            mode
         when C_zen, C_default then
         when C_end, C_parano then
            Result := True
         end
      end

   put_end_of (what: STRING)
         -- Short-hand to tag the end of `what'.
      do
         put_string(once "-- ")
         put_string(what)
         put_character('%N')
      end

   keyword (k: STRING)
         -- Add keyword `k'. If needed, a space is added before `k' and always add a ' ' after `k'.
      require
         not k.has('%N')
         not k.has('%T')
         not k.has(';')
      do
         if buffer.is_empty then
            -- No need to add an extra space before this keyword.
         else
            inspect
               buffer.last
            when ' ', '%N', '%T', '(' then
               -- No need to add an extra space after such a character.
            else
               buffer.extend(' ')
            end
         end
         buffer.append(k)
         if not k.is_equal(once "end") then
            -- otherwise, special case because of inline agents
            buffer.extend(' ')
         end
      ensure
         not k.is_equal(once "end") implies buffer.last = ' '
      end

   semi_colon_flag: BOOLEAN
         -- When the current instruction may add a following semi_colon (i.e. when this is not the last
         -- one of some compound).

   set_semi_colon_flag (v: like semi_colon_flag)
      do
         if v then
            if parano_mode then
               semi_colon_flag := v
            end
         else
            semi_colon_flag := v
         end
      end

   put_character (c: CHARACTER)
      local
         stop: BOOLEAN
      do
         if c = '%N' then
            -- In case of '%N', trailing non-significant characters are automatically removed:
            from
            until
               stop
            loop
               if buffer.is_empty then
                  stop := True
               else
                  inspect
                     buffer.last
                  when ' ', '%T' then
                     buffer.remove_last
                  else
                     stop := True
                  end
               end
            end
         end
         buffer.extend(c)
      end

   put_string (s: STRING)
      require
         s /= Void
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > s.count
         loop
            put_character(s.item(i))
            i := i + 1
         end
      end

   skip_one_line
         -- Add an empty line in the output only if it is necessary (i.e. if there is no empty line
         -- already skipped). Hence, calling the `skip_one_line' feature is not equivalent to call
         -- `put_character' using '%N' as an argument. In other words, two immediately successive calls
         -- to this `skip_one_line' actually skip only one line!
         -- (See also `skip_two_lines'.)
      do
         if buffer.is_empty then
            buffer.extend('%N')
         else
            from
            until
               buffer.has_suffix(once "%N%N")
            loop
               buffer.extend('%N')
            end
         end
      end

   skip_two_lines
         -- Add two empty lines in the output only if it is necessary. (See also `skip_one_line'.)
      do
         if buffer.is_empty then
            buffer.extend('%N')
            buffer.extend('%N')
         else
            from
            until
               buffer.has_suffix(once "%N%N%N")
            loop
               buffer.extend('%N')
            end
         end
      end

   put_type_mark (type_mark: TYPE_MARK)
      require
         type_mark /= Void
      do
         type_mark.pretty_in(buffer)
      end

feature {COMMENT}
   put_one_line_comment (il: like indent_level; comment: STRING)
         -- Add the `comment' only if it is not already added. (The goal is to avoid duplication of end
         -- comments of statements.)
      require
         not comment.has('%N')
      local
         previous_indent_level: INTEGER; stop, already_there: BOOLEAN; local_buffer: STRING
      do
         -- Going back to the previous line:
         from
         until
            stop
         loop
            if buffer.is_empty then
               stop := True
            else
               inspect
                  buffer.last
               when '%T' then
                  previous_indent_level := previous_indent_level + 1
                  buffer.remove_last
               when '%N' then
                  buffer.remove_last
                  stop := True
               else
                  previous_indent_level := -1
                  stop := True
               end
            end
         end
         -- Looking if `comment' is already there:
         local_buffer := once ".................................................."
         local_buffer.copy(once "--")
         local_buffer.append(comment)
         if buffer.count >= local_buffer.count then
            already_there := buffer.substring_index(local_buffer, buffer.count - local_buffer.count + 1) > 0
         end
         -- Reset the `previous_indent_level':
         if previous_indent_level >= 0 then
            set_indent_level(previous_indent_level)
         end
         -- Now finishing the job:
         if not already_there then
            if previous_indent_level < 0 and then column < wrap_limit then
               -- The one-line comment may be just after some expression:
               if last_character /= ' ' then
                  put_character(' ')
               end
               put_string(once "--")
               put_string(comment)
            else
               -- There is already a blank left margin:
               set_indent_level(il)
               put_string(once "--")
               put_string(comment)
            end
         end
      end

feature {ANONYMOUS_FEATURE}
   indent_level_for_header_comment_of_feature: INTEGER 2

feature {CLASS_TEXT}
   replacement_header, replacement_footer: STRING
         -- (See also `pretty'.)

feature {PRETTY, PRETTY_PRINTER_HANDLER}
   set_replacement_header (rh: like replacement_header)
      do
         replacement_header := rh
      ensure
         replacement_header = rh
      end

   set_replacement_footer (rh: like replacement_footer)
      do
         replacement_footer := rh
      ensure
         replacement_footer = rh
      end

feature {COMMENT}
   last_character: CHARACTER
      require
         indent_level < 1
      do
         Result := buffer.last
      end

feature {COMPOUND}
   last_non_blank_character: CHARACTER
         -- The last non blank character at the end of the internal `buffer'.
      local
         i: INTEGER; c: CHARACTER
      do
         from
            i := buffer.count
         until
            i <= 0
         loop
            c := buffer.item(i)
            inspect
               c
            when ' ', '%T', '%N' then
               i := i - 1
            else
               i := 0
               Result := c
            end
         end
      end

   prepare_for_same_line_comment
         -- Remove some trailing '%N' if any.
      local
         i: INTEGER; c: CHARACTER
      do
         from
            i := buffer.count
         until
            i <= 0
         loop
            c := buffer.item(i)
            inspect
               c
            when ' ', '%T', '%N' then
               buffer.remove_last
               i := i - 1
            else
               i := 0
            end
         end
      end

feature {COMPOUND, ASSERTION_LIST}
   index_of_last_character: INTEGER
      do
         Result := buffer.count
      end

   is_opening_bracket_after (idx: INTEGER): BOOLEAN
      local
         i: INTEGER; stop: BOOLEAN
      do
         from
            i := idx + 1
         until
            stop
         loop
            inspect
               buffer.item(i)
            when '(' then
               Result := True
               stop := True
            when ' ', '%T', '%N' then
               i := i + 1
            else
               stop := True
            end
         end
      end

   erase_everything_after (idx: INTEGER)
      do
         buffer.set_count(idx)
      end

   erase_separators_after (idx: INTEGER)
      local
         i: INTEGER; stop: BOOLEAN
      do
         from
            i := idx + 1
         until
            stop
         loop
            inspect
               buffer.item(i)
            when ' ', '%T', '%N' then
               buffer.remove(i)
            else
               stop := True
            end
         end
      end

feature {ANY}
   wrap_limit: INTEGER 120

   column: INTEGER
         -- The current column (the left-most column number is 1).
      local
         stop: BOOLEAN; i: INTEGER
      do
         Result := 1
         from
            i := buffer.count
         until
            stop
         loop
            if i = 0 then
               stop := True
            else
               inspect
                  buffer.item(i)
               when '%N' then
                  stop := True
               when '%T' then
                  Result := Result + 3
               else
                  Result := Result + 1
               end
            end
            i := i - 1
         end
      ensure
         Result >= 1
      end

feature {PRETTY, PRETTY_PRINTER_HANDLER}
   set_zen
         -- (See pretty.html for more info.)
      do
         mode := C_zen
      end

   set_default
         -- (See pretty.html for more info.)
      do
         mode := C_default
      end

   set_end
         -- (See pretty.html for more info.)
      do
         mode := C_end
      end

   set_parano
         -- (See pretty.html for more info.)
      do
         mode := C_parano
      end

feature {ANY} -- To run `pretty' in a STRING buffer:
   code_in (client_buffer: STRING; code: CODE)
         -- After this call, the prettified version of `code' has been appended in the `client_buffer'.
      require
         client_buffer /= Void
         code /= Void
      do
         check
         -- That pretty is not currently running in file mode.
            not out_stream_flag
         end
         buffer.clear_count
         code.pretty(0)
         pretty_buffer.clear_count
         buffer.replacing_in(once "%T", once "   ", pretty_buffer)
         client_buffer.append(pretty_buffer)
      end

   expression_in (client_buffer: STRING; expression: EXPRESSION)
         -- After this call, the prettified version of `expression' has been appended in the `client_buffer'.
      require
         client_buffer /= Void
         expression /= Void
      do
         check
         -- That pretty is not currently running in file mode.
            not out_stream_flag
         end
         buffer.clear_count
         expression.pretty(0)
         pretty_buffer.clear_count
         buffer.replacing_in(once "%T", once "   ", pretty_buffer)
         client_buffer.append(pretty_buffer)
      end

   instruction_in (client_buffer: STRING; instruction: INSTRUCTION)
         -- After this call, the prettified version of `instruction' has been appended in the `client_buffer'.
      require
         client_buffer /= Void
         instruction /= Void
      do
         check
         -- That pretty is not currently running in file mode.
            not out_stream_flag
         end
         buffer.clear_count
         instruction.pretty(1)
         pretty_buffer.clear_count
         buffer.replacing_in(once "%T", once "   ", pretty_buffer)
         client_buffer.append(pretty_buffer)
      end

feature {PRETTY, PRETTY_PRINTER_HANDLER}
   connect_to (path: STRING)
         -- Note: because the output is buffered, the caller must not forget to call `disconnect' at the end.
      require
         not path.is_empty
         not out_stream_flag
         not out_stream.is_connected
      do
         out_stream_flag := True
         echo.tfw_connect(out_stream, path)
         buffer.clear_count
      ensure
         out_stream_flag
         out_stream.is_connected
      end

   disconnect
         -- Flush the `buffer' on the `out_stream' and close the corresponding file.
      require
         out_stream_flag
         out_stream.is_connected
      local
         i: INTEGER; c: CHARACTER; indent: BOOLEAN
      do
         from
            i := buffer.lower
            indent := True
         until
            i > buffer.upper
         loop
            c := buffer.item(i)
            inspect
               c
            when '%T' then
               if indent then
                  out_stream.put_string(once "   ")
               else
                  out_stream.put_character('%T')
               end
            when '%N' then
               indent := True
               out_stream.put_character(c)
            else
               indent := False
               out_stream.put_character(c)
            end
            i := i + 1
         end
         if buffer.last /= '%N' then
            out_stream.put_character('%N')
         end
         out_stream.disconnect
         out_stream_flag := False
      ensure
         not out_stream_flag
         not out_stream.is_connected
      end

feature {MANIFEST_GENERIC}
   left_margin_in (left_margin_buffer: STRING)
         -- Copy in `left_margin_buffer' a blank line model of the current left-margin.
      require
         left_margin_buffer.is_empty
      local
         stop: BOOLEAN; i: INTEGER
      do
         from
            i := buffer.count
         until
            stop
         loop
            if i = 0 then
               stop := True
            else
               inspect
                  buffer.item(i)
               when '%N' then
                  stop := True
               when '%T' then
                  left_margin_buffer.add_first('%T')
               else
                  left_margin_buffer.add_first(' ')
               end
            end
            i := i - 1
         end
      end

feature {}
   mode: INTEGER
         -- Internal code to memorize the selected mode : "-zen", "-default", "-end" or "-parano".

   C_zen, C_default, C_end, C_parano: INTEGER unique

   buffer: STRING
         -- The whole text is placed in this `buffer' before to be actually printed on the `out_stream'.
      once
         create Result.make(initial_buffer_capacity)
      end

   pretty_buffer: STRING
      once
         create Result.make(initial_buffer_capacity)
      end

   initial_buffer_capacity: INTEGER 100000

   out_stream_flag: BOOLEAN
         -- True indicates that the output have to be done on `out_stream'. False indicates that we just
         -- want to get the output in the `buffer'.

   out_stream: TEXT_FILE_WRITE
         -- The unique TEXT_FILE_WRITE once object.
      once
         create Result.make
      end

   make
      do
         mode := C_default
      end

   valid_mode (m: like mode): BOOLEAN
         -- Is the mode previously obtained using `mode'?
      do
         inspect
            m
         when C_zen, C_default, C_end, C_parano then
            Result := True
         else
         end
      end

invariant
   valid_mode(mode)

end -- class PRETTY_PRINTER
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
