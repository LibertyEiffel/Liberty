note
	description: "Enum cairo_surface_type_t"
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli,
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

deferred class CAIRO_SURFACE_TYPE

	-- cairo_surface_type_t is used to describe the type of a given
	-- surface. The surface types are also known as "backends" or
	-- "surface backends" within cairo.

	-- The type of a surface is determined by the function used to
	-- create it, which will generally be of the form
	-- cairo_type_surface_create, (though see
	-- cairo_surface_create_similar as well).

	-- The surface type can be queried with `type'.

	-- The various cairo_surface functions can be used with surfaces of
	-- any type, but some backends also provide type-specific functions
	-- that must only be called with a surface of the appropriate
	-- type. These functions have names that begin with
	-- cairo_type_surface such as cairo_image_surface_get_width().

	-- The behavior of calling a type-specific function with a surface
	-- of the wrong type is undefined.

	-- New entries may be added in future versions.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum

	is_valid_surface_type (a_type: INTEGER): BOOLEAN
		do
			Result := ((a_type = cairo_surface_type_image) or else
						(a_type = cairo_surface_type_pdf) or else
						(a_type = cairo_surface_type_ps) or else
						(a_type = cairo_surface_type_xlib) or else
						(a_type = cairo_surface_type_xcb) or else
						(a_type = cairo_surface_type_glitz) or else
						(a_type = cairo_surface_type_quartz) or else
						(a_type = cairo_surface_type_win32) or else
						(a_type = cairo_surface_type_directfb) or else
						(a_type = cairo_surface_type_svg))
		end

	cairo_surface_type_image: INTEGER
			-- The surface is of type image
		external "C macro <cairo.h>"
		alias "CAIRO_SURFACE_TYPE_IMAGE"
		end

	cairo_surface_type_pdf: INTEGER
			-- The surface is of type pdf
		external "C macro <cairo.h>"
		alias "CAIRO_SURFACE_TYPE_PDF"
		end

	cairo_surface_type_ps: INTEGER
			-- The surface is of type ps
		external "C macro <cairo.h>"
		alias "CAIRO_SURFACE_TYPE_PS"
		end

	cairo_surface_type_xlib: INTEGER
			-- The surface is of type xlib
		external "C macro <cairo.h>"
		alias "CAIRO_SURFACE_TYPE_XLIB"
		end

	cairo_surface_type_xcb: INTEGER
			-- The surface is of type xcb
		external "C macro <cairo.h>"
		alias "CAIRO_SURFACE_TYPE_XCB"
		end

	cairo_surface_type_glitz: INTEGER
			-- The surface is of type glitz
		external "C macro <cairo.h>"
		alias "CAIRO_SURFACE_TYPE_GLITZ"
		end

	cairo_surface_type_quartz: INTEGER
			-- The surface is of type quartz
		external "C macro <cairo.h>"
		alias "CAIRO_SURFACE_TYPE_QUARTZ"
		end

	cairo_surface_type_win32: INTEGER
			-- The surface is of type win32
		external "C macro <cairo.h>"
		alias "CAIRO_SURFACE_TYPE_WIN32"
		end

	cairo_surface_type_directfb: INTEGER
			-- The surface is of type directfb
		external "C macro <cairo.h>"
		alias "CAIRO_SURFACE_TYPE_DIRECTFB"
		end

	cairo_surface_type_svg: INTEGER
			-- The surface is of type svg
		external "C macro <cairo.h>"
		alias "CAIRO_SURFACE_TYPE_SVG"
		end

end
