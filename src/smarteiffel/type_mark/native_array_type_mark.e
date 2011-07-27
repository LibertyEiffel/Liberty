-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATIVE_ARRAY_TYPE_MARK
   --
   -- Handling of the "NATIVE_ARRAY[FOO]" type mark.
   --

inherit
   GENERIC_TYPE_MARK
      redefine
         typed_internals_type_mark, canonical_long_name
      end

creation {ANY}
   make

feature {ANY}
   is_expanded: BOOLEAN is True

   is_reference, is_empty_expanded, is_user_expanded: BOOLEAN is False

   jvm_method_flags: INTEGER is 9

   elements_type: TYPE_MARK is
      do
         Result := generic_list.first
      end

   of_references: BOOLEAN is
      do
         Result := elements_type.is_reference
      end

   id: INTEGER is
      do
         Result := type.live_type.id
      end

   need_c_struct: BOOLEAN is
      do
      end

   c_initialize_in (buffer: STRING) is
      do
         buffer.append(once "(void*)0")
      end

   c_type_for_argument_in (str: STRING) is
      do
         str.extend('T')
         id.append_in(str)
      end

   c_type_for_target_in (str: STRING) is
      do
         c_type_for_argument_in(str)
      end

   c_type_for_result_in (str: STRING) is
      do
         c_type_for_argument_in(str)
      end

   jvm_target_descriptor_in, jvm_descriptor_in (str: STRING) is
      do
         str.extend('[')
         elements_type.jvm_descriptor_in(str)
      end

   jvm_return_code is
      do
         code_attribute.opcode_areturn
      end

   jvm_push_local (offset: INTEGER) is
      do
         code_attribute.opcode_aload(offset)
      end

   jvm_check_class_invariant is
      do
      end

   jvm_push_default: INTEGER is
      do
         code_attribute.opcode_aconst_null
         Result := 1
      end

   jvm_write_local_creation, jvm_write_local (offset: INTEGER) is
      do
         code_attribute.opcode_astore(offset)
      end

   jvm_xnewarray is
      local
         idx: INTEGER; buffer: STRING
      do
         buffer := once "......................."
         buffer.clear_count
         jvm_target_descriptor_in(buffer)
         idx := constant_pool.idx_class2(buffer)
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
         ca: like code_attribute; point1, point2: INTEGER
      do
         ca := code_attribute
         point1 := jvm_if_x_eq
         ca.opcode_iconst_0
         point2 := ca.opcode_goto
         ca.resolve_u2_branch(point1)
         ca.opcode_iconst_1
         ca.resolve_u2_branch(point2)
      end

   accept (visitor: NATIVE_ARRAY_TYPE_MARK_VISITOR) is
      do
         visitor.visit_native_array_type_mark(Current)
      end

feature {TYPE}
   need_gc_mark_function (current_type: TYPE): BOOLEAN is
      do
         Result := True
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
      do
         short_generic(shorted_type, class_text_name)
      end

feature {INTROSPECTION_HANDLER}
   typed_internals_type_mark (position: POSITION): TYPE_MARK is
      local
         tm: TYPE_MARK
         hs: HASHED_STRING
         cn: CLASS_NAME
         gl: ARRAY[TYPE_MARK]
      do
         hs := string_aliaser.hashed_string(as_native_array_internals)
         tm := elements_type.at(position)
         create cn.make(hs, position)
         gl := {ARRAY[TYPE_MARK] 1, <<tm>>}
         create {USER_GENERIC_TYPE_MARK} Result.make(cn, gl)
      end

feature {}
   make (sp: like start_position; of_what: TYPE_MARK) is
      require
         not sp.is_unknown
         of_what /= Void
      local
         of_what_wm, buffer: STRING
      do
         buffer := once "............................................."
         create class_text_name.make(native_array_name, sp)
         create generic_list.make(1, 1)
         generic_list.put(of_what, 1)
         of_what_wm := of_what.written_mark
         buffer.copy(as_native_array)
         buffer.extend('[')
         buffer.append(of_what_wm)
         buffer.extend(']')
         written_name_memory := string_aliaser.hashed_string(buffer)
      ensure
         start_position = sp
      end

   native_array_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_native_array)
      end

   canonical_long_name: HASHED_STRING is
      do
         Result := native_array_name
      end

end -- class NATIVE_ARRAY_TYPE_MARK
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
