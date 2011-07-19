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
class LIBERTY_ASM_INSTRUCTION_PROXY_EQUAL_VISITOR

inherit
   LIBERTY_ASM_PROXY_VISITOR

create {LIBERTY_ASM_INSTRUCTION_PROXY}
   make

feature {LIBERTY_ASM_INSTRUCTION_PROXY}
   start (a_instruction: LIBERTY_ASM_INSTRUCTION_PROXY) is
      do
         kind := kind_unset
         a_instruction.accept(Current)
      end

   confirm (a_instruction: LIBERTY_ASM_INSTRUCTION_PROXY) is
      do
         a_instruction.accept(Current)
         inspect kind
         when kind_new then
            confirmed := type_id > 0
         when kind_invoke then
            confirmed := type_id > 0 and then method_id > 0
         when kind_jump then
            confirmed := position > 0
         else
            confirmed := False
         end
      end

   confirmed: BOOLEAN

feature {LIBERTY_ASM_INSTRUCTION_PROXY}
   visit_proxy_new (a_instruction: LIBERTY_ASM_INSTRUCTION_PROXY; a_type_id: INTEGER) is
      do
         inspect
            kind
         when kind_unset then
            type_id := a_type_id
         when kind_new then
            if type_id /= a_type_id then
               type_id := -1
            end
         else
            kind := kind_error
         end
      end

   visit_proxy_invoke (a_instruction: LIBERTY_ASM_INSTRUCTION_PROXY; a_method_id, a_type_id: INTEGER) is
      do
         inspect
            kind
         when kind_unset then
            type_id := a_type_id
            method_id := a_method_id
         when kind_invoke then
            if type_id /= a_type_id then
               type_id := -1
            end
            if method_id /= a_method_id then
               method_id := -1
            end
         else
            kind := kind_error
         end
      end

   visit_proxy_jump (a_instruction: LIBERTY_ASM_INSTRUCTION_PROXY; a_position: INTEGER) is
      do
         inspect
            kind
         when kind_unset then
            position := a_position
         when kind_jump then
            if position /= a_position then
               position := -1
            end
         else
            kind := kind_error
         end
      end

feature {}
   make is
      do
      end

   kind: INTEGER_8
   type_id: INTEGER
   method_id: INTEGER
   position: INTEGER

   kind_error:  INTEGER_8 is -1
   kind_unset:  INTEGER_8 is  0
   kind_new:    INTEGER_8 is  1
   kind_invoke: INTEGER_8 is  2
   kind_jump:   INTEGER_8 is  3

end -- class LIBERTY_ASM_INSTRUCTION_PROXY_EQUAL_VISITOR
