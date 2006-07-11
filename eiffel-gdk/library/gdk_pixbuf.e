indexing
	description: "GdkPixbuf -- Information that describes an image."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team,  GTK+ team and others
					
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

			-- The GdkPixbuf structure contains information that describes
			-- an image in memory.

class GDK_PIXBUF

inherit
	G_OBJECT
		rename make as g_object_make
		redefine dispose, from_external_pointer end

insert
	GDK_PIXBUF_EXTERNALS
	GDK_COLORSPACE

creation
	make, from_external_pointer, from_file, from_file_at_size, from_drawable, from_pixbuf

feature -- Creation

	from_pixbuf (other: like Current) is
		require
			other.handle.is_not_null
		do
			from_external_pointer (gdk_pixbuf_copy (other.handle))
		end

	from_external_pointer (a_ptr: POINTER) is
		require else
			called_on_creation: is_null
			--pointer_not_null: a_ptr.is_not_null
			not (create {G_RETRIEVER [like Current]}).has_eiffel_wrapper_stored (a_ptr)
		do
			if a_ptr.is_not_null then
				Precursor (a_ptr)
				is_valid := True
			end
		ensure
			a_ptr.is_not_null = is_valid
		end

feature {NONE} -- Creation

	from_file (filename: STRING) is
			-- New pixbuf by loading an image from `filename'.
			-- The file format is detected automatically. 
		require
			filename /= Void
		do
			from_external_pointer (gdk_pixbuf_new_from_file(filename.to_external, default_pointer))
		ensure
			is_valid = is_g_object
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
			from_external_pointer (gdk_pixbuf_new_from_file_at_size (filename.to_external, a_width, a_height, default_pointer))
		ensure
			is_valid = is_g_object
		end

	from_drawable (a_drawable: GDK_DRAWABLE; src_x, src_y, a_width, a_height: INTEGER) is
		require
			a_drawable /= Void
		do
			from_external_pointer (gdk_pixbuf_get_from_drawable (default_pointer, a_drawable.handle,
				default_pointer, src_x, src_y, 0, 0, a_width, a_height))
		end

	make (a_alpha: BOOLEAN; a_width, a_height: INTEGER) is
		-- Creates a new GdkPixbuf structure and allocates a buffer for it.
		-- The buffer has an optimal rowstride. Note that the buffer is not
		-- cleared; you will have to fill it completely yourself.
		require
			a_width >= 0
			a_height >= 0
		local
			ptr: POINTER
		do
			ptr := gdk_pixbuf_new(gdk_colorspace_rgb, a_alpha.to_integer, 8, a_width, a_height)
			if ptr.is_not_null then
				set_handle(ptr)
				is_valid := True
				store_eiffel_wrapper
			end
		ensure
			is_valid = is_g_object
		end

feature -- Operations

	render_pixmap_and_mask (alpha_threshold: INTEGER): TUPLE[GDK_PIXMAP, GDK_BITMAP] is
			-- Creates a pixmap and a mask bitmap, and renders a pixbuf
			-- and its corresponding thresholded alpha mask to them.
			-- This is merely a convenience function; applications that
			-- need to render pixbufs with dither offsets or to given
			-- drawables should use draw_pixbuf() and render_threshold_alpha().
			--
			-- The pixmap that is created is created for the colormap
			-- returned by gdk_rgb_get_colormap(). You normally will want to
			-- instead use the actual colormap for a widget, and use
			-- gdk_pixbuf_render_pixmap_and_mask_for_colormap().
			--
			-- If the pixbuf does not have an alpha channel, then the resulting
			-- GDK_BITMAP will be null.
		require
			alpha_threshold.in_range(0, 255)
		local
			pixmap_return, bitmap_return: POINTER
			a_pixmap: GDK_PIXMAP
			a_bitmap: GDK_BITMAP
		do
			gdk_pixbuf_render_pixmap_and_mask (handle, $pixmap_return, $bitmap_return, alpha_threshold)
			create a_pixmap.from_external_pointer (pixmap_return)
			if bitmap_return.is_not_null then
				create a_bitmap.from_external_pointer (bitmap_return)
			end
			Result := [a_pixmap, a_bitmap]
		ensure
			Result.first /= Void
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
 

feature -- Disposing

	dispose is
		do
			if is_valid then
				Precursor
			end
		end

feature -- Error reporting

	is_valid: BOOLEAN

feature {WRAPPER} -- size

	size: INTEGER is
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkPixbuf)"
		end

feature -- Composites

	composite_color_simple (dest_width, dest_height: INTEGER; interp_type: INTEGER;
	                        overall_alpha, check_size: INTEGER; color1, color2: INTEGER_64) : GDK_PIXBUF is
			-- Creates a new GDK_PIXBUF by scaling Current to `dest_width' x `dest_height'
			-- and compositing the result with a checkboard of colors `color1' and
			-- `color2'.
		require
			colors_conform_guint32: color1 >= 0 and color2 >= 0
			valid_alpha: overall_alpha.in_range (0, 255)
			valid_check_size: check_size.is_a_power_of_2
			valid_interp_type: is_valid_gdk_interp_type (interp_type)
		local
			res: POINTER
		do
			res := gdk_pixbuf_composite_color_simple (handle, dest_width, dest_height, interp_type,
			                                          overall_alpha, check_size, color1, color2)
			Result := create {GDK_PIXBUF}.from_external_pointer (res)
		ensure
			Result /= Void
		end

	composite (dest: GDK_PIXBUF; dest_x, dest_y, dest_width, dest_height: INTEGER;
	           offset_x, offset_y, scale_x, scale_y: REAL_64;
	           interp_type: INTEGER; overall_alpha: INTEGER) is
			-- Creates a transformation of the source image Current by scaling by
			-- `scale_x' and `scale_y' then translating by `offset_x' and `offset_y'.
			-- This gives an image in the coordinates of the destination pixbuf. The
			-- rectangle (`dest_x', `dest_y', `dest_width', `dest_height') is then
			-- composited onto the corresponding rectangle of the original destination image.
			-- When the destination rectangle contains parts not in the source
			-- image, the data at the edges of the source image is replicated to infinity.
		require
			valid_alpha: overall_alpha.in_range (0, 255)
			valid_interp_type: is_valid_gdk_interp_type (interp_type)
		do
			gdk_pixbuf_composite (handle, dest.handle, dest_x, dest_y, dest_width, dest_height,
			                      offset_x, offset_y, scale_x, scale_y, interp_type, overall_alpha)
		end

	composite_color (dest: GDK_PIXBUF; dest_x, dest_y, dest_width, dest_height: INTEGER;
	                 offset_x, offset_y, scale_x, scale_y: REAL_64;
	                 interp_type: INTEGER; overall_alpha, check_x, check_y, check_size: INTEGER;
	                 color1, color2: INTEGER_64) is
			-- Creates a transformation of the source image Current by
			-- scaling by `scale_x' and `scale_y' then translating by `offset_x'
			-- and `offset_y', then composites the rectangle (`dest_x' ,`dest_y',
			-- `dest_width', `dest_height') of the resulting image with a
			-- checkboard of the colors `color1' and `color2' and renders it
			-- onto the destination image.
			-- See `gdk_pixbuf_composite_color_simple' for a simpler
			-- variant of this function suitable for many tasks.
		require
			colors_conform_guint32: color1 >= 0 and color2 >= 0
			valid_alpha: overall_alpha.in_range (0, 255)
			valid_check_size: check_size.is_a_power_of_2
			valid_interp_type: is_valid_gdk_interp_type (interp_type)
		do
			gdk_pixbuf_composite_color (handle, dest.handle, dest_x, dest_y, dest_width, dest_height,
			                            offset_x, offset_y, scale_x, scale_y, interp_type,
			                            overall_alpha, check_x, check_y, check_size, color1, color2)
		end

end -- GDK_PIXBUF
