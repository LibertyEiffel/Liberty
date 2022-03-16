note
	description: "GDK_ATOM - An opaque type representing a string as an index into a table of strings on the X server."
	copyright: "[
					Copyright (C) 2008-2022: eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"
            
            -- TODO fix this class

expanded class GDK_ATOM
	-- An opaque type representing a string as an index into a table s on the X server.
 
insert WRAPPER
	-- Note for the developers of Eiffel Wrapper Libraries Collection (EWLC):
	-- here I use only the plain wrapper because memory handling in C is
	-- automatic and it does not matter how an atom is actually implemented.

create {ANY} initialize

feature {ANY}
	initialize
			-- Empty initialization
		do
		end

	struct_size: INTEGER
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkAtom)"
		end

end -- class GDK_ATOM
