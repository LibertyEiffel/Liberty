-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_6

inherit
   RUN_FEATURE
      redefine base_feature, prepare_introspection, prepare_introspection2
      end

creation {ONCE_FUNCTION}
   for

feature {ANY}
   accept (visitor: RUN_FEATURE_6_VISITOR) is
      do
         visitor.visit_run_feature_6(Current)
      end

feature {ANY}
   base_feature: ONCE_FUNCTION

   arguments: FORMAL_ARG_LIST

   result_type: TYPE_MARK

   require_assertion: REQUIRE_ASSERTION

   local_vars: LOCAL_VAR_LIST

   routine_body: INSTRUCTION

   rescue_compound: INSTRUCTION

   ensure_assertion: ENSURE_ASSERTION

   is_deferred: BOOLEAN is False

   is_once_procedure: BOOLEAN is False

   is_once_function: BOOLEAN is True

   is_precomputable_once: BOOLEAN is
      do
         Result := once_routine_pool.is_precomputed(base_feature)
      end

   side_effect_free: BOOLEAN is
      do
         Result := is_precomputable_once
      end

   mapping_jvm is
      do
         routine_mapping_jvm
      end

feature {}
   do_adapt is
      local
         class_text: CLASS_TEXT
      do
         class_text := type_of_current.class_text
         -- Adapt the arguments --|*** CAD: need?
         arguments := base_feature.arguments
         if arguments /= Void then
            arguments := arguments.adapt_for(type_of_current)
         end
         -- Adapt the local variables --|*** CAD: need?
         local_vars := base_feature.local_vars
         if local_vars /= Void then
            local_vars := local_vars.adapt_for(type_of_current)
         end
         -- Adapt the routine body:
         routine_body := base_feature.routine_body
         if routine_body /= Void then
            routine_body := routine_body.adapt_for(type_of_current)
         end
         -- Adapt the assertions:
         if class_text.require_check and then base_feature.require_assertion /= Void then
            require_assertion := base_feature.require_assertion.adapt_for(type_of_current)
         end
         if class_text.ensure_check and then base_feature.ensure_assertion /= Void then
            smart_eiffel.old_list_stack_push
            ensure_assertion := base_feature.ensure_assertion.adapt_for(type_of_current)
            old_list := smart_eiffel.old_list_stack_pop
         end
         -- Adapt the rescue clause:
         rescue_compound := base_feature.rescue_compound_in(type_of_current)
         if rescue_compound /= Void then
            exceptions_handler.set_used
            rescue_compound := rescue_compound.adapt_for(type_of_current)
         end
         once_routine_pool.register_function(Current)
      end

   set_result_type is
      do
         -- Adapt the result type:
         result_type := base_feature.result_type.resolve_in(type_of_current).canonical_type_mark --|*** CAD: need of resolve_in?
      ensure
         result_type /= Void
      end

feature {LIVE_TYPE}
   jvm_field_or_method is
      do
         jvm.add_method(Current)
      end

feature {JVM}
   jvm_define is
      local
         branch, idx_flag: INTEGER; ca: like code_attribute
         pco : BOOLEAN
      do
         pco := is_precomputable_once
         if not pco then
            ca := code_attribute
            idx_flag := once_routine_pool.idx_fieldref_for_flag(Current)
         end
         method_info_start
         if not pco then
            ca.opcode_getstatic(idx_flag, 1)
            branch := ca.opcode_ifne
            ca.opcode_iconst_1
            ca.opcode_putstatic(idx_flag, -1)
            jvm_define_opening
            jvm_increment_invariant_flag
            if routine_body /= Void then
               routine_body.compile_to_jvm(type_of_current)
            end
            jvm_decrement_invariant_flag
            jvm_define_closing
            ca.resolve_u2_branch(branch)
         end
         once_routine_pool.jvm_result_load(type_of_current, base_feature)
         result_type.jvm_return_code
         method_info.finish
      end

feature {LIVE_TYPE}
   prepare_introspection (put_else: BOOLEAN): BOOLEAN is
      local
         lt: LIVE_TYPE
      do
         lt := result_type.type.live_type
         if lt /= Void then
            if put_else then
               cpp.pending_c_function_body.append(once "else ")
            end
            cpp.pending_c_function_body.append(once "if (!strcmp(attr,%"")
            cpp.pending_c_function_body.append(name.to_string)
            cpp.pending_c_function_body.append(once "%")) {%N")
            if is_precomputable_once then
               lt.c_return_introspect(Void, Current)
            else
               once_routine_pool.c_test_o_flag_introspect(Current)
               lt.c_return_introspect(Void, Current)
               cpp.pending_c_function_body.append(once "} else { *id=0; }%N")
            end
            cpp.pending_c_function_body.append(once "}%N")
            Result := True
         else
            Result := put_else
         end
      end

   prepare_introspection2 (put_coma: BOOLEAN): BOOLEAN is
      local
         lt: LIVE_TYPE
      do
         lt := result_type.type.live_type
         if lt /= Void then
            if put_coma then
               cpp.pending_c_function_body.append(once ", ")
            else
               cpp.pending_c_function_body.extend('"')
            end
            cpp.pending_c_function_body.append(name.to_string)
            Result := True
         else
            Result := put_coma
         end
      end

feature {}
   compute_use_current is
      do
         if type_of_current.is_reference then
            if ace.no_check then
               use_current_state := True_state
            else
               std_compute_use_current
            end
         else
            std_compute_use_current
         end
      end

   update_tmp_jvm_descriptor is
      do
         routine_update_tmp_jvm_descriptor
      end

end -- class RUN_FEATURE_6
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
