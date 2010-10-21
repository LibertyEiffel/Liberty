deferred class WRAPPER_CLASS
	-- A node of an Gcc-Xml file reprenting an entity wrappable by a
	-- Liberty class also containing the wrapper features of child
	-- and/or related nodes.

inherit 
	WRAPPABLE_NODE 
		undefine suffix
		redefine compute_eiffel_name -- To make sure that it is a correct class name	
		end

feature
	emit_wrapper is
		deferred
		end

	compute_eiffel_name is
		do
			Precursor
			cached_eiffel_name.to_upper
		end

feature {} -- Implementation
	output: TERMINAL_OUTPUT_STREAM

end -- class WRAPPER_CLASS
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
