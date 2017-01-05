note
	description: "enum cairo_pattern_type_t"
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli,
					Soluciones Informaticas Libres S.A. (Except),
					Cairo team
					
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
	date: "$Date:$"
	revision: "$Revision:$"
	wrapped_version: "1.2.4"

deferred class CAIRO_PATTERN_TYPE
	-- cairo_pattern_type_t is used to describe the type of a given pattern.
	
	-- The type of a pattern is determined by the function used to
	-- create it. The cairo_pattern_create_rgb() and
	-- cairo_pattern_create_rgba() functions create SOLID patterns. The
	-- remaining cairo_pattern_create functions map to pattern types in
	-- obvious ways.
	
	-- The pattern type can be queried with cairo_pattern_get_type()
	
	-- Most cairo_pattern functions can be called with a pattern of any
	-- type, (though trying to change the extend or filter for a solid
	-- pattern will have no effect). A notable exception is
	-- cairo_pattern_add_color_stop_rgb() and
	-- cairo_pattern_add_color_stop_rgba() which must only be called
	-- with gradient patterns (either LINEAR or RADIAL). Otherwise the
	-- pattern will be shutdown and put into an error state.
	
	-- New entries may be added in future versions.
	
inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_pattern_type (a_type: INTEGER): BOOLEAN
		do
			Result := ((a_type = cairo_pattern_type_solid) or else
						(a_type = cairo_pattern_type_surface) or else
						(a_type = cairo_pattern_type_linear) or else
						(a_type = cairo_pattern_type_radial))
		end

	cairo_pattern_type_solid: INTEGER
			-- The pattern is a solid (uniform) color. It may be opaque
			-- or translucent.
		external "C macro use <pango.h>"
		alias "CAIRO_PATTERN_TYPE_SOLID"
		end

	cairo_pattern_type_surface: INTEGER
			-- The pattern is a based on a surface (an image).
		external "C macro use <pango.h>"
		alias "CAIRO_PATTERN_TYPE_SURFACE"
		end

	cairo_pattern_type_linear: INTEGER
			-- The pattern is a linear gradient.
		external "C macro use <pango.h>"
		alias "CAIRO_PATTERN_TYPE_LINEAR"
		end

	cairo_pattern_type_radial: INTEGER
			-- The pattern is a radial gradient.
		external "C macro use <pango.h>"
		alias "CAIRO_PATTERN_TYPE_RADIAL"
		end

end
