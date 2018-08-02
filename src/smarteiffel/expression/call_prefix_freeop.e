-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CALL_PREFIX_FREEOP
   --
   -- Prefix free operator : "@...", "#...", "|...", "&..."
   --

inherit
   CALL_PREFIX

create {EIFFEL_PARSER}
   make

create {CALL_PREFIX}
   with

feature {ANY}
   precedence: INTEGER 11

   operator: STRING
      do
         Result := feature_name.to_string
      end

feature {ANY}
   accept (visitor: CALL_PREFIX_FREEOP_VISITOR)
      do
         visitor.visit_call_prefix_freeop(Current)
      end

feature {}
   make (t: like target; pn: like feature_name)
      require
         t /= Void
         pn.is_free_operator
      do
         target := t
         feature_name := pn
      end

invariant
   feature_name.is_free_operator

end -- class CALL_PREFIX_FREEOP
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
