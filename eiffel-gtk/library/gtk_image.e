indexing
	description: "GtkImage — A widget displaying an image"
	copyright: "[
					Copyright (C) 2006 Nicolas Fafchamps <nicolas.fafchamps@gmail.com> and others
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
	revision "$REvision:$"

class GTK_IMAGE

inherit
	GTK_MISC
	GTK_IMAGE_EXTERNALS
	
creation
	make, from_file, from_external_pointer, from_pixbuf
	
feature {NONE} -- Initialization

	make is
			-- Create an empty gtk_image widget.
		do
			handle := gtk_image_new
			store_eiffel_wrapper
		end

	from_file (filename: STRING) is
			-- Create a `gtk_image' displaying the file `filename'.
			-- If the file isn't found or can't be loaded, the
			-- resulting `gtk_image' will display a "broken image" icon.
		require
			valid_filename: filename/=Void
		do
			handle := gtk_image_new_from_file (filename.to_external)
			store_eiffel_wrapper
		end


	from_pixbuf (pic: GDK_PIXBUF) is
            -- Creates a new GtkImage displaying pixbuf.
		require
			valid_pixbuf: pic /= Void
		do
			handle := gtk_image_new_from_pixbuf (pic.handle)
			store_eiffel_wrapper
		end

	-- Todo : Write gdk_visual, gdk_pixmap, ...
	-- Todo : gtk_icon_stock (?), gtk_icon_size (?), I am looking how to good implement.


	-- Todo : GtkWidget*  gtk_image_new_from_icon_set ()
	-- Todo : GtkWidget*  gtk_image_new_from_image ()
	-- Todo : GtkWidget*  gtk_image_new_from_pixmap ()
	-- Todo : GtkWidget*  gtk_image_new_from_stock ()
	-- Todo : GtkWidget*  gtk_image_new_from_animation ()
	-- Todo : GtkWidget*  gtk_image_new_from_icon_name ()

feature -- Element change
	set_file (filename: STRING) is
			-- Set the `gtk_image' displaying the file `filename'.
			-- If the file isn't found or can't be loaded, the 
			-- resulting gtk_image will display a "broken image" icon.
		require
			valid_filename: filename/=Void
		do
			gtk_image_set_from_file (handle,filename.to_external)
		end

	set_from_pixbuf (pixbuf: GDK_PIXBUF) is
            -- See gtk_image_new_from_pixbuf() for details.
		require
			valid_pixbuf: pixbuf /= Void
		do
			gtk_image_set_from_pixbuf (handle, pixbuf.handle)
		end

feature -- Status setting
	set_pixel_size (a_pixel_size : INTEGER) is
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
	
feature -- Status report
	pixel_size : INTEGER is
			-- Pixel size used.
		do
			Result := gtk_image_get_pixel_size (handle)
		end
end
