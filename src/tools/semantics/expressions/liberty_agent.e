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
class LIBERTY_AGENT

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	result_type: LIBERTY_TYPE

feature {LIBERTY_REACHABLE_MARKER, LIBERTY_REACHABLE_MARKER_AGENT}
	mark_reachable_code (mark: INTEGER)is
		do
			call.mark_reachable_code(mark)
		end

feature {}
	call: LIBERTY_CALL_EXPRESSION
			-- Even if the called feature is a procedure, we use an expression. At building time we do not know
			-- if the agent calls a procedure or a function.
			-- Only, when set, will the `result_type' give us that information.

	make (a_call: like call; a_position: like position) is
		require
			a_call /= Void
			a_position /= Void
		do
			a_call.set_agent_call
			call := a_call
			position := a_position
			create {LIBERTY_DELAYED_TYPE} result_type.make(create {LIBERTY_DELAYED_AGENT_CALL}.make(call))
		ensure
			call = a_call
			call.is_agent_call
			position = a_position
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_AGENT_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_agent(Current)
		end

end -- class LIBETY_AGENT
