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
class LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_64_BUILTINS

inherit
	LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGERS_BUILTINS[INTEGER_64]

creation {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	make

feature {}
	new_integer (value: INTEGER_64): LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64] is
		do
			Result := interpreter.new_integer_64(value, builtin_call.position)
		end

	left, target: INTEGER_64 is
		local
			obj: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			obj ::= builtin_call.target
			Result := obj.item
		end

	right: INTEGER_64 is
		local
			obj: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			-- the code may not seem straightforward but it manages correct semi-evaluation
			builtin_call.evaluate_parameters
			obj ::= builtin_call.parameters.first
			Result := obj.item
		end

end -- class LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_64_BUILTINS
