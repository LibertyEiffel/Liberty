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
class LIBERTY_DELAYED_OPEN_ARGUMENT

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
				tagged_out_memory.extend('?')
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
			Result := of_agent.can_compute_open_argument_type(Current, index)
		end

	resolved: LIBERTY_KNOWN_TYPE is
		do
			Result := of_agent.open_argument_type(Current, index)
		end

	full_name: FIXED_STRING is
		do
			Result := full_name_memory
		end

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
		do
			Result := Current
		end

feature {}
	make (a_agent: like of_agent; a_index: like index) is
		require
			a_agent /= Void
		do
			of_agent := a_agent
			index := a_index

			lock_tagged_out
			tagged_out_memory.copy(once "open argument #")
			a_index.append_in(tagged_out_memory)
			tagged_out_memory.append(once " of ")
			a_agent.out_in_tagged_out_memory
			full_name_memory := tagged_out_memory.intern
			unlock_tagged_out
		ensure
			of_agent = a_agent
			index = a_index
		end

	of_agent: LIBERTY_AGENT
	index: INTEGER

	full_name_memory: FIXED_STRING

invariant
	of_agent /= Void

end -- class LIBERTY_DELAYED_OPEN_ARGUMENT
