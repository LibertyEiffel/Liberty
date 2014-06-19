-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class PERFECT

create {ANY}
   make

feature {ANY}
   make
      local
         t: TRIANGLE; p1, p2, p3: POINT; i: INTEGER
      do
         create p1.make(1.0, 1.0)
         create p2.make(2.0, 2.0)
         create p3.make(3.0, 3.0)
         create t.make(p1, p2, p3)
         from
            i := 2000000
         until
            i = 0
         loop
            p1.make(1.0, 1.0)
            p2.make(2.0, 2.0)
            p3.make(3.0, 3.0)
            t.make(p1, p2, p3)
            i := i - 1
            --io.put_pointer(t.to_pointer);
            --io.put_new_line;
         end
      end

end -- class PERFECT
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
