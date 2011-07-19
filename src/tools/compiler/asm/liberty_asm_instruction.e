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
deferred class LIBERTY_ASM_INSTRUCTION
   --
   -- Some low-level "assembler" instruction. The instruction set forms a minimal Türing machine.
   --

insert
   ANY
      redefine
         is_equal
      end

feature {ANY}
   is_equal (other: like Current): BOOLEAN is
      local
         eq: SAFE_EQUAL[LIBERTY_ASM_INSTRUCTION]
      do
         Result := eq.test(next, other.next)
      end

   next: LIBERTY_ASM_INSTRUCTION
         -- the next instruction

   position: INTEGER
         -- the position of the instruction in the method

   accept (visitor: LIBERTY_ASM_VISITOR) is
      deferred
      end

   set_position (a_position: like position) is
      do
         position := a_position
      ensure
         position = a_position
      end

   set_next (a_next: like next) is
      do
         next := a_next
      ensure
         next = a_next
      end

end -- class LIBERTY_ASM_INSTRUCTION
