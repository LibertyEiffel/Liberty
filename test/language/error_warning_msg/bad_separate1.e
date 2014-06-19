-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class BAD_SEPARATE1

create {}
   make, no_make

feature {}
   make
      local
         s: separate BAD_SEPARATE1
      do
         fatal := error -- *** I broke this test because everything of SCOOP must be rebuild in another way.
         -- *** The first thing to do is to forget first the external
         -- separate stuff I think.
         -- *** (Dom. april 15th 2004) ***
         create s.no_make
         is_true(once_string_of(s) = once_string_of(s))
         is_true(once_string = once_string)
         is_true(once_string /= once_string_of(s))
      end

   once_string_of(s: separate BAD_SEPARATE1): STRING
      do
         Result := s.once_string
      end

   once_string: STRING
      do
         Result := once "test"
      end

   is_true(b: BOOLEAN)
      do
         cpt := cpt + 1;
         if not b then
            sedb_breakpoint;
            std_output.put_string("BAD_SEPARATE1: ERROR Test # ");
            std_output.put_integer(cpt);
            std_output.put_string("%N");
         end;
      end;

   cpt: INTEGER;

end -- class BAD_SEPARATE1
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
