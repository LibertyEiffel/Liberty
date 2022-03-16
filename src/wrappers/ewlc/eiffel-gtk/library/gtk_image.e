note
	description: "GtkImage: A widget displaying an image"
	copyright: "[
					Copyright (C) 2006-2022: Nicolas Fafchamps <nicolas.fafchamps@gmail.com> and others
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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
	revision "$Revision:$"

class GTK_IMAGE

inherit GTK_MISC

insert
	GTK_IMAGE_EXTERNALS
	GTK_IMAGE_TYPE
	GTK_ICON_SIZE

create {ANY}
	make, from_file, from_external_pointer, from_pixbuf, from_pixmap, from_stock

feature {} -- Initialization

	make
			-- Create an empty gtk_image widget.
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_image_new)
		end

	from_file (filename: STRING)
			-- Create a `gtk_image' displaying the file `filename'.
			-- If the file isn't found or can't be loaded, the
			-- resulting `gtk_image' will display a "broken image" icon.
		require
			gtk_initialized: gtk.is_initialized
			filename_not_void: filename/=Void
		do
			from_external_pointer (gtk_image_new_from_file (filename.to_external))
		end


	from_pixbuf (pic: GDK_PIXBUF)
				-- Creates a new GtkImage displaying `pic'.
		require
			gtk_initialized: gtk.is_initialized
			pixbuf_not_void: pic /= Void
		do
			from_external_pointer (gtk_image_new_from_pixbuf (pic.handle))
		end

	from_pixmap (a_pixmap: GDK_PIXMAP; a_mask: GDK_BITMAP)
			-- Creates a GtkImage widget displaying pixmap with a mask.
			-- A GDK_PIXMAP is a server-side image buffer in the pixel
			-- format of the current display.
		require gtk_initialized: gtk.is_initialized
		local
			pixmap_ptr, mask_ptr: POINTER
		do
			if a_pixmap /= Void then pixmap_ptr := a_pixmap.handle end
			if a_mask /= Void then mask_ptr := a_mask.handle end
			from_external_pointer (gtk_image_new_from_pixmap (pixmap_ptr, mask_ptr))
		end

	from_stock (a_stock_item: STRING; a_size: INTEGER)
		require
			gtk.is_initialized
			a_stock_item /= Void
			is_valid_gtk_icon_size (a_size)
		do
			from_external_pointer (gtk_image_new_from_stock (a_stock_item.to_external, a_size))
		end

	-- Todo : Write gdk_visual, gdk_pixmap, ...
	-- Todo : gtk_icon_stock (?), gtk_icon_size (?), I am looking how to good implement.


	-- Todo : GtkWidget*  gtk_image_new_from_icon_set ()
	-- Todo : GtkWidget*  gtk_image_new_from_image ()
	-- Todo : GtkWidget*  gtk_image_new_from_animation ()
	-- Todo : GtkWidget*  gtk_image_new_from_icon_name ()

feature {ANY} -- Access

	storage_type: INTEGER
		do
			Result := gtk_image_get_storage_type (handle)
		ensure
			is_valid_gtk_image_type (Result)
		end

	pixbuf: GDK_PIXBUF
		require
			storage_type = gtk_image_pixbuf or storage_type = gtk_image_empty
		local
			pixbuf_ptr: POINTER
			factory: G_OBJECT_EXPANDED_FACTORY [GDK_PIXBUF]
		do
			pixbuf_ptr := gtk_image_get_pixbuf (handle)
			if pixbuf_ptr.is_not_null then
				Result := factory.wrapper (pixbuf_ptr)
				if Result = Void then
					-- We use from_external_pointer here because we *need* to
					-- increase the pixbuf's refcount
					create Result.from_external_pointer (pixbuf_ptr)
				end
			end
		end

feature {ANY} -- Element change
	set_file (filename: STRING)
			-- Set the `gtk_image' displaying the file `filename'.
			-- If the file isn't found or can't be loaded, the 
			-- resulting gtk_image will display a "broken image" icon.
		require
			valid_filename: filename /= Void
		do
			gtk_image_set_from_file (handle,filename.to_external)
		end

	set_from_pixbuf (a_pixbuf: GDK_PIXBUF)
			-- See `from_pixbuf' for details.
		require
			valid_pixbuf: a_pixbuf /= Void
		do
			gtk_image_set_from_pixbuf (handle, a_pixbuf.handle)
		end

	set_from_pixmap (a_pixmap: GDK_PIXMAP; a_mask: GDK_BITMAP)
			-- See `from_pixmap' for details.
		local
			pixmap_ptr, mask_ptr: POINTER
		do
			if a_pixmap /= Void then pixmap_ptr := a_pixmap.handle end
			if a_mask /= Void then mask_ptr := a_mask.handle end
			gtk_image_set_from_pixmap (handle, pixmap_ptr, mask_ptr)
		end

feature {ANY} -- Status setting
	set_pixel_size (a_pixel_size : INTEGER)
			-- Sets the pixel size to use.
		do
			gtk_image_set_pixel_size (handle,a_pixel_size)
		end

	-- Todo : Write gdk_visual, gdk_pixmap, ...
	-- Todo : gtk_icon_stock (?), gtk_icon_size (?), I am looking how to good implement.

	-- Todo : void        gtk_image_set_from_file ()
	-- Todo : void        gtk_image_set_from_icon_set ()
	-- Todo : void        gtk_image_set_from_image ()
	-- Todo : void        gtk_image_set_from_pixbuf ()
	-- Todo : void        gtk_image_set_from_pixmap ()
	-- Todo : void        gtk_image_set_from_stock ()
	-- Todo : void        gtk_image_set_from_animation ()
	-- Todo : void        gtk_image_set_from_icon_name ()
	

feature {ANY} -- Status report

	pixel_size : INTEGER
			-- Pixel size used.
		do
			Result := gtk_image_get_pixel_size (handle)
		end

feature {ANY}

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkImage)"
		end

end
