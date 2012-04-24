-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INTERFACE_INFO
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

feature {JVM}
   clear is
      do
         count := 0
         storage.clear_count
      end

   write_bytes is
      do
         echo.print_count("interface", count)
         jvm.b_put_u2(count)
         jvm.b_put_byte_string(storage)
      end

feature {ANY}
   add (name_idx: INTEGER) is
      do
         count := count + 1
         append_u2(storage, name_idx)
         -- attributes_count :
         -- include this?         append_u2(storage,0)
      end

end -- class INTERFACE_INFO
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
