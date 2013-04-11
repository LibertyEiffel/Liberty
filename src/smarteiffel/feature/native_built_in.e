-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATIVE_BUILT_IN

inherit
   NATIVE
      redefine side_effect_free
      end

creation {ANY}
   make

feature {ANY}
   accept (visitor: NATIVE_BUILT_IN_VISITOR) is
      do
         visitor.visit_native_built_in(Current)
      end

   use_current (er: EXTERNAL_ROUTINE): BOOLEAN is
      local
         name: STRING
      do
         name := er.first_name.to_string
         if name.has_prefix(once "basic_") then
         elseif as_se_argc = name then
         elseif as_se_argv = name then
         else
            Result := True
         end
      end

feature {EXTERNAL_FUNCTION}
   side_effect_free (target_type: TYPE; feature_text: FEATURE_TEXT): BOOLEAN is
      do
         if target_type.is_native_array then
            if feature_text.names.first.to_string = as_item then
               Result := True
            end
         elseif target_type.is_kernel_expanded then
            -- Assume all functions are side effect free:
            Result := feature_text.result_type /= Void
         end
      end

feature {EXTERNAL_ROUTINE}
   collect (type: TYPE; external_routine: EXTERNAL_ROUTINE) is
      do
      end

feature {EXTERNAL_TYPE}
   parse_external_type (alias_string: MANIFEST_STRING; target: EXTERNAL_TYPE) is
      do
         not_yet_implemented
      end

feature {}
   fe_nyi (rf: RUN_FEATURE) is
      do
         error_handler.add_position(rf.start_position)
         error_handler.append(once "Sorry, but this feature is not yet implemented for Current type ")
         error_handler.append(rf.type_of_current.name.to_string)
         error_handler.append(once ".")
         error_handler.print_as_fatal_error
      end

end -- class NATIVE_BUILT_IN
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
