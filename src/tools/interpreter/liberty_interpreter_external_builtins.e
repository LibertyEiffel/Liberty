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
class LIBERTY_INTERPRETER_EXTERNAL_BUILTINS

create {LIBERTY_INTERPRETER}
	make

feature {LIBERTY_INTERPRETER_FEATURE_CALL}
	call (a_builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL) is
		require
			a_builtin_call /= Void
		local
			builtin: LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL
		do
			create builtin.make(interpreter, a_builtin_call)
			builtin.call
			if builtin.last_call_failed then
				interpreter.fatal_error("Unknown built-in feature " + a_builtin_call.name + " in class " + a_builtin_call.target.type.full_name, a_builtin_call.position)
			end
		end

feature {}
	make (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
		ensure
			interpreter = a_interpreter
		end

	interpreter: LIBERTY_INTERPRETER

end -- class LIBERTY_INTERPRETER_EXTERNAL_BUILTINS
