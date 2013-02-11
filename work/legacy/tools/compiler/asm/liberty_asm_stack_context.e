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
class LIBERTY_ASM_STACK_CONTEXT

create {LIBERTY_ASM_INSTRUCTION}
   make

feature {LIBERTY_ASM_INSTRUCTION}
   resolve: LIBERTY_ASM_INSTRUCTION is
      do
         (instructions.lower |..| (instructions.upper - 1)).do_all(agent set_next_instruction)
         Result := instructions.first
      end

   count: INTEGER is
      do
         Result := values.count
      end

   get (a_count: INTEGER): ITERATOR[LIBERTY_ASM_STACK_VALUE] is
         -- Returns a slice of values, starting at the top of the values stack and going down.
      require
         a_count <= count
      do
         create {LIBERTY_ASM_STACK_SLICE} Result.make(values, a_count)
      ensure
         Result.count = a_count
      end

   put (a_instruction: LIBERTY_ASM_INSTRUCTION; a_value: LIBERTY_ASM_STACK_VALUE) is
         -- Adds an instruction. If `a_value' is not Void, it means it is pushd on the stack by the
         -- instruction.
      require
         a_instruction /= Void
      do
         instructions.add_last(a_instruction)
         if a_value /= Void then
            a_value.set_instruction_index(instructions.upper)
            values.add_last(a_value)
         end
      end

   drop (a_count: INTEGER) is
         -- Drop `a_count' values and all the instructions that generated them
      require
         a_count <= count
      local
         instructions_upper: INTEGER
      do
         FAUX car il se peut qu'il y ait des instructions qui n'ont rien à voir au milieu et qui doivent être conservées

         if a_count = count then
            instructions.clear_count
            values.clear_count
         else
            instructions_upper := values.item(values.upper - a_count + 1).instruction_index
            instructions.remove_tail(instructions.upper - instructions_upper)
            check
               instructions.upper = instructions_upper - 1
            end
            values.remove_tail(a_count)
         end
      ensure
         count = old count - a_count
      end

feature {}
   make is
      do
         create instructions.make
         create values.make
      end

   instructions: FAST_ARRAY[LIBERTY_ASM_INSTRUCTION]
   values: FAST_ARRAY[LIBERTY_ASM_STACK_VALUE]

   set_next_instruction (index: INTEGER) is
      require
         index.in_range(instructions.lower, instructions.upper - 1)
      do
         instructions.item(index).set_next(instructions.item(index + 1))
      ensure
         instructions.item(index).next = instructions.item(index + 1)
      end

   valid_instruction_index (a_value: LIBERTY_ASM_STACK_VALUE): BOOLEAN is
      do
         Result := instructions.valid_index(a_value.instruction_index)
      end

invariant
   instructions /= Void
   values /= Void
   values.for_all(agent valid_instruction_index)

end -- class LIBERTY_ASM_STACK_CONTEXT
