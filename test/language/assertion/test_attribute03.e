-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ATTRIBUTE03

insert
   EIFFELTEST_TOOLS

create {}
   main

feature {ANY}
   main
      local
         aux: AUX_ATTRIBUTE03B; x: INTEGER
      do
         set_flags
         create aux
         assert(aux.attribute_require_counter = 0)
         assert(aux.deferred_require_counter = 0)
         assert(aux.attribute_ensure_counter = 0)
         assert(aux.deferred_ensure_counter = 0)

         x := aux.value + aux.value
         -- TODO, Rmk: clarify, what ECMA specifies about contracts 
         -- of attributes. Why did I once add " + aux.value"? 
         
         -- aux.value cannot change between the two successive calls, 
         -- as no feature with side effects is called in between.
         -- Therefore the optimizer might choose to evaluate it (and 
         -- therefore also its contracts) only once.
         if require_flag then
            label_assert("precondition evaluated (1 or 2 times)",
                            aux.attribute_require_counter = 1
                         or aux.attribute_require_counter = 2)
            assert(aux.deferred_require_counter = 0)
         end
         if ensure_flag then
            label_assert("postcondition evaluated (1 or 2 times)",
                            aux.attribute_ensure_counter = 1
                         or aux.attribute_ensure_counter = 2)
            label_assert("inherited postcondition evaluated (equal times)",
                            aux.deferred_ensure_counter = aux.attribute_ensure_counter)
         end
      end

   require_flag: BOOLEAN

   ensure_flag: BOOLEAN

   set_flags_require: BOOLEAN
      do
         require_flag := True
         Result := True
      end

   set_flags
      require
         set_flags_require
      do
      ensure
         set_flags_ensure
      end

   set_flags_ensure: BOOLEAN
      do
         ensure_flag := True
         Result := True
      end

end -- class TEST_ATTRIBUTE03
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
