class C_ARRAY_TYPE
   -- An "ArrayType" node of a castxml file.
   -- Those nodes have min and max attributes. Most of
   -- the times min is not empty while often max
   -- empty.
   -- Currently mapped to POINTER.

inherit
   C_TYPE
   IDENTIFIED_NODE
   TYPED_NODE
   STORABLE_NODE

create {CASTXML_TREE}
   make

feature {ANY}
   store
      do
         types.put(Current, id)
      end

   wrapper_type: STRING "POINTER"

   is_fundamental: BOOLEAN False

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN True

end -- class C_ARRAY_TYPE

-- Copyright (C) 2008-2025: Paolo Redaelli
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
