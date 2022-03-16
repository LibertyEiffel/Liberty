-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class DEFERRED_PROCEDURE
   --
   -- For deferred routines.
   --

inherit
   DEFERRED_ROUTINE

create {ANY}
   make, from_effective

feature {ANY}
   result_type: TYPE_MARK
      do
      end

   from_effective (fn: FEATURE_NAME; fa: like arguments; ra: like require_assertion; ea: like ensure_assertion
      bc: like class_text; pe: like permissions)
      do
         feature_text := bc.non_written(fn, Current)
         make_routine(fa, Void, Void, ra, False)
         permissions := pe
         if ea /= Void then
            set_ensure_assertion(ea)
         end
      end

feature {ANY}
   accept (visitor: DEFERRED_PROCEDURE_VISITOR)
      do
         visitor.visit_deferred_procedure(Current)
      end

feature {}
   make (fa: like arguments; om: like obsolete_mark; hc: like header_comment; ra: like require_assertion)
      do
         make_routine(fa, om, hc, ra, False)
      end

end -- class DEFERRED_PROCEDURE
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
