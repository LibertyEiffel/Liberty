class C_POINTER_TYPE
	-- A GccXml node representing a pointer type.
	
inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	STORABLE_NODE
	TYPED_NODE

creation make
feature 
	is_fundamental: BOOLEAN is True

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is True

	wrapper_type: STRING is "POINTER"

	store is
		do
			types.put(Current,id)
		end

-- invariant name.is_equal(once U"PointerType")
end -- class C_POINTER_TYPE

-- Copyright 2008,2009,2010 Paolo Redaelli

-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
