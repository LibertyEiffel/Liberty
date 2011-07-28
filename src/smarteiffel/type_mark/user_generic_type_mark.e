-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class USER_GENERIC_TYPE_MARK
   --
   -- Handling of generic type mark excluding ARRAY, NATIVE_ARRAY, and AGENT_TYPE_MARK.
   --

inherit
   GENERIC_TYPE_MARK
      redefine
         weak_reference_argument
      end

creation {ANY}
   make

feature {ANY}
   jvm_method_flags: INTEGER is 17

   is_expanded: BOOLEAN is
      do
         Result := class_text.is_expanded
      end

   is_reference: BOOLEAN is
      do
         Result := not class_text.is_expanded
      end

   is_user_expanded: BOOLEAN is
      do
         Result := class_text.is_expanded
      end

   is_empty_expanded: BOOLEAN is
      do
         if is_user_expanded then
            Result := type.live_type.writable_attributes = Void
         end
      end

   id: INTEGER is
      do
         Result := type.live_type.id
      end

   jvm_descriptor_in (str: STRING) is
      do
         if is_reference then
            str.append(jvm_root_descriptor)
         else
            type.live_type.jvm_type_descriptor_in(str)
         end
      end

   jvm_target_descriptor_in (str: STRING) is
      do
      end

   jvm_return_code is
      do
         code_attribute.opcode_areturn
      end

   jvm_check_class_invariant is
      do
         standard_jvm_check_class_invariant
      end

   jvm_push_local (offset: INTEGER) is
      do
         code_attribute.opcode_aload(offset)
      end

   jvm_push_default: INTEGER is
      do
         Result := 1
         if is_expanded then
            type.live_type.jvm_expanded_push_default
         else
            code_attribute.opcode_aconst_null
         end
      end

   jvm_write_local_creation (offset: INTEGER) is
      do
         code_attribute.opcode_astore(offset)
      end

   jvm_write_local (offset: INTEGER) is
      do
         if not is_expanded then
            code_attribute.opcode_astore(offset)
         else
            jvm_write_local_expanded(offset)
         end
      end

   jvm_write_local_expanded (offset: INTEGER) is
      local
         rc: LIVE_TYPE; wa: ARRAY[RUN_FEATURE_2]
      do
         rc := type.live_type
         wa := rc.writable_attributes
         code_attribute.opcode_aload(offset)
         code_attribute.opcode_swap
         jvm.fields_by_fields_expanded_copy(wa)
         code_attribute.opcode_pop2
      end

   jvm_xnewarray is
      local
         idx: INTEGER
      do
         if is_reference then
            idx := constant_pool.idx_jvm_root_class
         else
            check
               is_user_expanded
            end
            idx := type.live_type.jvm_constant_pool_index
         end
         code_attribute.opcode_anewarray(idx)
      end

   jvm_xastore is
      do
         code_attribute.opcode_aastore
      end

   jvm_xaload is
      do
         code_attribute.opcode_aaload
      end

   jvm_if_x_eq: INTEGER is
      do
         Result := code_attribute.opcode_if_acmpeq
      end

   jvm_if_x_ne: INTEGER is
      do
         Result := code_attribute.opcode_if_acmpne
      end

   jvm_standard_is_equal is
      local
         rc: LIVE_TYPE; wa: ARRAY[RUN_FEATURE_2]
      do
         rc := type.live_type
         wa := rc.writable_attributes
         jvm.std_is_equal(rc, wa)
      end

   c_initialize_in (buffer: STRING) is
      do
         if is_expanded then
            c_initialize_user_expanded_in(buffer)
         else
            buffer.append(once "(void*)0")
         end
      end

   need_c_struct: BOOLEAN is
      do
         if is_empty_expanded then
         elseif is_expanded then
            Result := True
         elseif type.live_type.is_tagged then
            Result := True
         else
            Result := type.live_type.writable_attributes /= Void
         end
      end

   accept (visitor: USER_GENERIC_TYPE_MARK_VISITOR) is
      do
         visitor.visit_user_generic_type_mark(Current)
      end

feature {TYPE}
   need_gc_mark_function (current_type: TYPE): BOOLEAN is
      do
         if is_reference then
            Result := True
         else
            Result := current_type.live_type.gc_mark_to_follow
         end
      end

feature {TYPE}
   special_weak_reference_extra_check is
      require
         is_static
      local
         tm: TYPE_MARK
      do
         if class_text.name.to_string = as_weak_reference then
            tm := generic_list.first
            if tm.is_expanded then
               error_handler.add_type_mark(tm)
               error_handler.add_position(tm.start_position)
               error_handler.add_position(start_position)
               error_handler.append(" is expanded. The generic argument of WEAK_REFERENCE must not be %
                %expanded. (It does not makes sense to do so.)")
               error_handler.print_as_fatal_error
            end
         end
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
      do
         short_generic(shorted_type, class_text_name)
      end

feature {}
   make (bcn: like class_text_name; gl: like generic_list) is
      require
         bcn /= Void
         gl.lower = 1
         not gl.is_empty
      do
         class_text_name := bcn
         generic_list := gl
      ensure
         class_text_name = bcn
         generic_list = gl
      end

feature {ANY}
   weak_reference_argument (lt: LIVE_TYPE): LIVE_TYPE is
      do
         if lt.class_text_name.to_string = as_weak_reference then
            Result := generic_list.first.type.live_type
         end
      end

invariant
   generic_list.count >= 1

end -- class USER_GENERIC_TYPE_MARK
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
