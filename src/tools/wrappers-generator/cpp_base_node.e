class CPP_BASE_NODE
   -- An "Base" node in the output of castxml.

inherit
   TYPED_NODE

create {CASTXML_TREE}
   make

feature {ANY}
   is_fundamental: BOOLEAN False
         -- A Base node represents the heirs of a C++ class. Therefore even if
         -- it is actually is a typed node, they hardly could ever refer to a
         -- fundamental type, since fundamental types are not classes in C++

   is_void: BOOLEAN False

   has_wrapper: BOOLEAN False
         -- The base class of another C++ class should of course have a wrapper.
         -- It's reference as the parent of another class not thought.

   wrapper_type: STRING
      do
         raise("Asked for wrapper type of a %"Base%" node. This should have never happened because wrapper_type has the precondition of has_wrapper.")
      end

end -- class CPP_BASE_NODE

-- Copyright (C) 2014-2025: Paolo Redaelli
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
