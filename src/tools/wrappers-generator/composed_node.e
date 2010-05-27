deferred class COMPOSED_NODE
	-- A GCCXML node having "members" attribute. This attribute contains the
	-- ids of the fields that compose the actual object referred by Current
	-- node, for example a structure, a union, (a C++ class?). 
inherit 
	NAMED_NODE
	STORABLE_NODE
feature 
	store is
		deferred 
		ensure fields/=Void
		end

	fields: COLLECTION[C_FIELD]

	members: UNICODE_STRING is
		do
			Result:=attribute_at(once U"members")
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
