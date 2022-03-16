-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class PARSER_BUFFER
   --
   -- Parsers are working in a unique buffered area (the file to parse
   -- entirely loaded into this unique buffer during parsing). This solution make
   -- it easy point/line/column counting as well as backward moves.
   -- The access to the current character (feature `cc') is also very fast.
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

create {ANY}
   make

feature {ANY} -- Initializing the `parser_buffer':
   is_ready: BOOLEAN
         -- Is the `parser_buffer' ready to be used?
      do
         Result := hashed_path /= Void
      end

   hashed_path: HASHED_STRING
         -- When `is_ready', gives the `path' of the corresponding buffered file.

   path: STRING
         -- An alias of `hashed_path.to_string'.
      do
         Result := hashed_path.to_string
      end

   load_file (a_path: STRING)
         -- Try to load `a_path' and set `is_ready' when corresponding file has
         -- been successfully loaded. (One must not forget to call `release' when
         -- the parsing is done.)
      require
         not is_ready
         not string_aliaser.registered_one(a_path)
      local
         i: INTEGER
      do
         tmp_file_read.connect_to(a_path)
         if tmp_file_read.is_connected then
            hashed_path := string_aliaser.hashed_string(a_path)
            from
               if empty_line_at(0) /= Void then
                  -- unused line.
               end
               i := 1
               tmp_file_read.read_line_in(empty_line_at(i))
            until
               tmp_file_read.end_of_input
            loop
               i := i + 1
               tmp_file_read.read_line_in(empty_line_at(i))
            end
            if text.item(i).is_empty then
               count := i - 1
            else
               count := i
            end
            tmp_file_read.disconnect
            if count <= 0 and then not is_install then
               error_handler.append(once "File %"")
               error_handler.append(path)
               error_handler.append(once "%" seems to be empty.")
               error_handler.print_as_fatal_error
            end
         else
            hashed_path := Void
         end
      end

   release
         -- To be called at the end of parsing to release the `parser_buffer'.
      require
         is_ready
      do
         hashed_path := Void
         cluster := Void
      ensure
         not is_ready
      end

   cluster: CLUSTER
         -- The corresponding one when the buffered file is an Eiffel source
         -- file.

feature {ANY} -- Access and moves into the `parser_buffer':
   count: INTEGER
         -- Number of lines in the source file.

feature {PARSER}
   item (line: INTEGER): STRING
      require
         is_ready
         1 <= line
         line <= count
      do
         Result := text.item(line)
      ensure
         Result /= Void
      end

feature {CLUSTER, SMART_EIFFEL}
   set_cluster (c: like cluster)
      require
         c /= Void
      do
         cluster := c
      ensure
         cluster = c
      end

feature {}
   make
      do
         create text.with_capacity(6000)
      end

   text: FAST_ARRAY[STRING]
         -- To store the complete file to parse. Each line is one STRING without
         -- the '%N' end-of-line mark.

   empty_line_at (i: INTEGER): STRING
      require
         i >= 0
      do
         if i <= text.upper then
            Result := text.item(i)
            Result.clear_count
         else
            create Result.make(medium_line_size)
            text.add_last(Result)
         end
      ensure
         Result.is_empty
         Result.capacity >= medium_line_size
         text.item(i) = Result
      end

   medium_line_size: INTEGER 128

end -- class PARSER_BUFFER
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
