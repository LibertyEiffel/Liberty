-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TAGGED_ERROR
   --
   -- Just a memo class used by the ERROR_HANDLER to save error data
   -- (mainly warnings, to be emitted later)
   --

insert
   RECYCLABLE

create {ERROR_HANDLER}
   make

feature {ERROR_HANDLER}
   explanation: STRING
   positions: FAST_ARRAY[POSITION]
   is_emitted: BOOLEAN

   set_emitted
      require
         not is_emitted
      do
         is_emitted := True
      ensure
         is_emitted
      end

   make (exp: like explanation; pos: like positions)
      require
         exp /= Void
         pos /= Void
      do
         if explanation = Void then
            explanation := exp.twin
            positions := pos.twin
         else
            explanation.copy(exp)
            positions.copy(pos)
         end
         is_emitted := False
      ensure
         explanation /= exp
         explanation.is_equal(exp)
         positions /= pos
         positions.is_equal(pos)
         not is_emitted
      end

feature {RECYCLING_POOL}
   recycle
      do
         explanation.clear_count
         positions.clear_count
         is_emitted := True
      end

invariant
   explanation /= Void
   positions /= Void

end -- class TAGGED_ERROR
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
