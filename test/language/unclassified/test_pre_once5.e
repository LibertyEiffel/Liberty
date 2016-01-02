-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_PRE_ONCE5

inherit
   EIFFELTEST_TOOLS
      redefine default_rescue
      end

insert
   EXCEPTIONS
      --SZ:224:
      -- OK from debug_check to invariant_check
      -- bug from ensure_check to boost
      --
      -- In fact, the bug is due to precomputed once sometime accessed thru
      -- the standard routine as if it were not precomputed (flag is checked).
      redefine default_rescue
      end

create {}
   make

feature {ANY}
   make
      local
         aux: AUX_PRE_ONCE5
      do
         -- This call simply calls raise("Some string")
         create aux.make
      end

   default_rescue
      do
         assert(is_developer_exception)
         assert(developer_exception_name /= Void)
         assert(("Some string").is_equal(developer_exception_name))
         die(exit_success_code)
      end

end -- class TEST_PRE_ONCE5
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
