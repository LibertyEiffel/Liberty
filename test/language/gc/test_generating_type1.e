-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_GENERATING_TYPE1
   -- From a bug report of Alain Le Guennec <Alain.Le_Guennec@irisa.fr>

insert
   MEMORY

create {}
   make

feature {ANY}
   make
      local
         i: INTEGER; s, s2: STRING
      do
         assert(generator.is_equal("TEST_GENERATING_TYPE1"))
         full_collect
         assert(generator.is_equal("TEST_GENERATING_TYPE1"))
         assert(generating_type.is_equal("TEST_GENERATING_TYPE1"))
         from
            i := 10000
         until
            i = 0
         loop
            create s.make(0)
            s.extend('A')
            create s.make(1)
            s.extend('A')
            create s.make(34)
            s.extend('A')
            generator.append("AAA")
            generator.remove_tail(3)
            s2 := generator.twin
            assert(generator.is_equal("TEST_GENERATING_TYPE1"))
            assert(generating_type.is_equal("TEST_GENERATING_TYPE1"))
            assert(generating_type.is_equal(generator))
            i := i - 1
         end
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_GENERATING_TYPE1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_GENERATING_TYPE1
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
