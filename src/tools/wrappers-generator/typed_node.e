deferred class TYPED_NODE
	-- A Gccxml node with "type" attribute
inherit GCCXML_NODE
insert SHARED_COLLECTIONS
feature 

	type: UNICODE_STRING is 
		do 
			Result:=attribute_at(once U"type") 
		ensure Result/=Void
		end

	referree: TYPED_NODE is
		-- The node referred by `type' in `types' dictionary.
	do
		Result:=types.at(type)
	end

	is_fundamental: BOOLEAN is
		-- Does current node refers to a fundamental C type?
		deferred 
		end

	is_void: BOOLEAN is
		-- Is Current node of type void?
		deferred
		end

	has_wrapper: BOOLEAN is
		-- Does Current actually have a wrapper type in Liberty?
		deferred
		end

	wrapper_type: STRING is
		-- The name of the class of Liberty that wraps Current fundamental type.
	require
		not is_void
		has_wrapper
	deferred
	end

	assigned_name: STRING
		-- The name under which Current will be forcefully wrapped to.

	set_name (a_name: STRING) is
		-- Set `assigned_name' to `a_name'.
	require a_name/=Void
	do
		assigned_name:=a_name
	ensure definition: assigned_name=a_name
	end
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
