note
	description: "Enum GtkImageType"
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

				-- Describes the image data representation used by a
				-- GtkImage. If you want to get the image from the widget,
				-- you can only get the currently-stored
				-- representation. e.g. if the `GTK_IMAGE.storage_type'
				-- returns GTK_IMAGE_PIXBUF, then you can call
				-- `GTK_IMAGE.pixbuf' but not `GTK_IMAGE.stock'. For empty
				-- images, you can request any storage type (call any of
				-- the "get" functions), but they will all return Void
				-- values.
				
deferred class GTK_IMAGE_TYPE

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_gtk_image_type (a_type :INTEGER): BOOLEAN
		do
			Result := ((a_type = gtk_image_empty) or else
						(a_type = gtk_image_pixmap) or else
						(a_type = gtk_image_image) or else
						(a_type = gtk_image_pixbuf) or else
						(a_type = gtk_image_stock) or else
						(a_type = gtk_image_icon_set) or else
						(a_type = gtk_image_animation) or else
						(a_type = gtk_image_icon_name))
		end

	gtk_image_empty: INTEGER
			-- 	there is no image displayed by the widget
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IMAGE_EMPTY"
		end

	gtk_image_pixmap: INTEGER
			-- 	the widget contains a GdkPixmap
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IMAGE_PIXMAP"
		end

	gtk_image_image: INTEGER
			-- 	the widget contains a GdkImage
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IMAGE_IMAGE"
		end

	gtk_image_pixbuf: INTEGER
			-- 	the widget contains a GdkPixbuf
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IMAGE_PIXBUF"
		end

	gtk_image_stock: INTEGER
			-- 	the widget contains a stock icon name (see Stock Items(3))
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IMAGE_STOCK"
		end

	gtk_image_icon_set: INTEGER
			-- 	the widget contains a GtkIconSet
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IMAGE_ICON_SET"
		end

	gtk_image_animation: INTEGER
			-- 	the widget contains a GdkPixbufAnimation
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IMAGE_ANIMATION"
		end

	gtk_image_icon_name: INTEGER
			-- 	the widget contains a named icon. This image type was added in GTK+ 2.6 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_IMAGE_ICON_NAME"
		end
end
