-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLASS_TYPE_MARK

inherit
   STATIC_TYPE_MARK
      redefine resolve_in
      end

creation {ANY}
   make

feature {ANY}
   class_text_name: CLASS_NAME

   is_generic: BOOLEAN is False

   jvm_method_flags: INTEGER is 17

   written_name: HASHED_STRING is
      do
         Result := class_text_name.hashed_name
      end

   type: TYPE is
      do
         if type_memory = Void then
            type_memory := smart_eiffel.get_type_for_non_generic(Current)
         end
         Result := type_memory
      end

   resolve_in (new_type: TYPE): TYPE is
      do
         Result := type
      end

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
         Result := is_expanded
      end

   is_empty_expanded: BOOLEAN is
      do
         if is_expanded and then not type.has_external_type then
            Result := type.live_type.writable_attributes = Void
         end
      end

   generic_list: ARRAY[TYPE_MARK] is
      do
         check
            False -- Because of the inherited require.
         end
      end

   id: INTEGER is
      do
         Result := class_text.id
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
         if is_reference then
            code_attribute.opcode_aconst_null
         else
            type.live_type.jvm_expanded_push_default
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
         wa: ARRAY[RUN_FEATURE_2]
      do
         wa := type.live_type.writable_attributes
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
         wa: ARRAY[RUN_FEATURE_2]
      do
         wa := type.live_type.writable_attributes
         jvm.std_is_equal(type.live_type, wa)
      end

   accept (visitor: CLASS_TYPE_MARK_VISITOR) is
      do
         visitor.visit_class_type_mark(Current)
      end

   c_header_pass1 is
      do
         if not type.has_external_type then
            standard_c_typedef
         else
            cpp.out_h_buffer.clear_count
            cpp.out_h_buffer.append(once "typedef ")
            cpp.out_h_buffer.append(type.external_type.type_name)
            cpp.out_h_buffer.append(once " T")
            id.append_in(cpp.out_h_buffer)
            cpp.out_h_buffer.append(once ";%N")
            cpp.write_out_h_buffer
         end
      end

   c_header_pass2 is
      do
      end

   c_header_pass3 is
      do
         if is_expanded then
            if need_c_struct then
               standard_c_struct
            end
         end
      end

   c_header_pass4 is
      do
         if is_reference then
            if need_c_struct then
               standard_c_struct
            end
         end
         standard_c_object_model
         standard_c_print_function
      end

   c_type_for_argument_in (buffer: STRING) is
      do
         if is_reference then
            buffer.append(once "T0*")
         elseif is_empty_expanded then
            buffer.append(once "int")
         else
            buffer.extend('T')
            id.append_in(buffer)
         end
      end

   c_type_for_target_in (buffer: STRING) is
      do
         if is_empty_expanded then
            buffer.append(once "int")
         else
            buffer.extend('T')
            id.append_in(buffer)
            buffer.extend('*')
         end
      end

   c_type_for_result_in (buffer: STRING) is
      do
         if is_reference then
            buffer.append(once "T0*")
         elseif is_empty_expanded then
            buffer.append(once "int")
         else
            buffer.extend('T')
            id.append_in(buffer)
         end
      end

   need_c_struct: BOOLEAN is
      do
         if is_empty_expanded then
         elseif type.has_external_type then
         elseif is_expanded then
            Result := True
         elseif type.live_type.is_tagged then
            Result := True
         else
            Result := type.live_type.writable_attributes /= Void
         end
      end

   start_position: POSITION is
      do
         Result := class_text_name.start_position
      end

   c_initialize_in (buffer: STRING) is
      do
         if is_expanded then
            check
               is_user_expanded
            end
            if not type.has_external_type then
               c_initialize_user_expanded_in(buffer)
            else
               buffer.append(type.external_type.default_value)
            end
         else
            buffer.append(once "(void*)0")
         end
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

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING is
      do
         Result := canonical_long_name
      end

feature {LIVE_TYPE}
   just_before_gc_mark_in (str: STRING) is
      do
         if is_reference then
            standard_just_before_gc_mark_in(str)
         end
      end

   gc_info_in (str: STRING) is
      do
         if is_reference then
            standard_gc_info_in(str)
         end
      end

   gc_define1 is
      do
         if is_reference then
            standard_gc_define1
         end
      end

   gc_define2 is
      do
         if is_reference then
            standard_gc_define2
         else
            standard_gc_define2_for_expanded
         end
      end

feature {TYPE_MARK}
   frozen short_ (shorted_type: TYPE) is
      do
         short_printer.put_class_name(class_text_name)
      end

   set_start_position (sp: like start_position) is
      do
         if start_position /= sp then
            class_text_name := class_text_name.twin
            class_text_name.set_accurate_position(sp)
         end
      end

feature {}
   type_memory: like type

   make (ctn: like class_text_name) is
      require
         not ctn.predefined
         not ctn.is_tuple_related
      local
         n, written_site: STRING; error_flag: BOOLEAN
      do
         class_text_name := ctn
         n := ctn.to_string
         if n = as_integer_general then
            written_site := ctn.start_position.class_text.name.to_string
            if not written_site.has_prefix(as_integer) then
               error_flag := True
            end
         elseif n = as_real_general then
            written_site := ctn.start_position.class_text.name.to_string
            if not written_site.has_prefix(as_real) then
               error_flag := True
            end
         end
         if error_flag then
            error_handler.add_position(ctn.start_position)
            error_handler.append("The ")
            error_handler.append(n)
            error_handler.append(" type cannot be used here. Actually this is only a compiler %
                                 %implementation facility.")
            error_handler.print_as_fatal_error
         end
      ensure
         class_text_name = ctn
      end

end -- class CLASS_TYPE_MARK
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
