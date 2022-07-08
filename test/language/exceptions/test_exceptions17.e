-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_EXCEPTIONS17

insert
   EXCEPTIONS
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   i: INTEGER

   make
      do
         make2
         inspect
            require_count
         when 0, 1 then
            is_true(body_count = 1)
            is_true(ensure_count = 0)
            is_true(rescue_count = 0)
         when 2 then
            is_true(body_count = 2)
            is_true(ensure_count = 2)
            is_true(rescue_count = 1)
         else
            is_true(False)
         end
      end

   make2
      require
         increment_require_count
      do
         body_count := body_count + 1
      ensure
         increment_ensure_count
         i /= 0
      rescue
         rescue_count := rescue_count + 1
         i := 1
         retry
      end

   body_count: INTEGER

   rescue_count: INTEGER

   increment_require_count: BOOLEAN
      do
         require_count := require_count + 1
         Result := True
      end

   require_count: INTEGER

   increment_ensure_count: BOOLEAN
      do
         ensure_count := ensure_count + 1
         Result := True
      end

   ensure_count: INTEGER

feature {ANY}
   is_true (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            crash
            std_output.put_string("TEST_EXCEPTION17: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            --std_output.put_string("Yes%N");
         end
         assert(b)
      end

   cpt: INTEGER

end -- class TEST_EXCEPTIONS17
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
