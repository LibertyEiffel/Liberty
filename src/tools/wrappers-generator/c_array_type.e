class C_ARRAY_TYPE
	-- An "ArrayType" node of a gccxml file.

	-- Those nodes have min and max attributes. Most of
	-- the times min is not empty while often max is
	-- empty.

	-- Currently mapped to POINTER.
inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	TYPED_NODE
	STORABLE_NODE

creation make 
feature
	store is
		do
			types.put(Current,id)
		end
	
	wrapper_type: STRING is "POINTER"

	is_fundamental: BOOLEAN is False
	is_void: BOOLEAN is False
	has_wrapper: BOOLEAN is True
end

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
