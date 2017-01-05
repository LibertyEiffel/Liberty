note
	description: "enum cairo_font_type_t"
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

deferred class CAIRO_FONT_TYPE
	-- cairo_font_type_t is used to describe the type of a given font
	-- face or scaled font. The font types are also known as "font
	-- backends" within cairo.

	-- The type of a font face is determined by the function used to
	-- create it, which will generally be of the form
	-- cairo_type_font_face_create. The font face type can be queried
	-- with CAIRO_FONT_FACE.`get_type'

	-- The various cairo_font_face functions can be used with a font
	-- face of any type.

	-- The type of a scaled font is determined by the type of the font
	-- face passed to cairo_scaled_font_create. The scaled font type
	-- can be queried with cairo_scaled_font_get_type()

	-- The various cairo_scaled_font functions can be used with scaled
	-- fonts of any type, but some font backends also provide
	-- type-specific functions that must only be called with a scaled
	-- font of the appropriate type. These functions have names that
	-- begin with cairo_type_scaled_font such as
	-- cairo_ft_scaled_font_lock_face.

	-- The behavior of calling a type-specific function with a scaled
	-- font of the wrong type is undefined.

	-- New entries may be added in future versions.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_font_type (a_type: INTEGER): BOOLEAN
		do
			Result := ((a_type = cairo_font_type_toy) or else
						(a_type = cairo_font_type_ft) or else
						(a_type = cairo_font_type_win32) or else
						(a_type = cairo_font_type_atsui))
		end

	cairo_font_type_toy: INTEGER
			-- The font was created using cairo's toy font api
		external "C macro use <cairo.h>"
		alias "CAIRO_FONT_TYPE_TOY"
		end

	cairo_font_type_ft: INTEGER
			-- The font is of type FreeType
		external "C macro use <cairo.h>"
		alias "CAIRO_FONT_TYPE_FT"
		end

	cairo_font_type_win32: INTEGER
			-- The font is of type Win32
		external "C macro use <cairo.h>"
		alias "CAIRO_FONT_TYPE_WIN32"
		end

	cairo_font_type_atsui: INTEGER
			-- The font is of type ATSUI
		external "C macro use <cairo.h>"
		alias "CAIRO_FONT_TYPE_ATSUI"
		end
end
