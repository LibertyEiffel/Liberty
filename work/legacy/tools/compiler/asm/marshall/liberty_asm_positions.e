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
class LIBERTY_ASM_POSITIONS

inherit
   LIBERTY_ASM_INSTRUCTION_VISITOR
   LIBERTY_ASM_PROXY_VISITOR

insert
   LIBERTY_ASM_CODES

create {LIBERTY_ASM_CODES}
   make

feature {}
   make is
      do
      end

feature {LIBERTY_ASM_CODES}
   set_positions (a_types: COLLECTION[LIBERTY_ASM_TYPE]) is
      require
         a_types /= Void
      do
         a_types.do_all(agent visit_type)
      end

   sizeof (a_instruction: LIBERTY_ASM_INSTRUCTION): INTEGER is
      do
         counter := 0
         a_instruction.accept(Current)
         Result := counter
      end

feature {}
   visit_type (a_type: LIBERTY_ASM_TYPE) is
      require
         a_type /= Void
      do
         a_type.do_all_methods(agent visit_method)
      end

   visit_method (a_method: LIBERTY_ASM_METHOD) is
      require
         a_method /= Void
      do
         visit_code(a_method.code,          agent a_method.set_code_size)
         visit_code(a_method.retry_code,    agent a_method.set_retry_size)
         visit_code(a_method.precondition,  agent a_method.set_precondition_size)
         visit_code(a_method.postcondition, agent a_method.set_postcondition_size)
      end

   visit_code (a_code: LIBERTY_ASM_INSTRUCTION; size_setter: PROCEDURE[TUPLE[INTEGER]]) is
      local
         code: LIBERTY_ASM_INSTRUCTION
      do
         if a_code /= Void then
            counter := 0
            from
               code := a_code
            until
               code = Void
            loop
               code.accept(Current)
               code := code.next
            end
            check
               counter > 0
            end
            size_setter.call([counter])
         end
      end

   counter: INTEGER

   set_position (a_instruction: LIBERTY_ASM_INSTRUCTION; size: INTEGER) is
      require
         a_instruction /= Void
         size > 0
      do
         a_instruction.set_position(counter)
         counter := counter + size
      ensure
         a_instruction.position = old counter
         counter = old counter + size
      end

feature {LIBERTY_ASM_INSTRUCTION}
   visit_and (a_instruction: LIBERTY_ASM_AND) is
      do
         set_position(a_instruction, 1)
      end

   visit_invoke (a_instruction: LIBERTY_ASM_INVOKE) is
      do
         set_position(a_instruction, 9)
      end

   visit_proxy_invoke (a_instruction: LIBERTY_ASM_INSTRUCTION_PROXY; method_id, type_id: INTEGER) is
      do
         set_position(a_instruction, 9)
      end

   visit_jump (a_instruction: LIBERTY_ASM_JUMP) is
      do
         set_position(a_instruction, 5)
      end

   visit_proxy_jump (a_instruction: LIBERTY_ASM_INSTRUCTION_PROXY; position: INTEGER) is
      do
         set_position(a_instruction, 5)
      end

   visit_new (a_instruction: LIBERTY_ASM_NEW) is
      do
         set_position(a_instruction, 5)
      end

   visit_proxy_new (a_instruction: LIBERTY_ASM_INSTRUCTION_PROXY; type_id: INTEGER) is
      do
         set_position(a_instruction, 5)
      end

   visit_not (a_instruction: LIBERTY_ASM_NOT) is
      do
         set_position(a_instruction, 1)
      end

   visit_or (a_instruction: LIBERTY_ASM_OR) is
      do
         set_position(a_instruction, 1)
      end

   visit_return (a_instruction: LIBERTY_ASM_RETURN) is
      do
         set_position(a_instruction, 1)
      end

   visit_load_int (a_instruction: LIBERTY_ASM_LOAD_INT) is
      do
         set_position(a_instruction, 5)
      end

   visit_add_int (a_instruction: LIBERTY_ASM_ADD_INT) is
      do
         set_position(a_instruction, 1)
      end

   visit_sub_int (a_instruction: LIBERTY_ASM_SUB_INT) is
      do
         set_position(a_instruction, 1)
      end

   visit_mul_int (a_instruction: LIBERTY_ASM_MUL_INT) is
      do
         set_position(a_instruction, 1)
      end

   visit_div_int (a_instruction: LIBERTY_ASM_DIV_INT) is
      do
         set_position(a_instruction, 1)
      end

   visit_rem_int (a_instruction: LIBERTY_ASM_REM_INT) is
      do
         set_position(a_instruction, 1)
      end

   visit_call_native (a_instruction: LIBERTY_ASM_CALL_NATIVE) is
      do
         set_position(a_instruction, 6 + a_instruction.arguments.count)
      end

end -- class LIBERTY_ASM_WRITER
