-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT06
   -- From: Michael Utech <michael@itd.utech.de>

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   data: ARRAY[STRING]

   for_each (action: PROCEDURE[TUPLE[STRING]])
      local
         i: INTEGER
      do
         from
            i := data.lower
         until
            i > data.upper
         loop
            action.call([data.item(i)])
            i := i + 1
         end
      end

   make
      local
         test: STRING
      do
         data := {ARRAY[STRING] 1, << "eins", "zwei", "drei" >> }
         test := "zwei"
         for_each(agent print_string(?, True))
      end

   print_string (s: STRING; new_line: BOOLEAN)
      do
         assert(new_line)
         inspect
            assert_counter.item
         when 1 then
            assert(s.is_equal("eins"))
         when 3 then
            assert(s.is_equal("zwei"))
         when 5 then
            assert(s.is_equal("drei"))
         end
      end

end -- class TEST_AGENT06
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
