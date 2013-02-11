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
class LIBERTY_ASM_JUMP
   --
   -- Some conditional jump
   --

inherit
   LIBERTY_ASM_INSTRUCTION
      redefine
         is_equal
      end

create {ANY}
   make, set_target

feature {ANY}
   target: LIBERTY_ASM_INSTRUCTION
         -- the jump target

   is_equal (other: like Current): BOOLEAN is
      local
         eq: SAFE_EQUAL[LIBERTY_ASM_INSTRUCTION]
      do
         Result := eq.test(target, other.target)
            and then Precursor(other)
      end

   set_target (a_target: like target) is
      do
         target := a_target
      ensure
         target = a_target
      end

   accept (visitor: LIBERTY_ASM_VISITOR) is
      local
         v: LIBERTY_ASM_INSTRUCTION_VISITOR
      do
         v ::= visitor
         v.visit_jump(Current)
      end

feature {}
   make is
      do
      end

end -- class LIBERTY_ASM_JUMP
