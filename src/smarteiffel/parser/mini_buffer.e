-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MINI_BUFFER
   --
   -- This mini buffer is used to parse information inside MANIFEST_STRING
   -- objects (used for example to parse external feature definition). This
   -- singleton object is shared via the GLOBALS.`mini_buffer' once function.

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

feature {ANY}
   start_with (ms: MANIFEST_STRING)
         -- Getting started with `ms', the `item' is set with the first non-blank character.
      require
         ms /= Void
      do
         manifest_string := ms
         to_string := manifest_string.to_string
         count := to_string.count
         idx := 1
         skip_separators
      ensure
         manifest_string = ms
         not is_off implies not item.is_separator
      end

   item: CHARACTER
         -- The one at current position.
      require
         not is_off
      do
         Result := to_string.item(idx)
      end

   is_off: BOOLEAN
      do
         Result := idx > count
      end

   next
      require
         not is_off
      do
         idx := idx + 1
      end

   skip_separators
         -- (Use `is_separator' of class CHARACTER.)
      do
         from
         until
            idx > count or else not to_string.item(idx).is_separator
         loop
            idx := idx + 1
         end
      ensure
         not is_off implies not item.is_separator
      end

   a_keyword (keyword: STRING): BOOLEAN
         -- Look for a `keyword' beginning strictly at current position, then,
         -- `skip_separators' is automatically called. A keyword is never followed
         -- by a character of this set: {'A'..'Z','a'..'z','0'..'9','_'}.
      require
         not item.is_separator
      local
         idx_memory, i: INTEGER; stop: BOOLEAN
      do
         idx_memory := idx
         from
            i := 1
            stop := count - idx < keyword.count - i
         until
            stop
         loop
            if i > keyword.count then
               stop := True
            elseif to_string.item(idx) = keyword.item(i) then
               i := i + 1
               idx := idx + 1
            else
               stop := True
            end
         end
         if i > keyword.count then
            skip_separators
            Result := True
         else
            idx := idx_memory
         end
      ensure
         is_off or else not item.is_separator
      end

   a_word (keyword: STRING): BOOLEAN
         -- Is it a single stand-alone `keyword'?
      require
         not item.is_separator
      local
         idx_memory: INTEGER
      do
         idx_memory := idx
         if a_keyword(keyword) then
            if idx > count then
               Result := True
            else
               idx := idx_memory
            end
         end
      ensure
         Result implies is_off
      end

   a_file_or_directory_path: STRING
         -- To be called when we have to find a directory or a file path name. Variables substitution
         -- performed automatically.
         -- (Note that this function does not check that the file (or the directory) actually exists.)
      require
         not item.is_separator
      local
         stop: BOOLEAN
      do
         if item = '%"' then
            next
         end
         from
            Result := once ".... local unique buffer ...."
            Result.clear_count
         until
            stop
         loop
            if is_off then
               stop := True
            elseif item.is_separator then
               stop := True
            elseif item = '%"' then
               stop := True
            else
               Result.extend(item)
               next
            end
         end
         if item = '%"' then
            next
         end
         system_tools.environment_variable_substitution(manifest_string.start_position.path, Result)
         if Result.is_empty then
            Result := Void
         else
            Result := Result.twin
         end
         skip_separators
      ensure
         skip_separators_called: is_off or else not item.is_separator
      end

   an_identifier: STRING
      local
         stop: BOOLEAN
      do
         from
            Result := once ".... local unique buffer ...."
            Result.clear_count
         until
            stop
         loop
            if is_off then
               stop := True
            elseif item.is_separator then
               stop := True
            elseif item.is_letter or item = '_' then
               Result.extend(item)
               next
            elseif item.is_digit and not Result.is_empty then
               Result.extend(item)
               next
            else
               stop := True
            end
         end
         if Result.is_empty then
            Result := Void
         else
            Result := Result.twin
         end
         skip_separators
      ensure
         skip_separators_called: is_off or else not item.is_separator
      end

   a_name: STRING
      do
         --|*** (Dom may 7th 2004) ***
         --| Because I am tired:
         Result := a_file_or_directory_path
      ensure
         skip_separators_called: is_off or else not item.is_separator
      end

   a_include: STRING
         -- Always return some file name which may looks like a file to include: "....foo.h" or <...foo.h>.
         -- When the file name is not properly brace with "..." or <...>, the standard "..." are automatically
         -- added.
      require
         not item.is_separator
      local
         stop: BOOLEAN
      do
         from
            Result := once ".... local unique buffer ...."
            Result.clear_count
            Result.extend(item)
            next
         until
            stop
         loop
            if is_off then
               stop := True
            elseif item.is_separator then
               stop := True
            elseif item = ',' then
               stop := True
            else
               Result.extend(item)
               next
            end
         end
         inspect
            Result.first
         when '%"', '<' then
         else
            Result.add_first('%"')
            Result.add_last('%"')
         end
         Result := Result.twin
      ensure
         is_off or else not item.is_separator
      end

   a_field_or_variable_name: STRING
      do
         Result := a_type_cast
      ensure
         is_off or else not item.is_separator
      end

   a_type_cast: STRING
         -- Read an expected C cast.
      require
         not item.is_separator
      local
         stop: BOOLEAN
      do
         from
            Result := once ".... local unique buffer ...."
            Result.clear_count
            Result.extend(item)
            next
         until
            stop
         loop
            if is_off then
               stop := True
            elseif item = ',' then
               stop := True
            elseif item.is_separator then
               stop := True
            else
               Result.extend(item)
               next
               if Result.last = ')' then
                  if Result.occurrences('(') < Result.occurrences(')') then
                     idx := idx - 1
                     Result.remove_last
                     stop := True
                  end
               end
            end
         end
         Result := Result.twin
         skip_separators
      ensure
         is_off or else not item.is_separator
      end

   a_signature: FAST_ARRAY[STRING]
         -- Read the expected external signature.
      require
         not item.is_separator
      local
         stop: BOOLEAN; external_cast: STRING
      do
         if item /= '(' then
            error_handler.append(once "Bad external signature (missing opening %"(%" delimiter.")
            error_handler.print_as_fatal_error
         end
         from
            next
            skip_separators
            create Result.with_capacity(8)
            Result.add_last(Void)
         until
            stop
         loop
            if is_off then
               error_handler.append(once "Bad external signature (missing %")%" delimiter.")
               error_handler.print_as_fatal_error
            elseif item = ',' then
               next
               skip_separators
            elseif item = ')' then
               stop := True
               next
               skip_separators
            else
               external_cast := a_type_cast
               Result.add_last(external_cast)
            end
         end
      ensure
         Result.count > 1
         is_off or else not item.is_separator
      end

feature {NATIVE_PLUG_IN}
   show_position_with_fatal_error (msg: STRING)
         -- To help the user to locate the position of the `fatal_error' (no return from this call).
      local
         i: INTEGER
      do
         error_handler.add_position(manifest_string.start_position)
         error_handler.append(msg)
         error_handler.append(once " (See next message to locate the error.)")
         error_handler.print_as_error
         error_handler.append(once "Correct part: %"")
         from
            i := 1
         until
            i = idx
         loop
            error_handler.extend(to_string.item(i))
            i := i + 1
         end
         error_handler.append(once "%"")
         error_handler.print_as_error
         from
            error_handler.append(once "Remainder: %"")
         until
            i > to_string.count
         loop
            error_handler.extend(to_string.item(i))
            i := i + 1
         end
         error_handler.append(once "%"")
         error_handler.print_as_fatal_error
      end

feature {}
   manifest_string: MANIFEST_STRING
         -- The one currently parsed.

   to_string: STRING
         -- To cache `manifest_string.to_string'.

   count: INTEGER
         -- To cache `to_string.count'.

   idx: INTEGER
         -- The current position in `to_string'.

end -- class MINI_BUFFER
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
