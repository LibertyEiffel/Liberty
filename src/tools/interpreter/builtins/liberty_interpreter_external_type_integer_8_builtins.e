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
class LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_8_BUILTINS

inherit
	LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGERS_BUILTINS[INTEGER_8]

creation {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	make

feature {}
	new_integer (value: INTEGER_8): LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_8] is
		do
			Result := interpreter.new_integer_8(value, builtin_call.position)
		end

end -- class LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_8_BUILTINS
