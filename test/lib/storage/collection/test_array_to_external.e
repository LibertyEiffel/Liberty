-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ARRAY_TO_EXTERNAL

create {}
   make

feature {ANY}
   t_double: ARRAY[REAL_64]

   t_boolean: ARRAY[BOOLEAN]

   t_integer: ARRAY[INTEGER]

   t_any: ARRAY[CAT]

   make
      local
         cat: CAT
      do
         t_boolean := {ARRAY[BOOLEAN] 1, << True, False >> }
         assert(boolean(t_boolean.to_external))
         t_integer := {ARRAY[INTEGER] 1, << 4, 5.to_integer_32, 6 >> }
         assert(t_integer.first = integer(t_integer.to_external))
         t_double := {ARRAY[REAL_64] 1, << 3.0 >> }
         assert(double(t_double.to_external) = 3.0)
         create cat
         t_any := {ARRAY[CAT] 1, << cat, cat >> }
         assert(any(t_any.to_external) /= Void)
      end

feature {}
   boolean (p: POINTER): BOOLEAN
      do
         Result := integer(p).to_boolean
      end

   integer (p: POINTER): INTEGER
      do
         c_inline_c("R=*((EIF_INTEGER*)a1);")
      end

   double (p: POINTER): REAL_64
      do
         c_inline_c("R=*((double *)a1);")
      end

   any (p: POINTER): ANY
      do
         c_inline_c("R=*((void**)a1);")
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_ARRAY_TO_EXTERNAL: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N")
         end
      end

   cpt: INTEGER

end -- class TEST_ARRAY_TO_EXTERNAL
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
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
