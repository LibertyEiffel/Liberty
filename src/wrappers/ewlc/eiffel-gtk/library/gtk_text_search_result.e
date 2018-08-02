note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli.
					
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

class GTK_TEXT_SEARCH_RESULT
	-- The result of a search command over a GTK_TEXT_BUFFER

insert
	ANY
		redefine
			copy,
			default_create,
			is_equal
		end
	
create {ANY} default_create, copy

feature {} -- Creation
	default_create
		do
			create match_start.make
			create match_end.make
		end
	
feature {ANY}
	set_found (a_setting: BOOLEAN)
		do
			found:=a_setting
		end

	is_equal (another: like Current): BOOLEAN
		do
			Result:=(match_start.is_equal(another.match_start) and
						match_end.is_equal(another.match_end))
		end

	copy (another: like Current)
		do
			found:=another.found
			create match_start.copy(another.match_start)
			create match_end.copy(another.match_end)
		end

feature {ANY}
	found: BOOLEAN
			-- Has this search been successful?
	
	match_start: GTK_TEXT_ITER
			-- The beginning of the found match
	
	match_end: GTK_TEXT_ITER	
			-- The end of the found match
	
end -- class GTK_TEXT_SEARCH_RESULT

