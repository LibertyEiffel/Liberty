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
class LIBERTY_INTERPRETER_OBJECT_BOOLEAN

inherit
   LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]

create {LIBERTY_INTERPRETER_OBJECT_CREATOR, LIBERTY_INTERPRETER_OBJECT_NATIVE, LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_FACTORY, LIBERTY_INTERPRETER}
   make, with_item

feature {ANY}
   hash_code: INTEGER
      do
         if item then
            Result := 97
         end
      end

   converted_to (target_type: LIBERTY_ACTUAL_TYPE): LIBERTY_INTERPRETER_OBJECT
      do
         not_yet_implemented
      end

feature {}
   expanded_twin: like Current
      do
         create Result.with_item(interpreter, type, item, position)
      end

end -- class LIBERTY_INTERPRETER_OBJECT_BOOLEAN
