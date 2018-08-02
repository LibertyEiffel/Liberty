note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "1.2.4"

class FOO

inherit
	(SHARED_?)C_STRUCT

insert
	FOO_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: Cairo: A Vector Graphics Library (start)
	--   Link: Appendix A. Creating a language binding for cairo (parent)
	--   Link: Surfaces (previous)
	--   Link: cairo_path_t (next)
	--   Link: Part I. Tutorial (part)
	--   Link: Part II. Reference (part)
	--   Link: Drawing (chapter)
	--   Link: Fonts (chapter)
	--   Link: Surfaces (chapter)
	--   Link: Utilities (chapter)
	--   Link: Index (index)
	--   Link: Index of new symbols in 1.2 (index)
	--   Link: Appendix A. Creating a language binding for cairo (appendix)
	--
	--   Prev Up Home             Cairo: A Vector Graphics Library             Next
	--
	--Fonts
	--
	--   Fonts are once more an area where there is a hierarchy of types:
	--
	-- cairo_font_face_t
	--    cairo_ft_font_face_t
	--    cairo_win32_font_face_t
	-- cairo_scaled_font_t
	--    cairo_ft_scaled_font_t
	--    cairo_win32_scaled_font_t
	--
	--   The methods on the subtypes are, however, not useful without bindings for
	--   fontconfig and FreeType or for the Win32 GDI, so most language bindings
	--   will choose not to bind these types.
	--
	--   The cairo_font_face_set_user_data(), and cairo_font_face_get_user_data()
	--   methods are provided for use in language bindings, and should not be
	--   directly exposed to applications.

end -- class FOO
