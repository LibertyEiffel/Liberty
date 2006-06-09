indexing
	description: "External calls for GdkPixbuf"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

class GDK_PIXBUF_EXTERNALS

feature {NONE} -- External calls

	gdk_pixbuf_new_from_file(filename, error: POINTER): POINTER is
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

	gdk_pixbuf_new_from_file_at_size(filename: POINTER; a_width, a_height: INTEGER; error_dummy: POINTER): POINTER is
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

--Missing:
-- GdkPixbuf*  gdk_pixbuf_new_from_file_at_scale
--                                            (const char *filename,
--                                             int width,
--                                             int height,
--                                             gboolean preserve_aspect_ratio,
--                                             GError **error);
-- GdkPixbufFormat* gdk_pixbuf_get_file_info   (const gchar *filename,
--                                             gint *width,
--                                             gint *height);
--
-- FIXME: A lot more missing, but it is hard to make a complete list, because
-- the docs for GdkPixbuf are spread over lots of pages **trixx, 20060608

end -- class GDK_PIXBUF_EXTERNALS
