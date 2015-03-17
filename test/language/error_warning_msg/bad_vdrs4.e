-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class BAD_VDRS4
--SZ:179: Testing VDRS.4 rule

inherit
   AUX_VDRS4
      redefine
         b -- VDRS.4
      end

   --
   -- a,b are deferred in TS6
   --
   -- ETL says inheriting a deferred routine is a (re)declaration
   -- but not a (re)definition. Thus a deferred feature should not
   -- appear in a redefine clause (VDRS.4 p 152/153 in french
   -- version of ETL)(fix in BASE_CLASS.look_up_for). Same problem
   -- when trying to undefine a deferred feature (VDUS.3, fix in
   -- PARENT.apply_undefine)
   --

create {}
   make

feature {ANY}
   a do end
   b do end

feature {}
   make
      do
         a
         b
      end

end -- class BAD_VDRS4
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
