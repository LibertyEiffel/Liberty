-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT30
   -- From SZ:211: bug in assignment attempt of agents objects.

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   last_call: INTEGER

   msg: STRING

   no_arg
      do
         last_call := 1
      end

   str_arg (s: STRING)
      do
         last_call := 2
         msg := s
      end

   make
      local
         a: PROCEDURE[TUPLE]; b: PROCEDURE[TUPLE[STRING]]
      do
         b := agent str_arg(?)
         b.call(["test"])
         assert(last_call = 2)
         last_call := 0
         assert(msg.is_equal("test"))
         msg := Void
         b := agent no_arg
         a ?= b
         assert(a /= Void)
         a.call([])
         assert(last_call = 1)
         last_call := 0
         assert(msg = Void)
      end

end -- class TEST_AGENT30
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
