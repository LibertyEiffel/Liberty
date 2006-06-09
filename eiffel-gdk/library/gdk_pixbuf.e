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

creation
	from_external_pointer, from_file, from_file_at_size

feature {NONE} -- Creation

	from_file(filename: STRING) is
			-- New pixbuf by loading an image from `filename'.
			-- The file format is detected automatically. 
		require
			filename /= Void
		do
			-- 20060608: FIXME: no error handling at the moment, check second argument of
			-- gdk_pixbuf_new_from_file **trixx
			set_handle (gdk_pixbuf_new_from_file(filename.to_external, default_pointer))
			store_eiffel_wrapper
		ensure
			handle.is_not_null
			is_g_object
		end

	from_file_at_size(filename: STRING; a_width, a_height: INTEGER) is
			-- New pixbuf by loading an image from `filename'.
			-- The file format is detected automatically.
			-- The image will be scaled to fit in a `a_width'x`a_height' area
			-- preserving the image's aspect ratio.
			-- `a_width ' and `a_height' can be -1 to avoid constraining that dimension
		require
			a_width >= -1
			a_height >= -1
			filename /= Void
		do
			set_handle (gdk_pixbuf_new_from_file_at_size(filename.to_external, a_width, a_height, default_pointer))
			store_eiffel_wrapper
		ensure
			handle.is_not_null
			is_g_object
		end

-- gdk_pixbuf_new_from_file_at_scale ()
-- 
-- GdkPixbuf*  gdk_pixbuf_new_from_file_at_scale
--                                             (const char *filename,
--                                              int width,
--                                              int height,
--                                              gboolean preserve_aspect_ratio,
--                                              GError **error);
-- 
-- Creates a new pixbuf by loading an image from a file. The file format is detected automatically. If NULL is returned, then error will be set. Possible errors are in the GDK_PIXBUF_ERROR and G_FILE_ERROR domains. The image will be scaled to fit in the requested size, optionally preserving the image's aspect ratio.
-- 
-- When preserving the aspect ratio, a width of -1 will cause the image to be scaled to the exact given height, and a height of -1 will cause the image to be scaled to the exact given width. When not preserving aspect ratio, a width or height of -1 means to not scale the image at all in that dimension. Negative values for width and height are allowed since 2.8.
-- 
-- filename : Name of file to load, in the GLib file name encoding
-- width : The width the image should have or -1 to not constrain the width
-- height : The height the image should have or -1 to not constrain the height
-- preserve_aspect_ratio : TRUE to preserve the image's aspect ratio
-- error :     Return location for an error
-- Returns :   A newly-created pixbuf with a reference count of 1, or NULL if any of several error conditions occurred: the file could not be opened, there was no loader for the file's format, there was not enough memory to allocate the image buffer, or the image file contained invalid data.
-- 
-- Since 2.6
-- gdk_pixbuf_get_file_info ()
-- 
-- GdkPixbufFormat* gdk_pixbuf_get_file_info   (const gchar *filename,
--                                              gint *width,
--                                              gint *height);
-- 
-- Parses an image file far enough to determine its format and size.
-- 
-- filename :  The name of the file to identify.
-- width :     Return location for the width of the image, or NULL
-- height :    Return location for the height of the image, or NULL
-- Returns :   A GdkPixbufFormat describing the image format of the file or NULL if the image format wasn't recognized. The return value is owned by GdkPixbuf and should not be freed.
-- 
-- Since 2.4
-- 

feature -- Properties

--  "bits-per-sample"      gint                  : Read / Write / Construct Only
--  "colorspace"           GdkColorspace         : Read / Write / Construct Only
--  "has-alpha"            gboolean              : Read / Write / Construct Only
--  "height"               gint                  : Read / Write / Construct Only
--  "n-channels"           gint                  : Read / Write / Construct Only
--  "pixels"               gpointer              : Read / Write / Construct Only
--  "rowstride"            gint                  : Read / Write / Construct Only
--  "width"                gint                  : Read / Write / Construct Only

-- Property Details
-- The "bits-per-sample" property
-- 
--   "bits-per-sample"      gint                  : Read / Write / Construct Only
-- 
-- The number of bits per sample. Currently only 8 bit per sample are supported.
-- 
-- Allowed values: [1,16]
-- 
-- Default value: 8
-- The "colorspace" property
-- 
--   "colorspace"           GdkColorspace         : Read / Write / Construct Only
-- 
-- The colorspace in which the samples are interpreted.
-- 
-- Default value: GDK_COLORSPACE_RGB
-- The "has-alpha" property
-- 
--   "has-alpha"            gboolean              : Read / Write / Construct Only
-- 
-- Whether the pixbuf has an alpha channel.
-- 
-- Default value: FALSE
-- The "height" property
-- 
--   "height"               gint                  : Read / Write / Construct Only
-- 
-- The number of rows of the pixbuf.
-- 
-- Allowed values: >= 1
-- 
-- Default value: 1
-- The "n-channels" property
-- 
--   "n-channels"           gint                  : Read / Write / Construct Only
-- 
-- The number of samples per pixel. Currently, only 3 or 4 samples per pixel are supported.
-- 
-- Allowed values: >= 0
-- 
-- Default value: 3
-- The "pixels" property
-- 
--   "pixels"               gpointer              : Read / Write / Construct Only
-- 
-- A pointer to the pixel data of the pixbuf.
-- The "rowstride" property
-- 
--   "rowstride"            gint                  : Read / Write / Construct Only
-- 
-- The number of bytes between the start of a row and the start of the next row. This number must (obviously) be at least as large as the width of the pixbuf.
-- 
-- Allowed values: >= 1
-- 
-- Default value: 1
-- The "width" property
-- 
--   "width"                gint                  : Read / Write / Construct Only
-- 
-- The number of columns of the pixbuf.
-- 
-- Allowed values: >= 1
-- 
-- Default value: 1
-- 
 
feature {WRAPPER} -- size

	size: INTEGER is
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkPixbuf)"
		end

end -- GDK_PIXBUF
