deferred class CONTEXTED_NODE
   -- A castxml node with "context" attribute

inherit
   CASTXML_NODE

insert
   SHARED_COLLECTIONS

feature {ANY}
   context: UNICODE_STRING
      do
         Result := attribute_at(once U"context")
      ensure
         Result /= Void
      end

   namespace: C_NAMESPACE
      local
         symbol: NAMED_NODE
      do
         -- unused contexted: CONTEXTED_NODE
         if not namespace_retrieved then
            sedb_breakpoint
            -- Some elements have a context which is their actual
            -- namespace; other like fields referes to their container;
            -- also in C++ things like a typedef may be containted into a
            -- struct. Therefore the actual namespace is contained in
            -- context of Current or in the node referred by context.

            cached_namespace := namespaces.reference_at(context)
            if cached_namespace = Void then
               -- Recursively look for the namespace
               from
                  print("Looking for context " + context.as_utf8 + " namespace: ")
                  symbol := symbols.reference_at(context.as_utf8)
               until
                  cached_namespace /= Void
               loop
                  print(" symbol " + symbol.out)
                  check
                     symbol /= Void
                  end
                  print(" symbol: " + symbol.out)
                  cached_namespace ?= symbol
                  symbol := symbols.reference_at(symbol.attribute_at(once U"context").as_utf8)
               end
            end

            check
               cached_namespace /= Void
            end
            namespace_retrieved := True
         end

         Result := cached_namespace
      ensure
         Result /= Void
      end

feature {} -- Implementation
   cached_namespace: C_NAMESPACE

   namespace_retrieved: BOOLEAN

end -- class CONTEXTED_NODE

-- Copyright (C) 2008-2025: Paolo Redaelli
--
-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
