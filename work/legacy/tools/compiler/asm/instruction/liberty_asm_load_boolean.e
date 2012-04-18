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
class LIBERTY_ASM_LOAD_BOOLEAN
   --
   -- Put a value on the stack
   --

inherit
   LIBERTY_ASM_INSTRUCTION
      redefine
         is_equal
      end

create {ANY}
   make

feature {ANY}
   value: BOOLEAN

   is_equal (other: like Current): BOOLEAN is
      do
         Result := value = other.value
            and then Precursor(other)
      end

   accept (visitor: LIBERTY_ASM_VISITOR) is
      local
         v: LIBERTY_ASM_INSTRUCTION_VISITOR
      do
         v ::= visitor
         v.visit_load_boolean(Current)
      end

feature {}
   make (a_value: like value) is
      do
         value := a_value
      ensure
         value = a_value
      end

end -- class LIBERTY_ASM_LOAD_BOOLEAN
