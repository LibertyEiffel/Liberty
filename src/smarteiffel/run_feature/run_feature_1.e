-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_1

inherit
   RUN_FEATURE
      redefine base_feature
      end

creation {CST_ATT}
   for

feature {ANY}
   base_feature: CST_ATT

   value: EXPRESSION

   result_type: TYPE_MARK

   is_deferred: BOOLEAN is False

   side_effect_free: BOOLEAN is True

   is_once_procedure: BOOLEAN is False

   is_once_function: BOOLEAN is False

   arguments: FORMAL_ARG_LIST is
      do
      end

   require_assertion: REQUIRE_ASSERTION is
      do
      end

   local_vars: LOCAL_VAR_LIST is
      do
      end

   routine_body: INSTRUCTION is
      do
      end

   ensure_assertion: ENSURE_ASSERTION is
      do
      end

   rescue_compound: INSTRUCTION is
      do
      end

   afd_check is
      do
      end

   mapping_c is
      local
         has_target: BOOLEAN
      do
         if cpp.target_cannot_be_dropped then
            has_target := True
            cpp.pending_c_function_body.extend(',')
         end
         cpp.pending_c_function_body.append(once "/*RF1")
         cpp.pending_c_function_body.append(name.to_string)
         cpp.pending_c_function_body.append(once "*/")
         value.compile_to_c(type_of_current)
         if has_target then
            cpp.pending_c_function_body.extend(')')
         end
      end

   c_define is
      do
      end

feature {LIVE_TYPE}
   jvm_field_or_method is
      do
      end

feature {RUN_FEATURE}
   compute_use_current is
      do
         use_current_state := False_state
      end

feature {ANY}
   mapping_jvm is
      do
         jvm.drop_target
         value.compile_to_jvm(type_of_current)
      end

feature {JVM}
   jvm_define is
      do
      end

feature {}
   do_adapt is
      do
      end

   set_result_type is
      do
         result_type := base_feature.result_type
         check
            result_type.is_static
         end
         value := base_feature.value
      end

   update_tmp_jvm_descriptor is
      do
      end

end -- class RUN_FEATURE_1
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
