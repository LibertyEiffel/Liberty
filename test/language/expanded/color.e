-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class COLOR

insert
   ANY
      redefine out
      end

create {ANY}
   default_create, make_rgb

feature {ANY}
   make_rgb (r, g, b: INTEGER_8)
      do
         red := r
         green := g
         blue := b
         alpha := 0
      end

   to_integer_32: INTEGER_32
      do
         Result := alpha.to_integer_32
         Result := red.to_integer_32
         Result := green.to_integer_32
         Result := blue.to_integer_32
      end

   out: STRING
      do
         Result := alpha.out + red.out + green.out + blue.out + to_integer_32.to_hexadecimal
      end

feature {ANY}
   red: INTEGER_8

   green: INTEGER_8

   blue: INTEGER_8

   alpha: INTEGER_8

end -- class COLOR
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
