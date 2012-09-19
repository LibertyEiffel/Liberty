deferred class C_FUNCTION_ARGUMENT
	-- An XML node of a file made by gccxml representing a piece of the
	-- argument list of a C function, either an actual argument or an ellipsis
	-- ("...")
inherit 
	GCCXML_NODE
insert
	SHARED_COLLECTIONS
	EXCEPTIONS
feature 
	is_ellipsis: BOOLEAN is
		-- Does Current argument make its function a variadic one?
		deferred
		end

	has_wrapper: BOOLEAN is
		deferred
		end

	put_on (a_buffer: FORMATTER) is
		-- Put an Eiffel representation on Current argument on `a_buffer'.
	require a_buffer/=Void
	deferred
	end
end -- class C_FUNCTION_ARGUMENT

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
