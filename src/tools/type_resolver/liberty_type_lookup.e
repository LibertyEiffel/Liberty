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
expanded class LIBERTY_TYPE_LOOKUP
--
-- Access and manipulation of LIBERTY_TYPE_RESOLVER contexts.
--
-- It avoids having method signatures longer than humanly legible.
--

feature {ANY}
	push (r: like resolver) is
		require
			r /= Void
		do
			r.set_parent(resolver)
			resolver_memory.set_item(r)
			debug
				std_output.put_line(" >>> Type Lookup: pushed " + r.out)
			end
		ensure
			resolver = r
		end

	pop is
		require
			resolver /= Void
		local
			r: like resolver
		do
			debug
				r := resolver
			end
			resolver_memory.set_item(resolver.parent)
			debug
				if resolver /= Void then
					std_output.put_line(" <<< Type Lookup: popped " + r.out + ", back to " + resolver.out)
				else
					std_output.put_line(" <<< Type Lookup: popped " + r.out)
				end
			end
		end

	resolver: LIBERTY_TYPE_RESOLVER is
		do
			Result := resolver_memory.item
		end

feature {}
	resolver_memory: REFERENCE[LIBERTY_TYPE_RESOLVER] is
		once
			create Result
		end

end -- class LIBERTY_TYPE_LOOKUP
