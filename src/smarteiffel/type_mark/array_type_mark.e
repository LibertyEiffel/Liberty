-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ARRAY_TYPE_MARK
   --
   -- Handling of the "ARRAY[FOO]" type mark.
   --
   -- Note: can be implicit when used for the type of manifest arrays.
   --

inherit
   GENERIC_TYPE_MARK
      redefine
         canonical_long_name
      end

creation {ANY}
   make

feature {ANY}
   is_reference: BOOLEAN is True

   is_expanded, is_empty_expanded, is_user_expanded: BOOLEAN is False

   jvm_method_flags: INTEGER is 17

   array_of: TYPE_MARK is
      do
         Result := generic_list.first
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

   id: INTEGER is
      do
         Result := type.live_type.id
      end

   accept (visitor: ARRAY_TYPE_MARK_VISITOR) is
      do
         visitor.visit_array_type_mark(Current)
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
      do
         short_generic(shorted_type, class_text_name)
      end

feature {}
   make (sp: like start_position; of_what: TYPE_MARK) is
      require
         not sp.is_unknown
         of_what /= Void
      do
         create class_text_name.make(array_name, sp)
         set_generic_list_with(of_what)
      ensure
         start_position = sp
         class_text_name.to_string = as_array
         array_of = of_what
      end

   set_generic_list_with (t: TYPE_MARK) is
      do
         create generic_list.make(1, 1)
         generic_list.put(t, 1)
      end

   array_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_array)
      end

   canonical_long_name: HASHED_STRING is
      do
         Result := array_name
      end

invariant
   generic_list.count = 1

   generic_list.lower = 1

end -- class ARRAY_TYPE_MARK
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
