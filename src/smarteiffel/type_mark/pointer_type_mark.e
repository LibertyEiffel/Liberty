-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class POINTER_TYPE_MARK
   --
   -- Handling the "POINTER" type mark.
   --

inherit
   KERNEL_EXPANDED_TYPE_MARK
      redefine default_expression, resolve_in
      end

creation {ANY}
   make

feature {ANY}
   id: INTEGER is 8

   written_name: HASHED_STRING is
         -- (Is always the same one.)
      once
         Result := string_aliaser.hashed_string(as_pointer)
      end

   type: TYPE is
         --|*** TYPE creation can be quite recursive, so this cannot be a once function <FM-14/10/2004>
      do
         Result := smart_eiffel.type_pointer
      end

   resolve_in (new_type: TYPE): TYPE is
      do
         Result := type
      end

   default_expression (sp: POSITION): EXPRESSION is
      do
         create {NULL_POINTER} Result.make(sp, Current)
      end

   accept (visitor: POINTER_TYPE_MARK_VISITOR) is
      do
         visitor.visit_pointer_type_mark(Current)
      end

   jvm_descriptor_in (str: STRING) is
      do
         str.append(once "Ljava/lang/Object;")
      end

   jvm_return_code is
      do
         code_attribute.opcode_areturn
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
         idx := constant_pool.idx_java_lang_object
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

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_pointer)
      end

feature {LIVE_TYPE}
   structure_mark: CHARACTER is 'p'

feature {}
   make (sp: like start_position) is
      do
         create class_text_name.make(written_name, sp)
      end

end -- class POINTER_TYPE_MARK
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
