class C_UNION

inherit 
	CONTEXTED_NODE
	COMPOSED_NODE
	IDENTIFIED_NODE
	FILED_NODE
	STORABLE_NODE
	WRAPPER_CLASS
	TYPED_NODE

creation make

feature 
	store is
		do
			create {LINKED_LIST[C_FIELD]} fields.make
			unions.fast_put(Current,id)
			types.fast_put(Current,id)
			if is_named then
				symbols.put(Current,c_string_name)
			end
			composed_types.fast_put(Current,id)
		end
	
	is_fundamental: BOOLEAN is False

	is_void: BOOLEAN is False

	has_wrapper: BOOLEAN is False

	c_type: STRING is "union" 

	wrapper_type: STRING is
		do
			not_yet_implemented
		end
	
	is_to_be_emitted: BOOLEAN is
		do
			not_yet_implemented
		end

	emit_wrapper is 
		do
			not_yet_implemented
		end
		
	suffix: STRING is "_UNION"

-- invariant name.is_equal(once U"Union")
end -- class C_UNION

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
