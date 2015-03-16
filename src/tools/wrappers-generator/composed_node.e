deferred class COMPOSED_NODE
   -- A GCCXML node having "members" attribute. Th attribute contains the
   -- ids of the fields that compose the actual object referred by Current
   -- node, for example a structure, a union, a C++ class.
   -- Note that Namespace nodes also have a "members" attribute that
   -- conceptually different since they are modelled as Liberty clusters and
   -- do not belong to a single file.

inherit
   STORABLE_NODE
      -- inherited to add the non-void fields postcondition to the store command
   NAMED_NODE
      -- as all effective heirs (Class, Struct, Namespace, Union) are also named

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
-- Copyright 2008,2009,2010 Paolo Redaelli
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
