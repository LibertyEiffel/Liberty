indexing
	description: "GtkImage — A widget displaying an image"
	copyright: "(C) 2006 Nicolas Fafchamps <nicolas.fafchamps@gmail.com> and Others"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GTK_IMAGE

inherit
	GTK_MISC redefine make end
	GTK_IMAGE_EXTERNALS
	
creation
	make, from_file, from_external_pointer
	
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

	-- Todo : Write gdk_visual, gdk_pixmap, ...
	-- Todo : gtk_icon_stock (?), gtk_icon_size (?), I am looking how to good implement.


	-- Todo : GtkWidget*  gtk_image_new_from_icon_set ()
	-- Todo : GtkWidget*  gtk_image_new_from_image ()
	-- Todo : GtkWidget*  gtk_image_new_from_pixbuf ()
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

	
