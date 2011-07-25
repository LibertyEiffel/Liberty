-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class LOCAL_ARGUMENT2
   --
   -- Common behavior for LOCAL_NAME2 and ARGUMENT_NAME2
   --

inherit
   EXPRESSION

feature {ANY}
   frozen non_void_no_dispatch_type (type: TYPE): TYPE is
      local
         rt: TYPE
      do
         rt := resolve_in(type)
         if rt.is_expanded then
            Result := rt
         end
      end

   frozen simplify (type: TYPE): EXPRESSION is
      do
         Result := Current
      end

   frozen side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := True
      end

   frozen safety_check (type: TYPE) is
      do
      end

   frozen compile_target_to_jvm (type: TYPE) is
      do
         standard_compile_target_to_jvm(type)
      end

invariant
   not start_position.is_unknown

end -- class LOCAL_ARGUMENT2
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
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
