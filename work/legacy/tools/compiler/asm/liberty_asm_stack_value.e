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
class LIBERTY_ASM_STACK_VALUE
   --
   -- A value in the stack.
   --

create {ANY}
   as_true, as_false, as_any_boolean, as_integer, as_any_integer

feature {ANY}
   is_constant: BOOLEAN

   is_integer: BOOLEAN
      do
         Result := kind = kind_integer
      end

   is_boolean: BOOLEAN
      do
         Result := kind = kind_boolean
      end

   const_boolean: BOOLEAN
      require
         is_constant
         is_boolean
      do
         Result := value /= 0
      end

   const_integer: BOOLEAN
      require
         is_constant
         is_integer
      do
         Result := Value
      end

feature {LIBERTY_ASM_STACK_CONTEXT}
   instruction_index: INTEGER

   set_instruction_index (a_index: like instruction_index)
      do
         instruction_index := a_index
      ensure
         instruction_index = a_index
      end

feature {}
   kind: INTEGER_8
   kind_integer: INTEGER_8 1
   kind_boolean: INTEGER_8 2

   value: INTEGER

   as_true
      do
         kind := kind_boolean
         is_constant := True
         Result := 1
      ensure
         is_constant
         is_boolean
         const_boolean
      end

   as_false
      do
         kind := kind_boolean
         is_constant := True
         Result := 0
      ensure
         is_constant
         is_boolean
         not const_boolean
      end

   as_any_boolean
      do
         kind := kind_boolean
      ensure
         is_boolean
         not is_constant
      end

   as_integer (a_value: INTEGER)
      do
         kind := kind_integer
         is_constant := True
         value := a_value
      ensure
         is_integer
         is_constant
         const_integer = a_value
      end

   as_any_integer
      do
         kind := kind_integer
      ensure
         is_integer
         not is_constant
      end

invariant
   kind.in_range(kind_integer, kind_boolean)

end -- class LIBERTY_ASM_STACK_VALUE
