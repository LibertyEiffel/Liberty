note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, Cairo team
					
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

class CAIRO_SURFACE_PATTERN

inherit CAIRO_PATTERN

create {ANY} from_surface, from_external_pointer

feature {} -- Creation
	from_surface (a_surface: CAIRO_SURFACE)
			-- Create a new cairo_pattern_t for the given surface.
		require surface_not_void: a_surface /= Void
		do
			from_external_pointer(cairo_pattern_create_for_surface(a_surface.handle))
			-- cairo_pattern_create_for_surface returns the newly created
			-- cairo_pattern_t if succesful, or an error pattern in case
			-- of no memory. The caller owns the returned object and
			-- should call cairo_pattern_destroy() when finished with
			-- it. This function will always return a valid pointer, but
			-- if an error occurred the pattern status will be set to an
			-- error.  To inspect the status of a pattern use
			-- cairo_pattern_status().
	end

end -- class CAIRO_SURFACE_PATTERN
