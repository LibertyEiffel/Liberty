indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class PANGO_FONT_FACE

inherit G_OBJECT

create {ANY} from_external_pointer

feature {} -- Creation
--             PangoFontFace;
-- #define     PANGO_TYPE_FONT_FACE
-- #define     PANGO_FONT_FACE                 (object)
-- #define     PANGO_IS_FONT_FACE              (object)
-- const char* pango_font_face_get_face_name   (PangoFontFace *face);
-- void        pango_font_face_list_sizes      (PangoFontFace *face,
--                                              int **sizes,
--                                              int *n_sizes);
-- PangoFontDescription* pango_font_face_describe
--                                             (PangoFontFace *face);
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <pango/pango.h>"
		alias "sizeof(PangoFontFace)"
		end

end -- class PANGO_FONT_FACE
