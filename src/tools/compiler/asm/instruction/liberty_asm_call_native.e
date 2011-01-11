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
class LIBERTY_ASM_CALL_NATIVE
   --
   -- Call a native (low-level) function
   --

inherit
   LIBERTY_ASM_INSTRUCTION
      redefine
         is_equal
      end

create {ANY}
   make

feature {ANY}
   symbol: FIXED_STRING
   arguments: COLLECTION[LIBERTY_ASM_NATIVE_VALUE]
   return: LIBERTY_ASM_NATIVE_VALUE

   is_equal (other: like Current): BOOLEAN is
      do
         Result := symbol = other.symbol
            and then arguments.is_equal(other.arguments)
            and then ((return = Void) or else (return /= Void and then return.is_equal(other.return)))
            and then Precursor(other)
      end

   accept (visitor: LIBERTY_ASM_VISITOR) is
      local
         v: LIBERTY_ASM_INSTRUCTION_VISITOR
      do
         v ::= visitor
         v.visit_call_native(Current)
      end

feature {}
   make (a_symbol: like symbol; a_arguments: like arguments; a_return: like return) is
      require
         a_symbol /= Void
         a_arguments /= Void
      do
         symbol := a_symbol
         arguments := a_arguments
         return := a_return
      ensure
         symbol = a_symbol
         arguments = a_arguments
         return = a_return
      end

invariant
   symbol /= Void
   arguments /= Void

end -- class LIBERTY_ASM_CALL_NATIVE
