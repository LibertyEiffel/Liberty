indexing
	description: "The GdkPixbuf structure contains information that describes an image in memory."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GDK_PIXBUF

inherit G_OBJECT

insert
	GDK_PIXBUF_EXTERNALS

creation from_external_pointer, from_file, from_file_at_size

feature {NONE}

	from_file(filename: STRING) is
		-- Creates a new pixbuf by loading an image from a file.
		-- The file format is detected automatically. 
		--	  filename: Name of file to load, in the GLib file name encoding
		-- Returns: A newly-created pixbuf with a reference count of 1, 
		-- or NULL if any of several error conditions occurred: the file
		-- could not be opened, there was no loader for the file's format,
		-- there was not enough memory to allocate the image buffer, or the
		-- image file contained invalid data.
		do
			set_handle (gdk_pixbuf_new_from_file(filename.to_external, default_pointer))
			store_eiffel_wrapper
		ensure
			handle.is_not_null
			is_g_object
		end

	from_file_at_size(filename: STRING; a_width, a_height: INTEGER) is
		--  Creates a new pixbuf by loading an image from a file.
		-- The file format is detected automatically.
		-- The image will be scaled to fit in the requested size,
		-- preserving the image's aspect ratio.
		--      filename : Name of file to load, in the GLib file name encoding
		--      width: The width the image should have or -1 to not constrain the width
		--      height: The height the image should have or -1 to not constrain the height
		-- Returns: A newly-created pixbuf with a reference count of 1,
		-- or NULL if any of several error conditions occurred: the file
		-- could not be opened, there was no loader for the file's format,
		-- there was not enough memory to allocate the image buffer, or the
		-- image file contained invalid data.
		require
			a_width >= -1
			a_height >= -1
		do
			set_handle (gdk_pixbuf_new_from_file_at_size(filename.to_external, a_width, a_height, default_pointer))
			store_eiffel_wrapper
		ensure
			handle.is_not_null
			is_g_object
		end

feature {WRAPPER} -- size

	size: INTEGER is
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkPixbuf)"
		end

end -- GDK_PIXBUF
