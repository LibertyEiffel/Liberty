-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FIELD_INFO
   --
   -- Unique Global Object to delay field info writing.
   -- Obviously, the same object is recycled.
   --

insert
   GLOBALS

feature {}
   count: INTEGER
         -- Number of fields.

   storage: STRING is
         -- To store the final JVM `method_info'.
      once
         create Result.make(512)
      end

   field_modifiers: DICTIONARY[FIELD_MODIFIER, INTEGER] is
      once
         create {HASHED_DICTIONARY[FIELD_MODIFIER, INTEGER]} Result.make
         --|*** AVL
      end

feature {JVM}
   clear is
      do
         count := 0
         storage.clear_count
         field_modifiers.clear_count
      end

   write_bytes is
      do
         echo.print_count("field", count)
         jvm.b_put_u2(count)
         jvm.b_put_byte_string(storage)
      end

feature {ANY}
   add (access_flags, name_idx, descriptor: INTEGER) is
      do
         count := count + 1
         append_u2(storage, access_flags)
         append_u2(storage, name_idx)
         append_u2(storage, descriptor)
         -- attributes_count :
         append_u2(storage, 0)
      end

feature {ANY}
   field_set_transient (name_idx: INTEGER) is
      local
         fm: FIELD_MODIFIER
      do
         if field_modifiers.has(name_idx) then
            fm := field_modifiers.at(name_idx)
            fm.set_transient
         else
            create fm
            fm.set_transient
            field_modifiers.put(fm, name_idx)
         end
      end

   field_set_volatile (name_idx: INTEGER) is
      local
         fm: FIELD_MODIFIER
      do
         if field_modifiers.has(name_idx) then
            fm := field_modifiers.at(name_idx)
            fm.set_volatile
         else
            create fm
            fm.set_volatile
            field_modifiers.put(fm, name_idx)
         end
      end

   field_modifier (name_idx: INTEGER): INTEGER is
      local
         fm: FIELD_MODIFIER
      do
         if field_modifiers.has(name_idx) then
            fm := field_modifiers.at(name_idx)
            Result := fm.access_flags
         else
            Result := 1
         end
      end

end -- class FIELD_INFO
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
