deferred class WRAPPABLE_NODE
	-- A node of an XML file produced by gccxml that is wrappable for Liberty
	-- as part of a wider class. 
inherit GCCXML_NODE
feature 
	wrap_on (a_stream: OUTPUT_STREAM) is
		-- Put the wrapper on `a_stream'
	require 
		a_stream /= Void
		-- buffer.is_empty
	deferred 
	ensure buffer.is_empty
	end

end -- class WRAPPABLE_NODE
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
