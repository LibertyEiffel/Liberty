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
class LIBERTY_INTERPRETER_DEBUGGER_STEPS

create {LIBERTY_INTERPRETER}
	after, at_call_entry, at_call_exit

feature {ANY}
	is_active: BOOLEAN is
		do
			Result := count /= 0
		end

feature {LIBERTY_INTERPRETER}
	step is
		require
			is_active
		do
			if count > 0 then
				count := count - 1
				if count = 0 then
					interpreter.break
				end
			end
		end

feature {LIBERTY_INTERPRETER_FEATURE_CALL}
	enter_call is
		require
			is_active
		do
			if count = entry_count then
				interpreter.break
			end
		end

	exit_call is
		require
			is_active
		do
			if count = exit_count then
				interpreter.break
			end
		end

feature {}
	after (a_interpreter: like interpreter; a_count: like count) is
		require
			a_interpreter /= Void
			a_count > 0
		do
			interpreter := a_interpreter
			count := a_count
		ensure
			is_active
			interpreter = a_interpreter
			count = a_count
		end

	at_call_entry (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
			count := entry_count
		ensure
			is_active
			interpreter = a_interpreter
			count = entry_count
		end

	at_call_exit (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
			count := exit_count
		ensure
			is_active
			interpreter = a_interpreter
			count = exit_count
		end

	interpreter: LIBERTY_INTERPRETER
	count: INTEGER

	entry_count: INTEGER is -13
	exit_count: INTEGER is -31

invariant
	interpreter /= Void
	count >= 0 or else count = entry_count or else count = exit_count

end -- class LIBERTY_INTERPRETER_DEBUGGER_STEPS
