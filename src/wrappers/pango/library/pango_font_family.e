indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

class PANGO_FONT_FAMILY

inherit G_OBJECT

-- insert FOO_EXTERNALS

create {ANY} from_external_pointer

feature {} -- Creation
	
-- #define     PANGO_TYPE_FONT_FAMILY
-- #define     PANGO_FONT_FAMILY               (object)
-- #define     PANGO_IS_FONT_FAMILY            (object)
-- const char* pango_font_family_get_name      (PangoFontFamily *family);
-- gboolean    pango_font_family_is_monospace  (PangoFontFamily *family);
-- void        pango_font_family_list_faces    (PangoFontFamily *family,
--                                              PangoFontFace ***faces,
--                                              int *n_faces);

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <pango/pango.h>"
		alias "sizeof(PangoFontFamily)"
		end
end -- class PANGO_FONT_FAMILY
