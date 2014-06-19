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
   TRAVERSABLE[LIBERTY_ACTUAL_TYPE]

create {LIBERTY_BUILDER_TOOLS}
   make

feature {ANY}
   lower: INTEGER
      do
         Result := clients.lower
      end

   upper: INTEGER
      do
         Result := clients.upper
      end

   count: INTEGER
      do
         Result := clients.count
      end

   is_empty: BOOLEAN
      do
         Result := clients.is_empty
      end

   item (i: INTEGER): LIBERTY_ACTUAL_TYPE
      do
         Result := clients.item(i)
      end

   first: like item
      do
         Result := clients.first
      end

   last: like item
      do
         Result := clients.last
      end

   new_iterator: ITERATOR[LIBERTY_ACTUAL_TYPE]
      do
         Result := clients.new_iterator
      end

feature {LIBERTY_AST_CLIENT}
   visit_liberty_ast_client (v: LIBERTY_AST_CLIENT)
      do
         clients.add_last(type_lookup.resolver.get_export_type(v.type_definition)
      end

feature {}
   make (a_origin: like origin; a_clients: TRAVERSABLE[LIBERTY_AST_CLASS_NAME]; a_universe: like universe)
      require
         a_clients /= Void
         a_universe /= Void
      local
         i: INTEGER
      do
         universe := a_universe
         create {FAST_ARRAY[LIBERTY_ACTUAL_TYPE]} clients.with_capacity(clients.count)
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

   origin: LIBERTY_ACTUAL_TYPE
   clients: COLLECTION[LIBERTY_ACTUAL_TYPE]
   universe: LIBERTY_UNIVERSE

end
