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
	LIBERTY_DUMB_EXPRESSION_VISITOR
		redefine visit_liberty_open_argument
		end

create {LIBERTY_BUILDER_TOOLS}
	make

create {LIBERTY_AGENT}
	specialized

feature {ANY}
	result_type: LIBERTY_TYPE
			-- The agent type

	call: LIBERTY_CALL_EXPRESSION
			-- Even if the called feature is a procedure, we use an expression. At building time we do not know
			-- if the agent calls a procedure or a function.
			-- Only, when set, will the `result_type' give us that information.

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
		local
			r: like result_type
			c: like call
		do
			r := result_type.specialized_in(a_type)
			c := call.specialized_in(a_type)
			if r = result_type and then c = call then
				Result := Current
			else
				create Result.specialized(c, r, position)
			end
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			call.mark_reachable_code(mark)
		end

feature {}
	make (a_call: like call; a_position: like position) is
		require
			a_call /= Void
			a_position /= Void
		do
			a_call.set_agent_call
			call := a_call
			position := a_position
			create {LIBERTY_DELAYED_TYPE} result_type.make(create {LIBERTY_DELAYED_AGENT_CALL}.make(call))
			fix_open_arguments
		ensure
			call = a_call
			call.is_agent_call
			position = a_position
		end

	specialized (a_call: like call; a_result_type: like result_type; a_position: like position) is
		require
			a_call.is_agent_call
			a_result_type /= Void
			a_position /= Void
		do
			call := a_call
			result_type := a_result_type
			position := a_position
			fix_open_arguments
		ensure
			call = a_call
			result_type = a_result_type
			position = a_position
		end

feature {}
	fix_open_arguments is
		do
			if call.target /= Void then
				open_argument_index := target_index
				check
					not call.actuals.valid_index(open_argument_index)
				end
				call.target.accept(Current)
			end
			from
				open_argument_index := call.actuals.lower
			until
				open_argument_index > call.actuals.upper
			loop
				call.actuals.item(open_argument_index).accept(Current)
				open_argument_index := open_argument_index + 1
			end
		end

feature {LIBERTY_OPEN_ARGUMENT}
	visit_liberty_open_argument (v: LIBERTY_OPEN_ARGUMENT) is
		local
			openarg: LIBERTY_OPEN_ARGUMENT
		do
			if v.result_type = Void then
				openarg := v
			else
				openarg := v.twin -- never share open arguments
			end
			openarg.set_result_type(create {LIBERTY_DELAYED_TYPE}.make(create {LIBERTY_DELAYED_OPEN_ARGUMENT}.make(Current, open_argument_index)))
			if open_argument_index = target_index then
				check
					v = call.target
				end
				call.set_open_target(openarg)
			else
				check
					v = call.actuals.item(open_argument_index)
				end
				call.set_actual(openarg, open_argument_index)
			end
		end

	target_index: INTEGER is -1

	open_argument_index: INTEGER
			-- Used when visitting the open arguments for type fixing (see `fix_open_arguments')

feature {LIBERTY_DELAYED_OPEN_ARGUMENT}
	can_compute_open_argument_type (delayed: LIBERTY_DELAYED_OPEN_ARGUMENT; index: like open_argument_index): BOOLEAN is
		do
			if index = target_index then
				Result := call.target.result_type.is_known
			else
				Result := call.actuals.valid_index(index)
					and then call.actuals.item(index).result_type.is_known
			end
		end

	open_argument_type (delayed: LIBERTY_DELAYED_OPEN_ARGUMENT; index: like open_argument_index): LIBERTY_KNOWN_TYPE is
		do
			if index = target_index then
				Result := call.target.result_type.known_type
			else
				Result := call.actuals.item(index).result_type.known_type
			end
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_AGENT_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_agent(Current)
		end

end -- class LIBERTY_AGENT
