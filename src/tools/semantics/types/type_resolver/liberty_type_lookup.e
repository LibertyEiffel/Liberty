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

insert
	LOGGING

feature {ANY}
	push (r: like resolver) is
		require
			r /= Void
		do
			r.set_parent(resolver)
			resolver_memory.set_item(r)
			debug
				log.trace.put_string(once " >>> Type Lookup: pushed ")
				log.trace.put_line(r.out)
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
				log.trace.put_string(once " <<< Type Lookup: popped ")
				log.trace.put_string(r.out)
				if resolver /= Void then
					log.trace.put_string(once ", back to ")
					log.trace.put_line(resolver.out)
				else
					log.trace.put_new_line
				end
			end
		end

	resolver: LIBERTY_TYPE_RESOLVER is
		do
			Result := resolver_memory.item
		end

	universe: LIBERTY_UNIVERSE is
		do
			Result := universe_memory.item
		end

feature {LIBERTY_UNIVERSE}
	set_universe (a_universe: LIBERTY_UNIVERSE) is
		require
			a_universe /= Void
			universe = Void
		do
			universe_memory.set_item(a_universe)
		ensure
			universe = a_universe
		end

feature {}
	resolver_memory: REFERENCE[LIBERTY_TYPE_RESOLVER] is
		once
			create Result
		end

	universe_memory: REFERENCE[LIBERTY_UNIVERSE] is
		once
			create Result
		end

end -- class LIBERTY_TYPE_LOOKUP
