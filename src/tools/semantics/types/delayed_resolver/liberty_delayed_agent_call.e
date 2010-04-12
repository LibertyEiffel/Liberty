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
class LIBERTY_DELAYED_AGENT_CALL

inherit
	LIBERTY_DELAYED_RESOLVER

creation {LIBERTY_AGENT, LIBERTY_DELAYED_AGENT_CALL}
	make

feature {ANY}
	out_in_tagged_out_memory is
		do
			if can_resolve then
				resolved.out_in_tagged_out_memory
			else
				tagged_out_memory.append(once "agent like (")
				call.out_in_tagged_out_memory
				tagged_out_memory.extend(')')
			end
		end

	hash_code: INTEGER is
		do
			Result := full_name_memory.hash_code
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := other = Current
		end

feature {LIBERTY_DELAYED_TYPE}
	can_resolve: BOOLEAN is
		do
			Result := call.can_compute_agent_type
		end

	resolved: LIBERTY_ACTUAL_TYPE is
		do
			Result := call.agent_type
		end

	full_name: FIXED_STRING is
		do
			Result := full_name_memory
		end

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE_IMPL): like Current is
		local
			c: like call
		do
			--|*** TODO: check coherence (shouldn't `call' handle the
			--|specialization instead?)

			c := call.specialized_in(a_type)
			if c = call then
				Result := Current
			else
				create Result.make(c)
			end
		end

feature {}
	make (a_call: like call) is
		require
			a_call /= Void
		do
			call := a_call

			lock_tagged_out
			tagged_out_memory.copy(once "agent like (")
			a_call.out_in_tagged_out_memory
			tagged_out_memory.extend(')')
			full_name_memory := tagged_out_memory.intern
			unlock_tagged_out
		ensure
			call = a_call
		end

	call: LIBERTY_CALL_EXPRESSION
	full_name_memory: FIXED_STRING

invariant
	call /= Void

end -- class LIBERTY_DELAYED_AGENT_CALL
