-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT23
   -- From a bug report of Harald Erdbrügger <he@softpoint.de>
   --

insert
   EIFFELTEST_TOOLS

create {}
   doit

feature {ANY}
   callback_a (i: AUX_AGENT22A)
      do
         i.set_c(2)
      end

   callback_b (i: AUX_AGENT22B)
      do
         i.set_c(5)
      end

   c_value: REAL

   callback_c (v: REAL)
      do
         c_value := v
      end

   ca_agent: PROCEDURE[TUPLE[AUX_AGENT22A]]

   cb_agent: PROCEDURE[TUPLE[AUX_AGENT22B]]

   cc_agent: PROCEDURE[TUPLE[REAL]]

   doit
      local
         aux_a: AUX_AGENT22A; aux_b: AUX_AGENT22B
      do
         create aux_a
         create aux_b
         ca_agent := agent callback_a(?)
         ca_agent.call([aux_a])
         assert(aux_a.c = 2)
         -- never called in beta5 and beta6, works in -74:
         -- agent call is missing in
         cb_agent := agent callback_b(?)
         cb_agent.call([aux_b])
         assert(aux_b.c = 5)
         cc_agent := agent callback_c(?)
         cc_agent.call([1.0])
         assert(c_value = 1.0)
      end

end -- class TEST_AGENT23
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
