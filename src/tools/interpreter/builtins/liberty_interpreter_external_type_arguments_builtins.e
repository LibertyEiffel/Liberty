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
class LIBERTY_INTERPRETER_EXTERNAL_TYPE_ARGUMENTS_BUILTINS

insert
	LIBERTY_INTERPRETER_EXTERNAL_BUILTINS_CALLER
	ARGUMENTS

creation {LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL}
	make

feature {LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL}
	call (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): LIBERTY_INTERPRETER_OBJECT is
		local
			index: INTEGER; argv: LIBERTY_INTERPRETER_OBJECT
		do
			last_call_failed := False
			builtin_call.evaluate_parameters
			inspect
				builtin_call.name
			when "se_argc" then
				Result := interpreter.new_integer(se_argc)
			when "se_argv" then
				index := integer(builtin_call)
				argv := interpreter.new_string(se_argv(index + arguments_offset), builtin_call.position)
			else
				last_call_failed := True
			end
		end

feature {}
	integer (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): INTEGER is
		local
			obj: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			builtin_call.evaluate_parameters
			obj ::= builtin_call.parameters.first
			Result := obj.item.to_integer_32
		end

	arguments_offset: INTEGER is
		once
			from
				Result := 1
			until
				Result > argument_count or else se_argv(Result).is_equal(once "--")
			loop
				Result := Result + 1
			end
		end

end -- class LIBERTY_INTERPRETER_EXTERNAL_TYPE_ARGUMENTS_BUILTINS
