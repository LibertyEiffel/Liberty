class C_CONSTRUCTOR
   -- A "Constructor" node in an XML file made by gccxml.

inherit
   GCCXML_NODE
   NAMED_NODE
   TYPED_NODE
   FILED_NODE

create {GCCXML_TREE}
   make

feature {ANY}
   is_fundamental: BOOLEAN False

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN False

   wrapper_type: STRING
      do
         not_yet_implemented
      end -- invariant name.is_equal(once U"Constructor")

end -- class C_CONSTRUCTOR
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
