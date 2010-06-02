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
class LIBERTY_INTERPRETER_EXTERNAL_TYPE_CHARACTER_BUILTINS

insert
	LIBERTY_INTERPRETER_EXTERNAL_BUILTINS_CALLER

creation {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	make

feature {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	call (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): LIBERTY_INTERPRETER_OBJECT is
		local
			target: LIBERTY_INTERPRETER_OBJECT_NATIVE[CHARACTER]
		do
			last_call_failed := False
			target ::= builtin_call.target
			inspect
				builtin_call.name
			when "code" then
				Result := interpreter.new_integer_16(target.item.code, builtin_call.position)
			when "to_integer_8" then
				Result := interpreter.new_integer_8(target.item.to_integer_8, builtin_call.position)
			else
				last_call_failed := True
			end
		end

end -- class LIBERTY_INTERPRETER_EXTERNAL_TYPE_CHARACTER_BUILTINS
