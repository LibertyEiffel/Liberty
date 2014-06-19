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
class LIBERTY_ASM_SYSTEM

insert
   ANY
      redefine
         is_equal
      end

create {ANY}
   make

feature {ANY}
   types: COLLECTION[LIBERTY_ASM_TYPE]
   main: LIBERTY_ASM_METHOD

   is_equal (other: like Current): BOOLEAN
      do
         Result := types.count = other.types.count
            and then types.for_all(agent other.types.has)
            and then main.is_equal(other.main)
      end

feature {}
   make (a_types: like types; a_main: like main)
      require
         a_types /= Void
         a_main /= Void
         a_types.fast_has(a_main.type)
      do
         types := a_types
         main := a_main
      ensure
         types = a_types
         main = a_main
      end

invariant
   types /= Void
   main /= Void
   types.fast_has(main.type)

end -- class LIBERTY_ASM_SYSTEM
