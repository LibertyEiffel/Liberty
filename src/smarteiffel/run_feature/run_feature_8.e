-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_8

inherit
   RUN_FEATURE
      redefine base_feature
      end

creation {EXTERNAL_FUNCTION}
   for

feature {ANY}
   accept (visitor: RUN_FEATURE_8_VISITOR) is
      do
         visitor.visit_run_feature_8(Current)
      end

feature {ANY}
   base_feature: EXTERNAL_FUNCTION

   arguments: FORMAL_ARG_LIST

   result_type: TYPE_MARK

   require_assertion: REQUIRE_ASSERTION

   ensure_assertion: ENSURE_ASSERTION

   local_vars: LOCAL_VAR_LIST

   routine_body: INSTRUCTION

   is_deferred: BOOLEAN is False

   side_effect_free: BOOLEAN is False

   is_once_procedure: BOOLEAN is False

   is_once_function: BOOLEAN is False

   arg_count: INTEGER is
      do
         if arguments /= Void then
            Result := arguments.count
         end
      end

   rescue_compound: INSTRUCTION is
      do
      end

   mapping_jvm is
      local
         bf: like base_feature; native: NATIVE; bcn: STRING
      do
         bf := base_feature
         native := bf.native
         bcn := bf.class_text.name.to_string
         native.jvm_mapping_function(Current, bcn, bf.first_name.to_string)
      end

feature {LIVE_TYPE}
   jvm_field_or_method is
      local
         bf: like base_feature; native: NATIVE; n, bcn: STRING
      do
         bf := base_feature
         n := bf.first_name.to_string
         native := base_feature.native
         bcn := bf.class_text.name.to_string
         native.jvm_add_method_for_function(Current, bcn, n)
      end

feature {JVM}
   jvm_define is
      local
         bf: like base_feature; native: NATIVE; n, bcn: STRING
      do
         bf := base_feature
         n := bf.first_name.to_string
         native := bf.native
         bcn := bf.class_text.name.to_string
         native.jvm_define_function(Current, bcn, n)
      end

feature {NATIVE}
   jvm_opening is
      do
         method_info_start
         jvm_define_opening
      end

   jvm_closing is
      do
         jvm_define_closing
         result_type.jvm_push_local(base_feature.jvm_result_offset(type_of_current))
         result_type.jvm_return_code
         method_info.finish
      end

   jvm_closing_fast is
         -- Skip ensure and assume the result is already pushed.
      do
         result_type.jvm_return_code
         method_info.finish
      end

feature {}
   do_adapt is
      local
         class_text: CLASS_TEXT
      do
         class_text := type_of_current.class_text
         -- Adapt the arguments
         arguments := base_feature.arguments
         if arguments /= Void then
            arguments := arguments.adapt_for(type_of_current)
         end
         -- Adapt the local variables
         local_vars := base_feature.local_vars
         if local_vars /= Void then
            local_vars := local_vars.adapt_for(type_of_current)
         end
         -- Adapt the routine body:
         routine_body := base_feature.adapt_routine_body_for(type_of_current)
         -- Adapt the assertions:
         if class_text.require_check and then base_feature.require_assertion /= Void then
            require_assertion := base_feature.require_assertion.adapt_for(type_of_current)
         end
         if class_text.ensure_check and then base_feature.ensure_assertion /= Void then
            smart_eiffel.old_list_stack_push
            ensure_assertion := base_feature.ensure_assertion.adapt_for(type_of_current)
            old_list := smart_eiffel.old_list_stack_pop
         end
      end

   set_result_type is
      do
         -- Adapt the result type:
         result_type := base_feature.result_type.resolve_in(type_of_current).canonical_type_mark --|*** CAD: need of resolve_in?
      ensure
         result_type /= Void
      end

   compute_use_current is
      do
         smart_eiffel.push_context(base_feature)
         if base_feature.use_current(type_of_current) then
            use_current_state := True_state
         else
            std_compute_use_current
         end
         smart_eiffel.pop_context(base_feature)
      end

   update_tmp_jvm_descriptor is
      do
         routine_update_tmp_jvm_descriptor
      end

end -- class RUN_FEATURE_8
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
-- Liberty Eiffel is based on SmartEiffel (Copyrights blow)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
