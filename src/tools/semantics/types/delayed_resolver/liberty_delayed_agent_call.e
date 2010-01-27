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

creation {LIBERTY_AGENT}
	make

feature {ANY}
	out_in_tagged_out_memory is
		do
			if can_resolve then
				resolved.out_in_tagged_out_memory
			else
				tagged_out_memory.append(once "like ")
				call.out_in_tagged_out_memory
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

feature {}
	make (a_call: like call) is
		require
			a_call /= Void
		do
			call := a_call
			full_name_memory := (once "like " + a_call.out).intern
		ensure
			call = a_call
		end

	call: LIBERTY_CALL_EXPRESSION
	full_name_memory: FIXED_STRING

invariant
	call /= Void

end -- class LIBERTY_DELAYED_AGENT_CALL
