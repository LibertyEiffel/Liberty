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
class LIBERTY_ASM_NATIVE_VALUE
   --
   -- A native value (either argument or result type)
   --

insert
   ANY
      redefine
         is_equal
      end

create {ANY}
   integer, pointer

feature {ANY}
   is_equal (other: like Current): BOOLEAN
      do
         Result := kind = other.kind
      end

   is_integer: BOOLEAN
      do
         Result := kind = kind_integer
      end

   is_pointer: BOOLEAN
      do
         Result := kind = kind_pointer
      end

feature {LIBERTY_ASM_NATIVE_VALUE}
   kind: INTEGER_8

feature {}
   integer
      do
         kind := kind_integer
      end

   pointer
      do
         kind := kind_pointer
      end

   kind_integer: INTEGER_8 1
   kind_pointer: INTEGER_8 2

end -- class LIBERTY_ASM_NATIVE_VALUE
