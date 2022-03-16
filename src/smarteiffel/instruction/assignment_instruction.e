-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class ASSIGNMENT_INSTRUCTION
   --
   -- Common data for both ASSIGNMENT and ASSIGNMENT_ATTEMPT
   --

inherit
   INSTRUCTION

feature {ANY}
   left_side: EXPRESSION
   right_side: EXPRESSION

   end_mark_comment: BOOLEAN False

   side_effect_free (type: TYPE): BOOLEAN
      do
      end

   use_current (type: TYPE): BOOLEAN
      do
         if left_side.use_current(type) then
            Result := True
         else
            Result := right_side.use_current(type)
         end
      end

   start_position: POSITION
      do
         Result := left_side.start_position
      end

   has_been_specialized: BOOLEAN
      do
         Result := left_side.has_been_specialized
         Result := Result and right_side.has_been_specialized
      end

   safety_check (type: TYPE)
      do
         right_side.safety_check(type)
      end

invariant
   left_side /= Void
   right_side /= Void

end -- class ASSIGNMENT_INSTRUCTION
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
