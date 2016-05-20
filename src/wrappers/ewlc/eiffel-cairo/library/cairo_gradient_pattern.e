note
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Cairo team
					
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

deferred class CAIRO_GRADIENT_PATTERN

inherit CAIRO_PATTERN

feature {} -- Creation

	make_linear (x0,y0,x1,y1: REAL) is
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

	make_radial (cx0,cy0,radius0,cx1,cy1,radius1: REAL) is
			--   Creates a new radial gradient cairo_pattern_t between
			--   the two circles defined by (x0, y0, c0) and (x1, y1,
			--   c0). Before using the gradient pattern, a number of
			--   color stops should be defined using `add_color_stop_rgb'
			--   or `add_color_stop_rgba'.
		
			-- Note: The coordinates here are in pattern space. For a new
			-- pattern, pattern space is identical to user space, but the
			-- relationship between the spaces can be changed with
			-- `set_matrix'.
		
			--   cx0 :     x coordinate for the center of the start circle
			--   cy0 :     y coordinate for the center of the start circle
			--   radius0 : radius of the start cirle
			--   cx1 :     x coordinate for the center of the end circle
			--   cy1 :     y coordinate for the center of the end circle
			--   radius1 : radius of the end cirle
		do
			from_external_pointer(cairo_pattern_create_radial(cx0,cy0,radius0,cx1,cy1,radius1))
			-- cairo_pattern_create_radial returns the newly created
			-- cairo_pattern_t if succesful, or an error pattern in case
			-- of no memory. The caller owns the returned object and
			-- should call cairo_pattern_destroy() when finished with
			-- it. This function will always return a valid pointer, but
			-- if an error occurred the pattern status will be set to an
			-- error.  To inspect the status of a pattern use
			-- cairo_pattern_status().
		end

feature {ANY}
	add_color_stop_rgb (an_offset, a_red, a_green, a_blue: REAL) is
			-- Adds an opaque color stop to a gradient pattern. The
			-- offset specifies the location along the gradient's control
			-- vector. For example, a linear gradient's control vector is
			-- from (x0,y0) to (x1,y1) while a radial gradient's control
			-- vector is from any point on the start circle to the
			-- corresponding point on the end circle.
	
			-- The color is specified in the same way as in
			-- cairo_set_source_rgb().
	
			-- Note: If the pattern is not a gradient pattern, (eg. a
			-- linear or radial pattern), then the pattern will be put
			-- into an error status with a status of
			-- CAIRO_STATUS_PATTERN_TYPE_MISMATCH.
			
			-- `an_offset':  an offset in the range [0.0 .. 1.0]
			-- `a_red':     red component of color
			-- `a_green':   green component of color
			--   blue :    blue component of color
		require valid_offset: an_offset.in_range(0.0, 1.0)
		do
			cairo_pattern_add_color_stop_rgb(handle,an_offset,a_red,a_green,a_blue)
		end

	add_color_stop_rgba (an_offset, a_red, a_green, a_blue, an_alpha: REAL) is
			-- Adds a translucent color stop to a gradient
			-- pattern. `an_offset' specifies the location along the
			-- gradient's control vector. For example, a linear
			-- gradient's control vector is from (x0,y0) to (x1,y1) while
			-- a radial gradient's control vector is from any point on
			-- the start circle to the corresponding point on the end
			-- circle.

			-- The color is specified in the same way as in
			-- cairo_set_source_rgba().

			--   offset :  an offset in the range [0.0 .. 1.0]
			--   red :     red component of color
			--   green :   green component of color
			--   blue :    blue component of color
			--   alpha :   alpha component of color
		require valid_offset: an_offset.in_range(0.0, 1.0)
		do
			cairo_pattern_add_color_stop_rgba(handle,an_offset, a_red, a_green, a_blue, an_alpha)
		end
end -- class CAIRO_GRADIENT_PATTERN
