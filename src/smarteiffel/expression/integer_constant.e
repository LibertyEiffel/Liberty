-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INTEGER_CONSTANT
   --
   -- For Manifest Constant of class INTEGER.
   --

inherit
   BASE_TYPE_CONSTANT
      redefine pretty_target
      end

insert
   PLATFORM
   
creation {ANY}
   make

creation {EIFFEL_PARSER}
   special, hexadecimal

creation {EIFFEL_PARSER, INTEGER_TYPE_MARK, CST_ATT_UNIQUE, EXTERNAL_FUNCTION}
   with

feature {ANY}
   extra_bracket_flag: BOOLEAN is
      do
         if pretty_view = Void then
            -- Because of the usual low priority of prefix minus:
            Result := value_memory < 0
         else
            Result := pretty_view.first = '-'
         end
      end

   pretty_target (indent_level: INTEGER) is
      do
         if pretty_view = Void then
            Precursor(indent_level)
         else
            if pretty_view.first = '-' or else pretty_view.has_prefix(once "0x") then
               pretty_printer.put_character('(')
               pretty(indent_level)
               pretty_printer.put_character(')')
            else
               pretty(indent_level)
            end
            pretty_printer.put_character('.')
         end
      end

   result_type: INTEGER_TYPE_MARK is
      do
         Result := result_type_memory
         if Result = Void then
            inspect
               size
            when 8 then
               Result ::= smart_eiffel.type_integer_8.canonical_type_mark
            when 16 then
               Result ::= smart_eiffel.type_integer_16.canonical_type_mark
            when 32 then
               Result ::= smart_eiffel.type_integer_32.canonical_type_mark
            when 64 then
               Result ::= smart_eiffel.type_integer_64.canonical_type_mark
            end
         end
      ensure
         Result /= Void
      end
   
   value_memory: INTEGER_64
         -- We use here a 64 bit INTEGER to be able to store large values.

   size: INTEGER
         -- is 8, 16, 32 or 64.
         -- Note this is the actual `size' of the `value_memory' which may be smaller or equal to the 
         -- corresponding size of the `result_type_memory'.

   declaration_type: TYPE is
      do
         inspect
            result_type.bit_count
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
   
   resolve_in (type: TYPE): TYPE is
      do
         Result := declaration_type
      end
   
   simplify_1_, simplify_2: like Current is
      do
         Result := Current
      end

   compile_to_c (type: TYPE) is
      local
         actual_size: INTEGER
      do
         if pretty_view /= Void then
            cpp.pending_c_function_body.append(once "/*")
            cpp.pending_c_function_body.append(pretty_view)
            cpp.pending_c_function_body.append(once "*/")
         end
         if result_type_memory /= Void then
            actual_size := result_type_memory.bit_count
         else
            actual_size := size
         end
         inspect
            actual_size
         when 8 then
            if value_memory = Minimum_integer_8 then
               cpp.pending_c_function_body.append(once "INT8_MIN")
            else
               cpp.pending_c_function_body.append(once "INT8_C(")
               value_memory.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.extend(')')
            end
         when 16 then
            if value_memory = Minimum_integer_16 then
               cpp.pending_c_function_body.append(once "INT16_MIN")
            else
               cpp.pending_c_function_body.append(once "INT16_C(")
               value_memory.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.extend(')')
            end
         when 32 then
            if value_memory = Minimum_integer_32 then
               cpp.pending_c_function_body.append(once "INT32_MIN")
            else
               cpp.pending_c_function_body.append(once "INT32_C(")
               value_memory.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.extend(')')
            end
         when 64 then
            if value_memory = Minimum_integer_64 then
               cpp.pending_c_function_body.append(once "INT64_MIN")
            else
               cpp.pending_c_function_body.append(once "INT64_C(")
               value_memory.append_in(cpp.pending_c_function_body)
               cpp.pending_c_function_body.extend(')')
            end
         end
      end

   compile_target_to_jvm, compile_to_jvm (type: TYPE) is
      do
         code_attribute.opcode_push_integer_value(value_memory, result_type.bit_count)
      end

   jvm_branch_if_false, jvm_branch_if_true (type: TYPE): INTEGER is
      do
         check
            False
         end
      end

   to_string: STRING is
      local
         buffer: STRING
      do
         buffer := once "..........."
         buffer.clear_count
         append_in(buffer)
         Result := buffer.twin
      end

   append_in (buffer: STRING) is
         -- Append in `buffer' Eiffel prettifyed view of `Current'.
      do
         if pretty_view /= Void then
            buffer.append(pretty_view)
         else
            value_memory.append_in(buffer)
         end
      end

   accept (visitor: INTEGER_CONSTANT_VISITOR) is
      do
         visitor.visit_integer_constant(Current)
      end

feature {TMP_FEATURE}
   to_real_constant: REAL_CONSTANT is
      local
         real_view: STRING
      do
         real_view := once "................................"
         real_view.clear_count
         value_memory.append_in(real_view)
         real_view.append(once ".0")
         create Result.make(start_position, real_view.twin, Void)
      end

feature {FEATURE_TEXT, ASSIGNMENT_HANDLER, IMPLICIT_CAST, INTROSPECTION_HANDLER}
   set_result_type (type_mark: TYPE_MARK) is
      require
         type_mark.is_integer
      do
         result_type_memory ::= type_mark
         check
            result_type_memory.bit_count >= size
         end
      ensure
         result_type = type_mark
      end

feature {INTROSPECTION_HANDLER}
   set_value (v: like value_memory) is
      do
         make(v, start_position)
      ensure
         value_memory = v
      end

feature {}
   result_type_memory: INTEGER_TYPE_MARK
         -- Usually Void (`size' is used).
   
   pretty_view: STRING
         -- Used as soon as the non basic notation is used. Non-basic means hexadecimal, underscore 
         -- or the {INTEGER_* ...} notation.
   
   special (sp: like start_position; pv: like pretty_view; rt: like result_type; vm: like value_memory) is
      require
         not sp.is_unknown
         not pv.is_empty
         rt /= Void
      do
         pretty_view := pv
         make(vm, sp)
         result_type_memory := rt
         inspect
            rt.bit_count
         when 8 then
            if not vm.fit_integer_8 then
               error_handler.add_position(sp)
               error_handler.append("Value `")
               error_handler.append(vm.to_string)
               error_handler.append("' is out of INTEGER_8 range.")
               error_handler.print_as_fatal_error
            end
         when 16 then
            if not vm.fit_integer_16 then
               error_handler.add_position(sp)
               error_handler.append("Value `")
               error_handler.append(vm.to_string)
               error_handler.append("' is out of INTEGER_16 range.")
               error_handler.print_as_fatal_error
            end
         when 32 then
            if not vm.fit_integer_32 then
               error_handler.add_position(sp)
               error_handler.append("Value `")
               error_handler.append(vm.to_string)
               error_handler.append("' is out of INTEGER_32 range.")
               error_handler.print_as_fatal_error
            end
         else
            -- Should normally fit.
         end
      end

   make (vm: like value_memory; sp: like start_position) is
      do
         start_position := sp
         value_memory := vm
         if value_memory.fit_integer_8 then
            size := 8
         elseif value_memory.fit_integer_16 then
            size := 16
         elseif value_memory.fit_integer_32 then
            size := 32
         else
            size := 64
         end
      end

feature {}
   hexadecimal (sp: like start_position; pv:like pretty_view; digit_count: INTEGER_8;
                negative: BOOLEAN;  a_value: INTEGER_64; ) is
      do
         start_position := sp
         pretty_view := pv
         value_memory := a_value
         inspect
            digit_count
         when 2 then
            size := 8
            if negative then
               value_memory := a_value.to_integer_8 | 0x80
            end
         when 4 then
            size := 16
            if negative then
               value_memory := a_value.to_integer_16 | 0x8000
            end
         when 8 then
            size := 32
            if negative then
               value_memory := a_value.to_integer_32 | 0x80000000
            end
         when 16 then
            size := 64
            if negative then
               value_memory := a_value | 0x8000000000000000
            end
         end
      end

   with (v: like value_memory; sp: like start_position; rt: like result_type) is
      require
         rt /= Void
      do
         make(v, sp)
         set_result_type(rt)
      ensure
         result_type_memory = rt
      end

invariant
   size = 8 xor size = 16 xor size = 32 xor size = 64

end -- class INTEGER_CONSTANT
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
