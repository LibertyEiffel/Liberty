-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_FEATURE_2

inherit
   RUN_FEATURE
      redefine base_feature, prepare_introspection, prepare_introspection2
      end

creation {WRITABLE_ATTRIBUTE}
   for

feature {ANY}
   accept (visitor: RUN_FEATURE_2_VISITOR) is
      do
         visitor.visit_run_feature_2(Current)
      end

feature {ANY}
   base_feature: WRITABLE_ATTRIBUTE

   result_type: TYPE_MARK

   is_deferred: BOOLEAN is False

   is_once_procedure: BOOLEAN is False

   is_once_function: BOOLEAN is False

   order: INTEGER
         -- Used for special sorting of LIVE_TYPE.writable_attributes

   side_effect_free: BOOLEAN is
      do
         if ace.ensure_check then
            Result := (require_assertion = Void or else require_assertion.side_effect_free(type_of_current)) and then (ensure_assertion = Void or else ensure_assertion.side_effect_free(type_of_current))
         elseif ace.require_check then
            Result := require_assertion = Void or else require_assertion.side_effect_free(type_of_current)
         else
            Result := True
         end
      end

   arguments: FORMAL_ARG_LIST is
      do
      end

   require_assertion: REQUIRE_ASSERTION

   local_vars: LOCAL_VAR_LIST is
      do
      end

   routine_body: INSTRUCTION is
      do
      end

   rescue_compound: INSTRUCTION is
      do
      end

   ensure_assertion: ENSURE_ASSERTION

   put_c_field_name is
         --  Emit using `cpp' the corresponding field name with an extra C comment which
         --  include the offset of the corresponding C field. This extra C comment is
         --  mandatory to force C recompilation, because the field may move from one
         --  compilation to another.
      require
         cpp.pending_c_function
      do
         cpp.pending_c_function_body.extend('_')
         cpp.pending_c_function_body.append(name.to_string)
         cpp.recompilation_comment(type_of_current.live_type)
      end

feature {LIVE_TYPE}
   mapping_c_inside_introspect is
      do
         cpp.pending_c_function_body.extend('(')
         if type_of_current.is_reference then
            cpp.pending_c_function_body.append(once "(*C)->")
            put_c_field_name
         else
            check
               type_of_current.is_user_expanded
            end
            cpp.pending_c_function_body.append(once "(*C).")
            put_c_field_name
         end
         cpp.pending_c_function_body.extend(')')
      end

feature {}
   do_adapt is
      local
         class_text: CLASS_TEXT
      do
         class_text := type_of_current.class_text
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

feature {LIVE_TYPE}
   set_order (o: like order) is
      require
         o >= 0
      do
         order := o
      ensure
         order = o
      end

feature {}
   compute_use_current is
      do
         use_current_state := True_state
      end

feature {LIVE_TYPE}
   jvm_field_or_method is
      do
         jvm.add_field(Current)
      end

feature {ANY}
   mapping_jvm is
      local
         idx: INTEGER; stack_level: INTEGER
      do
         jvm.push_target_as_target
         if type_of_current.is_kernel_expanded then
            check
               as_item = name.to_string
            end
         else
            stack_level := result_type.jvm_stack_space - 1
            idx := constant_pool.idx_fieldref(Current)
            code_attribute.opcode_getfield(idx, stack_level)
         end
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
            lt.c_return_introspect(Current, Void)
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

feature {JVM}
   jvm_define is
      local
         name_idx, descriptor: INTEGER; cp: like constant_pool; access_flags: INTEGER
      do
         cp := constant_pool
         name_idx := cp.idx_utf8(name.to_string)
         descriptor := cp.idx_utf8(jvm_descriptor)
         access_flags := field_info.field_modifier(name_idx)
         field_info.add(access_flags, name_idx, descriptor)
      end

feature {C_MAPPER, C_LIVE_TYPE_COMPILER}
   need_c_function: BOOLEAN is
      do
         if ace.ensure_check then
            Result := (require_assertion /= Void) or else (ensure_assertion /= Void)
         elseif ace.require_check then
            Result := require_assertion /= Void
         end
      end

feature {}
   update_tmp_jvm_descriptor is
      local
         rt: TYPE_MARK
      do
         rt := result_type
         if rt.is_reference then
            tmp_jvm_descriptor.append(jvm_root_descriptor)
         else
            rt.jvm_descriptor_in(tmp_jvm_descriptor)
         end
      end

invariant
   order >= 0

end -- class RUN_FEATURE_2
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
