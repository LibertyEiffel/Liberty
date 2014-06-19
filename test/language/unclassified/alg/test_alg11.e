-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ALG11
   -- From a bug report of Alain Le Guennec <Alain.Le_Guennec@irisa.fr>

create {}
   make

feature {ANY}
   t: AUX_ALG11T

   u: AUX_ALG11U

   v: AUX_ALG11V

   w: AUX_ALG11W

   ta: ARRAY[ANY]

   tt: ARRAY[AUX_ALG11T]

   tu: ARRAY[AUX_ALG11U]

   tv: ARRAY[AUX_ALG11V]

   tw: ARRAY[AUX_ALG11W]

   make
      do
         create t
         create u
         create v
         create w
         tt := {ARRAY[AUX_ALG11V] 1, << v >> }
         tu := {ARRAY[AUX_ALG11W] 1, << w >> }
         tv := {ARRAY[AUX_ALG11V] 1, << v >> }
         tw := {ARRAY[AUX_ALG11W] 1, << w >> }
         tt := {ARRAY[AUX_ALG11T] 1, << v, t >> }
         tu := {ARRAY[AUX_ALG11U] 1, << u, w >> }
         tu := {ARRAY[AUX_ALG11U] 1, << w, v >> }
         tu := {ARRAY[AUX_ALG11U] 1, << v, w >> }
         tt := {ARRAY[AUX_ALG11T] 1, << w, v >> }
         tt := {ARRAY[AUX_ALG11T] 1, << v, w >> }
         ta := {ARRAY[AUX_ALG11T] 1, << t >> }
      end

end -- class TEST_ALG11
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
