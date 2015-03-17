-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_PRECURSOR01
   -- Written by Vincent CROIZIER.

inherit
   AUX_PRECURSOR01
      redefine make, class_number_in_trace, class_number, times_class_number, affine_class_number_in_trace
      end

create {}
   make

feature {ANY}
   make
      do
         class_number_in_trace
      end

   class_number: INTEGER
      do
         Result := Precursor {AUX_PRECURSOR01}  + 1
      end

   class_number_in_trace
      do
         Precursor
         trace := trace + 1
      end

   times_class_number (x: INTEGER): INTEGER
      do
         Result := Precursor(x) + x
      end

   affine_class_number_in_trace (x, y: INTEGER)
      do
         Precursor(x, y)
         trace := trace + x
      end

end -- class TEST_PRECURSOR01
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
