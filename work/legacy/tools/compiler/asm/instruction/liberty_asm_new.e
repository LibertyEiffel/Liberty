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
class LIBERTY_ASM_NEW
   --
   -- New object creation
   --

inherit
   LIBERTY_ASM_INSTRUCTION
      redefine
         is_equal
      end

create {ANY}
   make

feature {ANY}
   type: LIBERTY_ASM_TYPE

   is_equal (other: like Current): BOOLEAN
      do
         Result := type.is_equal(other.type)
            and then Precursor(other)
      end

   accept (visitor: LIBERTY_ASM_VISITOR)
      local
         v: LIBERTY_ASM_INSTRUCTION_VISITOR
      do
         v ::= visitor
         v.visit_new(Current)
      end

feature {}
   make (a_type: like type)
      require
         a_type /= Void
      do
         type := a_type
      ensure
         type = a_type
      end

invariant
   type /= Void

end -- class LIBERTY_ASM_NEW
