note
	description: "."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, Cairo team
					
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

class CAIRO_LINEAR_PATTERN

inherit CAIRO_GRADIENT_PATTERN

create {ANY} make, from_external_pointer

feature {} -- Creation

	make (x0,y0,x1,y1: REAL)
			-- Create a new linear gradient along the line defined by
			-- (x0, y0) and (x1, y1). Before using the gradient pattern,
			-- a number of color stops should be defined using
			-- `add_color_stop_rgb' or `add_color_stop_rgba'.
		
			-- Note: The coordinates here are in pattern space. For a new
			-- pattern, pattern space is identical to user space, but the
			-- relationship between the spaces can be changed with
			-- `set_matrix'.
		
			--   x0 :      x coordinate of the start point
			--   y0 :      y coordinate of the start point
			--   x1 :      x coordinate of the end point
			--   y1 :      y coordinate of the end point
		do
			from_external_pointer(cairo_pattern_create_linear(x0,y0,x1,y1))
			-- cairo_pattern_create_linear returns the newly created
			-- cairo_pattern_t if succesful, or an error pattern in case
			-- of no memory. The caller owns the returned object and
			-- should call cairo_pattern_destroy() when finished with
			-- it. This function will always return a valid pointer, but
			-- if an error occurred the pattern status will be set to an
			-- error.  To inspect the status of a pattern use
			-- cairo_pattern_status().
		end

end -- class CAIRO_LINEAR_PATTERN
