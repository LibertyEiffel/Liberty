class C_RVALUE_REFERENCE_TYPE
   -- A castxml RValueReferenceType node.

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
         types.fast_put(Current, id)
      end

   is_fundamental: BOOLEAN False
         -- Note: Accounting a C++ reference as fundamental type is a rough approximation.

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN False

   wrapper_type: STRING "POINTER"
         -- Note: this is a rought approximation.
         -- invariant name.is_equal(once U"ReferenceType")

end -- class C_RVALUE_REFERENCE_TYPE

-- Copyright (C) 2025: Paolo Redaelli
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
