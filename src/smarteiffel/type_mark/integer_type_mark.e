-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INTEGER_TYPE_MARK
   --
   -- Handling of the "INTEGER" type mark. This class handles all variants of the "INTEGER" type
   -- mark: "INTEGER_8", "INTEGER_16", "INTEGER_32", "INTEGER_64"
   --

inherit
   KERNEL_EXPANDED_TYPE_MARK
      redefine pretty_in, default_expression, resolve_in, class_text
      end

creation {ANY}
   integer_8, integer_16, integer_32, integer_64, integer

feature {ANY}
   pretty_name: HASHED_STRING
         -- The one actually written in the source code (`as_integer_8', `as_integer_16', `as_integer'
         -- or `as_integer_64').

   class_text: CLASS_TEXT is
      local
         ta: TYPE_ALIASING
      do
         Result := class_text_memory
         if Result = Void then
            if class_text_name.hashed_name = integer_name then
               class_text_name.set_hashed_name(ta.integer_alias)
               Result := Precursor
               class_text_name.set_hashed_name(integer_name)
            else
               Result := Precursor
            end
         end
      end

   bit_count: INTEGER is
         -- Result is 8, 16, 32 or 64.
      do
         Result := bit_count_memory
      ensure
         (Result = 8) or (Result = 16) or (Result = 32) or (Result = 64)
      end

   id: INTEGER is
      do
         inspect
            bit_count
         when 8 then
            Result := 1
         when 16 then
            Result := 10
         when 32 then
            Result := 2
         when 64 then
            Result := 11
         end
      end

   type: TYPE is
      do
         inspect
            bit_count
         when 8 then
            Result := smart_eiffel.type_integer_8
         when 16 then
            Result := smart_eiffel.type_integer_16
         when 32 then
            Result := smart_eiffel.type_integer_32
         when 64 then
            Result := smart_eiffel.type_integer_64
         end
      end

   resolve_in (new_type: TYPE): TYPE is
      do
         Result := type
      end

   default_expression (sp: POSITION): EXPRESSION is
      do
         create {INTEGER_CONSTANT} Result.with(0, sp, Current)
      end

   accept (visitor: INTEGER_TYPE_MARK_VISITOR) is
      do
         visitor.visit_integer_type_mark(Current)
      end

   written_name: HASHED_STRING is
      do
         Result := class_text_name.hashed_name
      end

   pretty_in (buffer: STRING) is
      do
         buffer.append(pretty_name.to_string)
      end

   jvm_descriptor_in (str: STRING) is
      do
         inspect
            bit_count
         when 8 then
            str.extend('B')
         when 16 then
            str.extend('S')
         when 32 then
            str.extend('I')
         when 64 then
            str.extend('J')
         end
      end

   jvm_return_code is
      do
         inspect
            bit_count
         when 8, 16, 32 then
            code_attribute.opcode_ireturn
         when 64 then
            code_attribute.opcode_lreturn
         end
      end

   jvm_push_local (offset: INTEGER) is
      do
         inspect
            bit_count
         when 8, 16, 32 then
            code_attribute.opcode_iload(offset)
         when 64 then
            code_attribute.opcode_lload(offset)
         end
      end

   jvm_push_default: INTEGER is
      do
         inspect
            bit_count
         when 8, 16, 32 then
            code_attribute.opcode_iconst_0
         when 64 then
            code_attribute.opcode_lconst_0
         end
         Result := 1
      end

   jvm_write_local_creation, jvm_write_local (offset: INTEGER) is
      do
         inspect
            bit_count
         when 8, 16, 32 then
            code_attribute.opcode_istore(offset)
         when 64 then
            code_attribute.opcode_lstore(offset)
         end
      end

   jvm_xnewarray is
      do
         inspect
            bit_count
         when 8 then
            code_attribute.opcode_newarray(8)
         when 16 then
            code_attribute.opcode_newarray(9)
         when 32 then
            code_attribute.opcode_newarray(10)
         when 64 then
            code_attribute.opcode_newarray(11)
         end
      end

   jvm_xastore is
      do
         inspect
            bit_count
         when 8 then
            code_attribute.opcode_bastore
         when 16 then
            code_attribute.opcode_sastore
         when 32 then
            code_attribute.opcode_iastore
         when 64 then
            code_attribute.opcode_lastore
         end
      end

   jvm_xaload is
      do
         inspect
            bit_count
         when 8 then
            code_attribute.opcode_baload
         when 16 then
            code_attribute.opcode_saload
         when 32 then
            code_attribute.opcode_iaload
         when 64 then
            code_attribute.opcode_laload
         end
      end

   jvm_if_x_eq: INTEGER is
      do
         inspect
            bit_count
         when 8, 16, 32 then
            Result := code_attribute.opcode_if_icmpeq
         when 64 then
            code_attribute.opcode_lcmp
            Result := code_attribute.opcode_ifeq
         end
      end

   jvm_if_x_ne: INTEGER is
      do
         inspect
            bit_count
         when 8, 16, 32 then
            Result := code_attribute.opcode_if_icmpne
         when 64 then
            code_attribute.opcode_lcmp
            Result := code_attribute.opcode_ifne
         end
      end

feature {TYPE, TYPE_MARK, SMART_EIFFEL}
   long_name: HASHED_STRING is
      do
         Result := class_text_name.hashed_name
      end

feature {LIVE_TYPE}
   structure_mark: CHARACTER is
      do
         inspect
            bit_count
         when 8 then
            Result := 'c'
         when 16 then
            Result := 's'
         when 32 then
            Result := 'i'
         when 64 then
            Result := 'I'
         end
      end

feature {TYPE}
   can_be_assigned_to (other: TYPE_MARK): BOOLEAN is
      local
         integer_type_mark: INTEGER_TYPE_MARK; real_type_mark: REAL_TYPE_MARK
      do
         if other.is_integer then
            integer_type_mark ::= other
            Result := bit_count <= integer_type_mark.bit_count
         elseif other.class_text_name.to_string = as_integer_general then
            -- We relax the rule only to be able to share code in INTEGER_GENERAL.
            Result := True
         elseif other.is_real then
            real_type_mark ::= other
            Result := real_type_mark.bit_count > bit_count
         end
      end

feature {}
   bit_count_memory: INTEGER
         -- (See `bit_count'.)

   integer_8 (sp: like start_position) is
      do
         bit_count_memory := 8
         pretty_name := integer_8_name
         create class_text_name.make(integer_8_name, sp)
      end

   integer_16 (sp: like start_position) is
      do
         bit_count_memory := 16
         pretty_name := integer_16_name
         create class_text_name.make(integer_16_name, sp)
      end

   integer_32 (sp: like start_position) is
      do
         bit_count_memory := 32
         pretty_name := integer_32_name
         create class_text_name.make(integer_32_name, sp)
      end

   integer (sp: like start_position) is
      local
         ta: TYPE_ALIASING
      do
         bit_count_memory := ta.integer_bit_count
         pretty_name := integer_name
         create class_text_name.make(ta.integer_alias, sp)
      end

   integer_64 (sp: like start_position) is
      do
         bit_count_memory := 64
         pretty_name := integer_64_name
         create class_text_name.make(integer_64_name, sp)
      end

   integer_8_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_integer_8)
      end

   integer_16_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_integer_16)
      end

   integer_32_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_integer_32)
      end

   integer_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_integer)
      end

   integer_64_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_integer_64)
      end

   integer_general_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_integer_general)
      end

invariant
   written_mark.has_prefix(as_integer)

end -- class INTEGER_TYPE_MARK
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
