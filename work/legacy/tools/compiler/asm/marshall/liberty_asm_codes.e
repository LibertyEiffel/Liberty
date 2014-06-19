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
class LIBERTY_ASM_CODES

feature {} -- assembly code
   system_marker: INTEGER 0x0118E579 -- l33t for "LIBERTY", I guess
   type_marker:   INTEGER 0x0975E811 -- reversed.
   method_marker: INTEGER 0x086D0D68 -- xor'ed.

   flag_retry:         INTEGER_8 0x01
   flag_precondition:  INTEGER_8 0x10
   flag_postcondition: INTEGER_8 0x11

   native_void:        INTEGER_8 0x00
   native_integer:     INTEGER_8 0x01
   native_pointer:     INTEGER_8 0x02

   asm_new:            INTEGER_8 0x01
   asm_jump:           INTEGER_8 0x02
   asm_invoke:         INTEGER_8 0x03
   asm_return:         INTEGER_8 0x04
   asm_call_native:    INTEGER_8 0x05

   asm_not:            INTEGER_8 0x10
   asm_and:            INTEGER_8 0x11
   asm_or:             INTEGER_8 0x12

   asm_load_int:       INTEGER_8 0x20
   asm_add_int:        INTEGER_8 0x21
   asm_sub_int:        INTEGER_8 0x22
   asm_mul_int:        INTEGER_8 0x23
   asm_div_int:        INTEGER_8 0x24
   asm_rem_int:        INTEGER_8 0x25

feature {} -- utilities
   positions: LIBERTY_ASM_POSITIONS
      once
         create {LIBERTY_ASM_POSITIONS} Result.make
      end

end -- class LIBERTY_ASM_CODES
