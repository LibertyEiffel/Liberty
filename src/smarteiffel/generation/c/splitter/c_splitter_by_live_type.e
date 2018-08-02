-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_SPLITTER_BY_LIVE_TYPE
   --
   -- This splitter strives to keep one C file per live type
   --

inherit
   C_SPLITTER_SPLIT
      redefine
         connect
      end

create {ACE, CLEAN}
   make

feature {}
   check_clean (path_c, c: STRING): BOOLEAN
      do
         if c.has_prefix(path_c) then
            c.remove_prefix(path_c)
            if c.has_prefix(once "_T") then
               c.remove_prefix(once "_T")
               Result := c.is_integer
            end
         end
      end

   do_split
      do
         count := suffixes.count
      end

   current_id: INTEGER
      do
         if live_type /= Void then
            Result := live_type.id
         else
            Result := 0
         end
      end

   current_c_file_suffix: STRING
      do
         Result := once ""
         Result.copy(once "_T")
         current_id.append_in(Result)
      end

   c_files_suffixes: ITERATOR[STRING]
      do
         Result := suffixes.new_iterator
      end

feature {}
   append_suffix
      local
         i, id: INTEGER
      do
         id := current_id
         i := sorter.insert_index(ids, id)
         ids.add(id, i)
         suffixes.add(current_c_file_suffix.twin, i)
      end

feature {C_PRETTY_PRINTER}
   connect (path_c: STRING)
      do
         Precursor(path_c)
         append_suffix
      end

   set_live_type (a_live_type: like live_type)
      do
         live_type := a_live_type
         append_suffix
      end

   live_type: LIVE_TYPE

   should_split (functions_count: INTEGER): BOOLEAN
      do
         if not dont_split then
            Result := count < suffixes.count -- True if a new LIVE_TYPE has been set
         end
      end

   linker_command (c_file_prefix: STRING): STRING
      local
         c_name, object: STRING; objects: FAST_ARRAY[STRING]; i: INTEGER
      do
         c_name := once ""
         c_name.copy(c_file_prefix)
         c_name.append(once "_T")
         create objects.with_capacity(suffixes.count)
         from
            object := once ""
            i := suffixes.lower
         until
            i > suffixes.upper
         loop
            path_in(object, suffixes.item(i), system_tools.object_suffix)
            objects.add_last(object.twin)
            i := i + 1
         end
         Result := system_tools.linker_command(c_name, objects)
      end

feature {ACE}
   pretty_ace_in (txt: STRING)
      do
         txt.append("   split (%"by type%")%N")
      end

feature {}
   make
      do
         create suffixes.make(0)
         create ids.make(0)
         echo.put_string(once "By-type splitter enabled.%N")
      end

   count: INTEGER

   suffixes: FAST_ARRAY[STRING]

   ids: FAST_ARRAY[INTEGER]

   sorter: REVERSE_COLLECTION_SORTER[INTEGER]

end -- class C_SPLITTER_BY_LIVE_TYPE
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
