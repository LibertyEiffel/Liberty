note
	description: "External calls for CAIRO_FONT_FACE"
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli,
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

deferred class CAIRO_FONT_FACE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	cairo_font_face_reference (a_font_face: POINTER): POINTER
			-- 	cairo_font_face_t* cairo_font_face_reference (cairo_font_face_t *font_face);
		external "C use <cairo.h>"
		end

	cairo_font_face_destroy (a_font_face: POINTER)
			-- void cairo_font_face_destroy (cairo_font_face_t
			-- *font_face);
		external "C use <cairo.h>"
		end

	cairo_font_face_status (a_font_face: POINTER): INTEGER
			-- cairo_status_t cairo_font_face_status (cairo_font_face_t
			-- *font_face);
		external "C use <cairo.h>"
		end
	
	cairo_font_face_get_user_data (a_font_face, a_key: POINTER): POINTER
			-- void* cairo_font_face_get_user_data (cairo_font_face_t
			-- *font_face, const cairo_user_data_key_t *key);
		external "C use <cairo.h>"
		end

	cairo_font_face_set_user_data (a_font_face, a_key, some_data, a_destroy_func: POINTER): INTEGER
			-- cairo_status_t cairo_font_face_set_user_data
			-- (cairo_font_face_t *font_face, const cairo_user_data_key_t
			-- *key, void *user_data, cairo_destroy_func_t destroy);
		external "C use <cairo.h>"
		end
	
	-- enum        cairo_font_type_t is

	cairo_font_face_get_type  (a_font_face: POINTER): INTEGER
			-- cairo_font_type_t cairo_font_face_get_type
			-- (cairo_font_face_t *font_face);
		external "C use <cairo.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_font_face_t)"
		end
end
