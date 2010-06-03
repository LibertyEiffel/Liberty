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
class LIBERTY_INTERPRETER_DEBUGGER

create {LIBERTY_INTERPRETER}
	make

feature {LIBERTY_INTERPRETER}
	break (entry: STRING): BOOLEAN is
		require
			entry /= Void
		do
			inspect
				entry
			when "S" then
				interpreter.show_stack(std_output)
			when "c" then
				Result := True
			when "Q" then
				die_with_code(0)
			else
				std_error.put_line(once "Unknown command.")
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

invariant
	interpreter /= Void

end -- class LIBERTY_INTERPRETER_DEBUGGER
