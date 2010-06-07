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
class LIBERTY_INTERPRETER_DEBUGGER_VISITOR_IMPL

inherit
	LIBERTY_INTERPRETER_DEBUGGER_VISITOR

create {LIBERTY_INTERPRETER_DEBUGGER}
	make

feature {LIBERTY_INTERPRETER_DEBUGGER}
	should_continue: BOOLEAN

feature {LIBERTY_INTERPRETER_DEBUGGER_FACTORY}
	visit_entry (a_entry: LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE) is
		do
			should_continue := False
			check
				a_entry.lower = 0
				a_entry.name_at(a_entry.upper).is_equal(once "KW end of line")
				a_entry.count.in_range(2, 3)
			end
			inspect
				a_entry.name_at(0)
			when "KW show" then
				check
					a_entry.name_at(1).is_equal(once "Show")
				end
				a_entry.node_at(1).accept(Current)
			when "KW continue" then
				should_continue := True
			when "KW step" then
				check
					a_entry.name_at(1).is_equal(once "Step")
				end
				a_entry.node_at(1).accept(Current)
				should_continue := True
			when "KW quit" then
				die_with_code(0)
			end
		end

	visit_show (a_show: LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE) is
		do
			check
				a_show.lower = 0
				a_show.name_at(0).is_equal(once "KW stack")
			end
			interpreter.show_stack(std_output)
		end

	visit_step (a_step: LIBERTY_INTERPRETER_DEBUGGER_NON_TERMINAL_NODE) is
		local
			step_count_node: EIFFEL_TERMINAL_NODE_IMPL
			step_count: TYPED_EIFFEL_IMAGE[INTEGER]
		do
			if a_step.is_empty then
				interpreter.debug_step(1)
			else
				check
					a_step.lower = 0
				end
				inspect
					a_step.name_at(0)
				when "KW in" then
					interpreter.debug_step_in
				when "KW out" then
					interpreter.debug_step_out
				when "KW number" then
					step_count_node ::= a_step.node_at(0)
					step_count ::= step_count_node.image
					if step_count.decoded <= 0 then
						std_error.put_line(once "Cannot step zero or less times :-)")
					else
						interpreter.debug_step(step_count.decoded)
					end
				end
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

end -- class LIBERTY_INTERPRETER_DEBUGGER_VISITOR_IMPL
