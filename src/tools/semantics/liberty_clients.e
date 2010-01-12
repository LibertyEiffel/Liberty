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
class LIBERTY_CLIENTS

inherit
	LIBERTY_AST_CLIENT_VISITOR
	TRAVERSABLE[LIBERTY_TYPE]

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	lower: INTEGER is
		do
			Result := clients.lower
		end

	upper: INTEGER is
		do
			Result := clients.upper
		end

	count: INTEGER is
		do
			Result := clients.count
		end

	is_empty: BOOLEAN is
		do
			Result := clients.is_empty
		end

	item (i: INTEGER): LIBERTY_TYPE is
		do
			Result := clients.item(i)
		end

	first: like item is
		do
			Result := clients.first
		end

	last: like item is
		do
			Result := clients.last
		end

	new_iterator: ITERATOR[LIBERTY_TYPE] is
		do
			Result := clients.new_iterator
		end

feature {LIBERTY_AST_CLIENT}
	visit_liberty_ast_client (v: LIBERTY_AST_CLIENT) is
		do
			clients.add_last(universe.get_type_from_client(origin.cluster, v))
		end

feature {}
	make (a_origin: like origin; a_clients: TRAVERSABLE[LIBERTY_AST_CLASS_NAME]; a_universe: like universe) is
		require
			a_clients /= Void
			a_universe /= Void
		local
			i: INTEGER
		do
			universe := a_universe
			create {FAST_ARRAY[LIBERTY_TYPE]} clients.with_capacity(clients.count)
			from
				i := a_clients.lower
			until
				i > a_clients.upper
			loop
				a_clients.item(i).accept(Current)
				i := i + 1
			end
		ensure
			clients.count = a_clients.count
		end

	origin: LIBERTY_TYPE
	clients: COLLECTION[LIBERTY_TYPE]
	universe: LIBERTY_UNIVERSE

end
