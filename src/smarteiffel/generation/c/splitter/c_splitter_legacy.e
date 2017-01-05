-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_SPLITTER_LEGACY
   --
   -- The legacy generated C files splitter
   --
   -- Tries to somewhat equalize the size of the C files
   --

inherit
   C_SPLITTER_SPLIT

create {ACE, CLEAN}
   make

feature {}
   check_clean (path_c, c: STRING): BOOLEAN
      do
         if c.has_prefix(path_c) then
            c.remove_prefix(path_c)
            Result := c.is_integer
         end
      end

   do_split
      do
         split_id := split_id + 1
      end

   current_c_file_suffix: STRING
      do
         Result := once ""
         Result.clear_count
         split_id.append_in(Result)
      end

   c_files_suffixes: ITERATOR[STRING]
      do
         create {C_SPLITTER_LEGACY_ITERATOR} Result.make(split_id)
      end

feature {C_PRETTY_PRINTER}
   set_live_type (a_live_type: like live_type)
      do
         live_type := a_live_type
      end

   live_type: LIVE_TYPE

   should_split (functions_count: INTEGER): BOOLEAN
      do
         if not dont_split then
            Result := out_c.character_count > 150_000
            if not Result and then functions_count > 0 then
               -- Tuning done with our EIFFEL_PARSER class.
               -- It is a huge type (or enough functions already got in this file), so it is better to force C
               -- file splitting right_now:
               Result := functions_count > 200
            end
         end
      end

   linker_command (c_file_prefix: STRING): STRING
      local
         objects: FAST_ARRAY[STRING]
      do
         create objects.with_capacity(split_id)
         add_objects(objects)
         Result := system_tools.linker_command(c_file_prefix, objects)
      end

feature {ACE}
   pretty_ace_in (txt: STRING)
      do
         txt.append("   split (%"legacy%")%N")
      end

feature {}
   make
      do
         split_id := 1
         echo.put_string(once "Legacy splitter enabled.%N")
      end

   split_id: INTEGER

   add_objects (objects: FAST_ARRAY[STRING])
         -- Add objects files numbered from 1 to `split_id' included.
      local
         i: INTEGER; short_command: BOOLEAN
         c_name, object: STRING
      do
         c_name := ""
         c_name.copy(c_path)
         c_name.remove_tail(2)
         if split_id.in_range(3, 99) then
            if system_tools.unix_system = system_tools.system_name then
               short_command := True
            elseif system_tools.cygwin_system = system_tools.system_name then
               short_command := True
            end
         end
         if short_command then
            add_objects_(objects, c_name, 1, split_id)
         else
            from
               i := 1
            until
               i > split_id
            loop
               object := c_name.twin
               i.append_in(object)
               object.append(system_tools.object_suffix)
               objects.add_last(object)
               i := i + 1
            end
         end
      end

   add_objects_ (objects: FAST_ARRAY[STRING]; c_name: STRING; min, max: INTEGER)
         -- This is a good recursive example ;-)
      require
         max.in_range(1, 99)
         min.in_range(1, max + 1)
      local
         c, i1, i2, new_min: INTEGER
         object: STRING
      do
         if min > max then
            check
               min = max + 1
            end
         elseif min < 9 then
            object := c_name.twin
            object.append(once "[1-")
            i1 := max.min(9)
            i1.append_in(object)
            object.extend(']')
            object.append(system_tools.object_suffix)
            objects.add_last(object)
            add_objects_(objects, c_name, i1 + 1, max)
         elseif min = max then
            object := c_name.twin
            min.append_in(object)
            object.append(system_tools.object_suffix)
            objects.add_last(object)
         else
            check
               min #\\ 10 = 0
            end
            c := max - min + 1
            check
               c >= 2
            end
            if c <= 10 then
               i1 := min #// 10
               i2 := max #\\ 10
               object := c_name.twin
               i1.append_in(object)
               object.extend('[')
               object.extend('0')
               object.extend('-')
               i2.append_in(object)
               object.extend(']')
               object.append(system_tools.object_suffix)
               objects.add_last(object)
            elseif c < 20 then
               add_objects_(objects, c_name, min, min + 9)
               add_objects_(objects, c_name, min + 10, max)
            else
               i1 := min #// 10
               i2 := (max - 9) #// 10
               check
                  i2 * 10 + 9 <= max
               end
               object := c_name.twin
               object.extend('[')
               i1.append_in(object)
               object.extend('-')
               i2.append_in(object)
               object.append(once "][0-9]")
               object.append(system_tools.object_suffix)
               objects.add_last(object)
               new_min := i2 * 10 + 10
               add_objects_(objects, c_name, new_min, max)
            end
         end
      ensure
         min < max implies objects.count > old objects.count
         c_name.is_equal(old c_name.twin)
      end

end -- class C_SPLITTER_LEGACY
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
