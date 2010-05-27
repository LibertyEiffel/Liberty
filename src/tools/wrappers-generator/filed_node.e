deferred class FILED_NODE
	-- A Gccxml node with "file" attribute
inherit GCCXML_NODE
insert SHARED_COLLECTIONS
feature 

	file_id: UNICODE_STRING is 
		do 
			Result:=attribute_at(once U"file") 
		ensure Result/=Void
		end
	
	line_row: UNICODE_STRING is
		-- The line in the source code where Current is defined
		do
			Result:=attribute_at(once U"line")
		ensure Result/=Void
		end

	c_file: C_FILE is
		do
			Result:=files.reference_at(file_id)
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
