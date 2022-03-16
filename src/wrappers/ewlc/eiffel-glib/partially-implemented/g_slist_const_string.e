note
	description: "List of (const) strings"
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli 
					
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

class G_SLIST_CONST_STRING

inherit
	G_SLIST_STRING
		redefine
			first,last,item
		end
	
create {ANY} make, from_external_pointer

feature {ANY}
		first: CONST_STRING
		do
			create Result.from_external (g_slist_get_data (handle))
		end

	last: like first
		do
			create Result.from_external (g_slist_get_data (g_slist_last (handle)))
		end

	item (i: INTEGER): like first
		local cstr: POINTER
		do
			cstr := g_slist_nth_data (handle, i)
			if cstr.is_not_null then
				create Result.from_external (cstr)
			end
		end

end -- class G_SLIST_CONST_STRING
