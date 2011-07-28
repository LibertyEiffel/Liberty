-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class STRING_TYPE_MARK
   --
   -- Handling of the "STRING" type mark.
   --

inherit
   STATIC_TYPE_MARK
      redefine
         resolve_in
      end

insert
   NON_GENERIC_TYPE_MARK
      redefine
         resolve_in
      end

creation {ANY}
   make

feature {ANY}
   id: INTEGER is 7

   is_reference: BOOLEAN is True

   is_expanded, is_empty_expanded, is_user_expanded: BOOLEAN is False

   jvm_method_flags: INTEGER is 17

   written_name: HASHED_STRING is
         -- (Is always the same one.)
      once
         Result := string_aliaser.hashed_string(as_string)
      end

   class_text_name: CLASS_NAME

   type: TYPE is
         --|*** TYPE creation can be quite recursive, so this cannot be a once function <FM-14/10/2004>
      do
         Result := smart_eiffel.type_string
      end

   resolve_in (new_type: TYPE): TYPE is
      do
         Result := type
      end

   c_initialize_in (buffer: STRING) is
      do
         buffer.append(once "(void*)0")
      end

   run_type: TYPE_MARK is
      do
         Result := Current
      end

   jvm_descriptor_in (str: STRING) is
      do
         str.append(jvm_root_descriptor)
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
         code_attribute.opcode_aconst_null
         Result := 1
      end

   jvm_write_local_creation, jvm_write_local (offset: INTEGER) is
      do
         code_attribute.opcode_astore(offset)
      end

   jvm_xnewarray is
      local
         idx: INTEGER
      do
         idx := constant_pool.idx_jvm_root_class
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

   accept (visitor: STRING_TYPE_MARK_VISITOR) is
      do
         visitor.visit_string_type_mark(Current)
      end

   start_position: POSITION is
      do
         Result := class_text_name.start_position
      end

feature {TYPE}
   need_gc_mark_function (current_type: TYPE): BOOLEAN is
      do
         Result := True
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_string)
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
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
   make (sp: like start_position) is
      do
         create class_text_name.make(written_name, sp)
      end

invariant
   written_mark = as_string

end -- class STRING_TYPE_MARK
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
