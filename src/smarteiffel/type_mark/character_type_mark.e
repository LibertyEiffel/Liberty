-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CHARACTER_TYPE_MARK
   --
   -- Handling of the "CHARACTER" type mark.
   --

inherit
   KERNEL_EXPANDED_TYPE_MARK
      redefine resolve_in, default_expression
      end

creation {ANY}
   make

feature {ANY}
   id: INTEGER is 3

   written_name: HASHED_STRING is
         -- (Is always the same one.)
      once
         Result := string_aliaser.hashed_string(as_character)
      end

   type: TYPE is
         --|*** TYPE creation can be quite recursive, so this cannot be a once function <FM-14/10/2004>
      do
         Result := smart_eiffel.type_character
      end

   resolve_in (new_type: TYPE): TYPE is
      do
         Result := type
      end

   default_expression (sp: POSITION): EXPRESSION is
      do
         create {CHARACTER_CONSTANT} Result.with(sp, '%U')
      end

   accept (visitor: CHARACTER_TYPE_MARK_VISITOR) is
      do
         visitor.visit_character_type_mark(Current)
      end

   jvm_descriptor_in (str: STRING) is
      do
         str.extend('B')
      end

   jvm_return_code is
      do
         code_attribute.opcode_ireturn
      end

   jvm_push_local (offset: INTEGER) is
      do
         code_attribute.opcode_iload(offset)
      end

   jvm_push_default: INTEGER is
      do
         code_attribute.opcode_iconst_0
         Result := 1
      end

   jvm_write_local_creation, jvm_write_local (offset: INTEGER) is
      do
         code_attribute.opcode_istore(offset)
      end

   jvm_xnewarray is
      do
         code_attribute.opcode_newarray(8)
      end

   jvm_xastore is
      do
         code_attribute.opcode_bastore
      end

   jvm_xaload is
      do
         code_attribute.opcode_baload
      end

   jvm_if_x_eq: INTEGER is
      do
         Result := code_attribute.opcode_if_icmpeq
      end

   jvm_if_x_ne: INTEGER is
      do
         Result := code_attribute.opcode_if_icmpne
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_character)
      end

feature {LIVE_TYPE}
   structure_mark: CHARACTER is 'c'

feature {}
   make (sp: like start_position) is
      do
         create class_text_name.make(written_name, sp)
      end

invariant
   written_mark = as_character

end -- class CHARACTER_TYPE_MARK
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
