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
deferred class LIBERTY_INTERPRETER_DEBUGGER_VISITOR

inherit
	VISITOR

feature {LIBERTY_INTERPRETER_DEBUGGER_FACTORY}
	visit_entry (a_entry: LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE) is
		require
			a_entry /= Void
		deferred
		end

	visit_show (a_show: LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE) is
		require
			a_show /= Void
		deferred
		end

	visit_step (a_step: LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE) is
		require
			a_step /= Void
		deferred
		end

end -- class LIBERTY_INTERPRETER_DEBUGGER_VISITOR
