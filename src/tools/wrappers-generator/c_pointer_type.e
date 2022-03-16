class C_POINTER_TYPE
   -- A GccXml node representing a pointer type.

inherit
   C_TYPE
   IDENTIFIED_NODE
   STORABLE_NODE
   TYPED_NODE

create {GCCXML_TREE}
   make

feature {ANY}
   is_fundamental: BOOLEAN True

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN True

   wrapper_type: STRING "POINTER"

   store
      do
         types.put(Current, id)
      end -- invariant name.is_equal(once U"PointerType")

end -- class C_POINTER_TYPE
-- Copyright (C) 2008-2022: ,2009,2010 Paolo Redaelli
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
