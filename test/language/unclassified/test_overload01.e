-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_OVERLOAD01
   -- C++ operator overloading

inherit
   EIFFELTEST_TOOLS
      redefine default_create
      end

create {}
   default_create

feature {ANY} -- Creation
   default_create
      do
         external_object := cpp_new
         set_value(25)
         assert(value = 25)
      end

   set_value (v: INTEGER)
      do
         cpp_set_value(external_object, v)
      end

   value: INTEGER
      do
         Result := cpp_value(external_object)
      end

feature {} -- Implementation
   external_object: POINTER

   cpp_value (instance: POINTER): INTEGER
      external "[
                  C++ [Overload "aux_overload01.h"](): int
                ]"
      alias "value"
      end

   cpp_set_value (instance: POINTER; v: INTEGER)
      external "[
                  C++ [Overload "aux_overload01.h"](int)
                ]"
      alias "value"
      end

   cpp_new: POINTER
      external "[
                  C++ [new Overload "aux_overload01.h"]()
                ]"
      end

end -- class TEST_OVERLOAD01
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
