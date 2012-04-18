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
class LIBERTY_ASM_STACK_SLICE
   --
   -- A slice of the stack, starting at the top.
   --

inherit
   ITERATOR[LIBERTY_ASM_STACK_VALUE]

create {LIBERTY_ASM_STACK_CONTEXT}
   make

feature {ANY}
   start is
      do
         index := stack_values.upper
         generation := iterable_generation
      end

   is_off: BOOLEAN is
      do
         Result := index < lower
      end

   item: LIBERTY_ASM_STACK_VALUE is
      do
         Result := stack_values.item(index)
      end

   next is
      do
         index := index - 1
      end

feature {}
   make (a_stack_values: like stack_values; a_count: INTEGER) is
      require
         a_stack_values /= Void
         a_count <= a_stack_values.count
      do
         stack_values := a_stack_values
         lower := a_stack_values.upper - a_count + 1
         start
      end

   stack_values: FAST_ARRAY[LIBERTY_ASM_STACK_VALUE]
   index, lower: INTEGER

   iterable_generation: INTEGER is
      do
         Result := stack_values.generation
      end

invariant
   stack_values /= Void
   index >= stack_values.lower

end -- class LIBERTY_ASM_STACK_SLICE
