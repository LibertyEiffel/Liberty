-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_EXCEPTIONS22

insert
   EXCEPTIONS
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         a, c: POLYMORPHIC1; b: POLYMORPHIC2; number, counter: INTEGER
      do
         io.put_string("counter = " + counter.out + "%N")
         if counter > 0 then
            check
               number = System_level_type_error
            end
            io.put_string("reached counter " + counter.out + " and number "
                          + number.out + "%N")
         else
            create a
            create b
            c := b -- Let's fool the type checker;
            if c.is_equal(a) then
               assert(False)
               --          raise("Execution never gets here anyway")
            end
            -- c.is_equal will access a.foo which does not exist
            assert(False)
         end
      rescue
         counter := counter + 1
         number := exception
         sedb_breakpoint
         retry
      end

end -- class TEST_EXCEPTIONS22
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
