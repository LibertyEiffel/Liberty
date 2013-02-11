-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EXCEPTION_TABLE
   --
   -- Unique Global Object in charge of the exception table of
   -- a method_info as describe in the JVM specification.
   -- Obviously, the same object is recycled.
   --

insert
   GLOBALS

creation {CODE_ATTRIBUTE}
   make

feature {}
   from_pc: FAST_ARRAY[INTEGER] is
      once
         create Result.with_capacity(4)
      end

   to_pc: FAST_ARRAY[INTEGER] is
      once
         create Result.with_capacity(4)
      end

   handler_pc: FAST_ARRAY[INTEGER] is
      once
         create Result.with_capacity(4)
      end

   type_idx: FAST_ARRAY[INTEGER] is
      once
         create Result.with_capacity(4)
      end

feature {}
   make is
      do
      end

feature {}
   count: INTEGER is
      do
         Result := from_pc.count
      end

feature {CODE_ATTRIBUTE}
   length: INTEGER is
      do
         Result := 8 * count
      end

   clear is
      do
         from_pc.clear_count
         to_pc.clear_count
         handler_pc.clear_count
         type_idx.clear_count
      end

   add (f, t, h, type: INTEGER) is
      do
         from_pc.add_last(f)
         to_pc.add_last(t)
         handler_pc.add_last(h)
         type_idx.add_last(type)
      end

   store_in (storage: STRING) is
      local
         c, i: INTEGER
      do
         c := count
         append_u2(storage, c)
         from
            i := 0
         until
            i >= c
         loop
            append_u2(storage, from_pc.item(i))
            append_u2(storage, to_pc.item(i))
            append_u2(storage, handler_pc.item(i))
            append_u2(storage, type_idx.item(i))
            i := i + 1
         end
      end

end -- class EXCEPTION_TABLE
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
