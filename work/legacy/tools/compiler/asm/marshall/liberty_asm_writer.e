-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_ASM_WRITER

inherit
   LIBERTY_ASM_INSTRUCTION_VISITOR

insert
   LIBERTY_ASM_CODES

create {LIBERTY_ASM_MARSHALLER}
   write

feature {}
   write (a_stream: OUTPUT_STREAM; a_system: LIBERTY_ASM_SYSTEM) is
      require
         a_stream /= Void
         a_system /= Void
      do
         positions.set_positions(a_system.types)
         stream := a_stream
         put_data(system_marker)
         put_data(a_system.main.id)
         put_data(a_system.main.type.id)
         a_system.types.do_all(agent visit_type)
      end

   stream: OUTPUT_STREAM

   put_string (string: ABSTRACT_STRING) is
      require
         string /= Void
      do
         put_data(string.count)
         string.do_all(agent (c: CHARACTER) is
                          do
                             put_code(c.to_integer_8)
                          end
                       )
      end

   put_native (native: LIBERTY_ASM_NATIVE_VALUE) is
      do
         if native = Void then
            put_code(native_void)
         elseif native.is_integer then
            put_code(native_integer)
         elseif native.is_pointer then
            put_code(native_pointer)
         else
            check False end
         end
      end

   put_code (code: INTEGER_8) is
      do
         stream.put_character(code.to_character)
      end

   put_data (int: INTEGER) is
      do
         stream.put_character(( int         & 0xff).to_character)
         stream.put_character(((int |>>  8) & 0xff).to_character)
         stream.put_character(((int |>> 16) & 0xff).to_character)
         stream.put_character(((int |>> 24) & 0xff).to_character)
      end

   visit_type (a_type: LIBERTY_ASM_TYPE) is
      require
         a_type /= Void
      do
         put_data(type_marker)
         put_data(a_type.id)
         put_data(a_type.attributes_count)
         put_data(a_type.methods_count)
         a_type.do_all_methods(agent visit_method)
      end

   visit_method (a_method: LIBERTY_ASM_METHOD) is
      local
         flags: INTEGER_8
      do
         put_data(method_marker)
         put_data(a_method.id)
         put_data(a_method.parameters.count)
         if a_method.retry_code /= Void then
            flags := flags | flag_retry
         end
         if a_method.precondition /= Void then
            flags := flags | flag_precondition
         end
         if a_method.postcondition /= Void then
            flags := flags | flag_postcondition
         end
         put_code(flags)
         visit_code(a_method.code,          a_method.code_size)
         visit_code(a_method.retry_code,    a_method.retry_size)
         visit_code(a_method.precondition,  a_method.precondition_size)
         visit_code(a_method.postcondition, a_method.postcondition_size)
      end

   visit_code (a_instruction: LIBERTY_ASM_INSTRUCTION; size: INTEGER) is
      require
         size > 0 implies a_instruction /= Void
         size >= 0
      local
         code: LIBERTY_ASM_INSTRUCTION
      do
         if size > 0 then
            put_data(size)
            from
               code := a_instruction
            until
               code = Void
            loop
               code.accept(Current)
               code := code.next
            end
         end
      end

feature {LIBERTY_ASM_INSTRUCTION}
   visit_and (a_instruction: LIBERTY_ASM_AND) is
      do
         put_code(asm_and)
      end

   visit_invoke (a_instruction: LIBERTY_ASM_INVOKE) is
      do
         put_code(asm_invoke)
         put_data(a_instruction.method.type.id)
         put_data(a_instruction.method.id)
      end

   visit_jump (a_instruction: LIBERTY_ASM_JUMP) is
      do
         put_code(asm_jump)
         put_data(a_instruction.target.position)
      end

   visit_new (a_instruction: LIBERTY_ASM_NEW) is
      do
         put_code(asm_new)
         put_data(a_instruction.type.id)
      end

   visit_not (a_instruction: LIBERTY_ASM_NOT) is
      do
         put_code(asm_not)
      end

   visit_or (a_instruction: LIBERTY_ASM_OR) is
      do
         put_code(asm_or)
      end

   visit_return (a_instruction: LIBERTY_ASM_RETURN) is
      do
         put_code(asm_return)
      end

   visit_load_int (a_instruction: LIBERTY_ASM_LOAD_INT) is
      do
         put_code(asm_load_int)
         put_data(a_instruction.value)
      end

   visit_add_int (a_instruction: LIBERTY_ASM_ADD_INT) is
      do
         put_code(asm_add_int)
      end

   visit_sub_int (a_instruction: LIBERTY_ASM_SUB_INT) is
      do
         put_code(asm_sub_int)
      end

   visit_mul_int (a_instruction: LIBERTY_ASM_MUL_INT) is
      do
         put_code(asm_mul_int)
      end

   visit_div_int (a_instruction: LIBERTY_ASM_DIV_INT) is
      do
         put_code(asm_div_int)
      end

   visit_rem_int (a_instruction: LIBERTY_ASM_REM_INT) is
      do
         put_code(asm_rem_int)
      end

   visit_call_native (a_instruction: LIBERTY_ASM_CALL_NATIVE) is
      do
         put_code(asm_call_native)
         put_string(a_instruction.symbol)
         put_native(a_instruction.return)
         put_data(a_instruction.arguments.count)
         a_instruction.arguments.do_all(agent put_native)
      end

end -- class LIBERTY_ASM_WRITER
