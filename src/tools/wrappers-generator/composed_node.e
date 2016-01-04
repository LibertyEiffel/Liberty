deferred class COMPOSED_NODE
   -- A GCCXML node having "members" attribute. Th attribute contains the
   -- ids of the fields that compose the actual object referred by Current
   -- node, for example a structure, a union, (a C++ class?).
   -- Note: also Namespace nodes have a "members" attribute that
   -- conceptually different since they are modelled as Liberty clusters and
   -- do not belong to a single file.
   -- Note: previously COMPOSED_NODE inherited from NAMED_NODE. The heirs of
   -- th class C_STRUCT_NODE_NODE, C_UNION and C_PLUS_PLUS_CLASS will be made direct
   -- heir of NAMED_NODE.

inherit
   STORABLE_NODE
      -- inherited to add the non-void fields postcondition to the store command
   NAMED_NODE
      -- all heirs (Class, Struct, Namespace, Union) are also named

feature {ANY}
   store
      deferred
      ensure
         fields /= Void
      end

   c_type: STRING
         -- The actual type - i.e struct, union - to be put into low level getter and setters code
      deferred
      end

   fields: COLLECTION[C_FIELD]

   members: UNICODE_STRING
      do
         Result := attribute_at(once U"members")
      end

end -- class COMPOSED_NODE
-- Copyright (C) 2008-2016: ,2009,2010 Paolo Redaelli
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
