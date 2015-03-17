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
class LIBERTY_ASM_INVOKE

inherit
   LIBERTY_ASM_INSTRUCTION
      redefine
         is_equal
      end

create {ANY}
   make

feature {ANY}
   method: LIBERTY_ASM_METHOD

   is_equal (other: like Current): BOOLEAN
      do
         Result := other.method.is_equal(method)
            and then Precursor(other)
      end

   accept (visitor: LIBERTY_ASM_VISITOR)
      local
         v: LIBERTY_ASM_INSTRUCTION_VISITOR
      do
         v ::= visitor
         v.visit_invoke(Current)
      end

feature {}
   make (a_method: like method)
      require
         a_method /= Void
      do
         method := a_method
      ensure
         method = a_method
      end

invariant
   method /= Void

end -- class LIBERTY_ASM_INVOKE
