note
	description: "External calls for features of CAIRO_IMAGE_SURFACE"
	copyright: "[
					Copyright (C) 2007-2018: Soluciones Informaticas Libres S.A. (Except),
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

deferred class CAIRO_IMAGE_SURFACE_EXTERNALS

inherit ANY
	undefine copy, is_equal end

feature {} -- External calls

	cairo_image_surface_create (a_format, a_width, a_height: INTEGER): POINTER
		external "C use <cairo.h>"
		end

	cairo_image_surface_create_for_data (some_data: POINTER; a_format, a_width,
	                                     a_height, a_stride: INTEGER): POINTER
		external "C use <cairo.h>"
		end

	cairo_image_surface_get_data (a_surface: POINTER): POINTER
		external "C use <cairo.h>"
		end

	cairo_image_surface_get_format (a_surface: POINTER): INTEGER
		external "C use <cairo.h>"
		end

	cairo_image_surface_get_width (a_surface: POINTER): INTEGER
		external "C use <cairo.h>"
		end

	cairo_image_surface_get_height (a_surface: POINTER): INTEGER
		external "C use <cairo.h>"
		end

	cairo_image_surface_get_stride (a_surface: POINTER): INTEGER
		external "C use <cairo.h>"
		end

feature {} -- PNG Support

	cairo_image_surface_create_from_png (a_filename: POINTER): POINTER
		external "C use <cairo.h>"
		end

	cairo_surface_write_to_png   (a_surface, a_filename: POINTER): INTEGER
		external "C use <cairo.h>"
		end

end -- class CAIRO_IMAGE_SURFACE_EXTERNALS
