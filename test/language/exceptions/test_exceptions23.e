-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_EXCEPTIONS23
   -- SZ:280:

insert
   EIFFELTEST_TOOLS
   
create {}
   make

create {TEST_EXCEPTIONS23}
   make_exception

feature {ANY}
   make
      do
         exception_test
         assert(True)
      end

   make_exception
      do
         my_invariant := True
      end

   exception_test
      local
         done: BOOLEAN; test: TEST_EXCEPTIONS23
      do
         if not done then
            done := True
            create test.make_exception
            assert(False) -- shall not be reached, as the creation feature make_exception will violate the class invariant
         end
      rescue
         test := Void
         assert(True)
         retry
      end

   my_invariant: BOOLEAN

invariant
   my_invariant_is_false: not my_invariant

end -- class TEST_EXCEPTIONS23
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
