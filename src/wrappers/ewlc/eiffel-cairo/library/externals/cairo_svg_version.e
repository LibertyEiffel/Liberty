note
	description: "enum cairo_svg_version_t"
	copyright: "[
					Copyright (C) 2007-2022: $EWLC_developer, $original_copyright_holder
					
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

deferred class CAIRO_SVG_VERSION
	-- cairo_svg_version_t is used to describe the version number of
	-- the SVG specification that a generated SVG file will conform to.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_svg_version (a_version: INTEGER): BOOLEAN
		do	
			Result:=((a_version = cairo_svg_version_1_1) or else
						(a_version = cairo_svg_version_1_2))
		end
	
	cairo_svg_version_1_1: INTEGER
			-- The version 1.1 of the SVG specification.
		external "C macro <cairo.h>"
		alias "CAIRO_SVG_VERSION_1_1"
		end
		
	cairo_svg_version_1_2: INTEGER
			-- The version 1.2 of the SVG specification.
		external "C macro <cairo.h>"
		alias "CAIRO_SVG_VERSION_1_2"
		end
end
