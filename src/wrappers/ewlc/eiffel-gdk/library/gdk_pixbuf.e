note
	description: "GdkPixbuf -- Information that describes an image."
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team,  GTK+ team and others
					
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
		redefine dispose, store_eiffel_wrapper, unstore_eiffel_wrapper end

insert
	GDK_PIXBUF_EXTERNALS
	GDK_COLORSPACE

create {ANY}
	make, from_external_pointer_no_ref, from_external_pointer,
	from_file, from_file_at_size, from_file_at_scale,
	from_drawable, from_pixbuf, from_data

feature {} -- Creation

	from_pixbuf (other: like Current)
		require
			other_not_void: other /= Void
		local
			pixbuf_ptr: POINTER
		do
			pixbuf_ptr := gdk_pixbuf_copy (other.handle)
			if pixbuf_ptr.is_not_null then
				from_external_pointer_no_ref (pixbuf_ptr)
			else
				set_handle (invalid_pixbuf_handle)
			end
		end

	from_file (filename: STRING)
			-- New pixbuf by loading an image from `filename'.
			-- The file format is detected automatically. 
		require
			filename /= Void
		local
			error_ptr, pixbuf_ptr: POINTER
		do
			pixbuf_ptr := gdk_pixbuf_new_from_file (filename.to_external, $error_ptr)
			if error_ptr.is_not_null then
				create last_error.from_external_pointer (error_ptr)
				set_handle (invalid_pixbuf_handle)
			elseif pixbuf_ptr.is_not_null then
				from_external_pointer_no_ref (pixbuf_ptr)
			else
				-- No error reported, but no pixbuf either :(
				std_error.put_string (once "invalid gdk_pixbuf")
				set_handle (invalid_pixbuf_handle)
			end
		end

	from_data (some_data: POINTER; an_alpha: BOOLEAN; a_bits_per_sample, a_width, a_height, a_rowstride: INTEGER)
			-- Creates a new GdkPixbuf out of in-memory image data. Currently
			-- only RGB images with 8 bits per sample are supported.
		local
			pixbuf_ptr: POINTER
		do
			pixbuf_ptr := gdk_pixbuf_new_from_data (some_data, gdk_colorspace_rgb, an_alpha.to_integer,
																 a_bits_per_sample, a_width, a_height,
																 a_rowstride, default_pointer, default_pointer)
			if pixbuf_ptr.is_not_null then
				from_external_pointer_no_ref (pixbuf_ptr)
			else
				-- No error reported, but no pixbuf either :(
				std_error.put_string (once "invalid gdk_pixbuf")
				set_handle (invalid_pixbuf_handle)
			end
		end

	from_file_at_size (filename: STRING; a_width, a_height: INTEGER)
			-- New pixbuf by loading an image from `filename'.
			-- The file format is detected automatically.
			-- The image will be scaled to fit in a `a_width'x`a_height' area
			-- preserving the image's aspect ratio.
			-- `a_width ' and `a_height' can be -1 to avoid constraining that dimension
		require
			a_width >= -1
			a_height >= -1
			filename /= Void
		local
			pixbuf_ptr, error_ptr: POINTER
		do
			pixbuf_ptr := gdk_pixbuf_new_from_file_at_size (filename.to_external,
																			a_width, a_height, $error_ptr)
			if error_ptr.is_not_null then
				create last_error.from_external_pointer (error_ptr)
				set_handle (invalid_pixbuf_handle)
			elseif pixbuf_ptr.is_not_null then
				from_external_pointer_no_ref (pixbuf_ptr)
			else
				-- No error reported, but no pixbuf either :(
				std_error.put_string (once "invalid gdk_pixbuf")
				set_handle (invalid_pixbuf_handle)
			end
		end

	from_file_at_scale (filename: STRING; a_width, a_height: INTEGER; preserve_aspect_ration: BOOLEAN)
			-- Creates a new pixbuf by loading an image from a file. The file
			-- format is detected automatically. The image will be scaled to
			-- fit in the requested size, optionally preserving the image's
			-- aspect ratio.
			--
			-- When preserving the aspect ratio, a width of -1 will cause the
			-- image to be scaled to the exact given height, and a height of -1
			-- will cause the image to be scaled to the exact given width. When
			-- not preserving aspect ratio, a width or height of -1 means to
			-- not scale the image at all in that dimension. Negative values
			-- for width and height are allowed since 2.8.
		require
			filename /= Void
		local
			pixbuf_ptr, error_ptr: POINTER
		do
			pixbuf_ptr := gdk_pixbuf_new_from_file_at_scale (filename.to_external, a_width, a_height,
																			 preserve_aspect_ration.to_integer, $error_ptr)
			if error_ptr.is_not_null then
				create last_error.from_external_pointer (error_ptr)
				set_handle (invalid_pixbuf_handle)
			elseif pixbuf_ptr.is_not_null then
				from_external_pointer_no_ref (pixbuf_ptr)
			else
				std_error.put_string (once "invalid gdk_pixbuf")
				-- No error reported, but no pixbuf either :(
				set_handle (invalid_pixbuf_handle)
			end
		end

	from_drawable (a_drawable: GDK_DRAWABLE; src_x, src_y, a_width, a_height: INTEGER)
		require
			a_drawable /= Void
		local
			pixbuf_ptr: POINTER
		do
			pixbuf_ptr := gdk_pixbuf_get_from_drawable (default_pointer, a_drawable.handle,
																	  default_pointer, src_x, src_y,
																	  0, 0, a_width, a_height)
			if pixbuf_ptr.is_not_null then
				from_external_pointer_no_ref (pixbuf_ptr)
			else
				std_error.put_string (once "invalid gdk_pixbuf")
				-- No error reported, but no pixbuf either :(
				set_handle (invalid_pixbuf_handle)
			end
		end

	make (a_alpha: BOOLEAN; a_width, a_height: INTEGER)
		-- Creates a new GdkPixbuf structure and allocates a buffer for it.
		-- The buffer has an optimal rowstride. Note that the buffer is not
		-- cleared; you will have to fill it completely yourself.
		require
			a_width >= 0
			a_height >= 0
		local
			pixbuf_ptr: POINTER
		do
			pixbuf_ptr := gdk_pixbuf_new(gdk_colorspace_rgb, a_alpha.to_integer, 8, a_width, a_height)
			if pixbuf_ptr.is_not_null then
				from_external_pointer_no_ref (pixbuf_ptr)
			else
				set_handle (invalid_pixbuf_handle)
			end
		end

feature {ANY} -- Access

	last_error: G_ERROR

	width: INTEGER
			-- The number of columns of the pixbuf.
			-- Default value: 1
		do
			Result := gdk_pixbuf_get_width (handle)
		end

	height: INTEGER
			-- The number of rows of the pixbuf.
			-- Default value: 1
		do
			Result := gdk_pixbuf_get_height (handle)
		end

feature {ANY} -- Operations

	render_pixmap_and_mask (alpha_threshold: INTEGER): TUPLE[GDK_PIXMAP, GDK_BITMAP]
			-- Creates a pixmap and a mask bitmap, and renders a pixbuf
			-- and its corresponding thresholded alpha mask to them.
			-- This is merely a convenience function; applications that
			-- need to render pixbufs with dither offsets or to given
			-- drawables should use `draw_pixbuf' and `render_threshold_alpha'.
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

	fill (a_pixel: INTEGER)
			-- Clears a pixbuf to the given RGBA value,
			-- converting the RGBA value into the pixbuf's pixel format.
			-- The alpha will be ignored if the pixbuf doesn't have
			-- an alpha channel.
			--
			-- a_pixel: RGBA pixel to clear to (0xffffffff is opaque white, 0x00000000 transparent black)
		do
			gdk_pixbuf_fill (handle, a_pixel)
		end

	add_alpha (a_substitute_color: BOOLEAN; a_red, a_green, a_blue: INTEGER): GDK_PIXBUF
			-- Takes an existing pixbuf and adds an alpha channel to it.
			-- If the existing pixbuf already had an alpha channel, the channel
			-- values are copied from the original; otherwise, the alpha channel
			-- is initialized to 255 (full opacity).
			-- If a_substitute_color is True, then the color specified by (a_red, a_green, a_blue)
			-- will be assigned zero opacity. That is, if you pass (255, 255, 255) for the substitute color,
			-- all white pixels will become fully transparent.
			--
			-- a_substitute_color: Whether to set a color to zero opacity.
			--      If this is False, then the (r, g, b) arguments will be ignored.
			-- a_red: Red value to substitute.
			-- a_green: Green value to substitute.
			-- a_blue: Blue value to substitute.
			-- Returns: A newly-created pixbuf with a reference count of 1.
		require
			red_is_valid: a_red.in_range (0, 255)
			green_is_valid: a_green.in_range (0, 255)
			blue_is_valid: a_blue.in_range (0, 255)
		local
			pixbuf_ptr: POINTER
		do
			pixbuf_ptr := gdk_pixbuf_add_alpha (handle,
															a_substitute_color, a_red.to_character,
															a_green.to_character, a_blue.to_character)
			if pixbuf_ptr.is_not_null then
				create Result.from_external_pointer_no_ref (pixbuf_ptr)
			end
		end

	save_jpeg_with_quality (a_filename: STRING; a_quality: INTEGER)
			-- Saves pixbuf to a file in JPEG format, with the provided
			-- quality.
		require
			a_filename /= Void
			a_quality.in_range (0, 100)
		local
			error: BOOLEAN
		do
			error := gdk_pixbuf_save_with_one_arg (handle, a_filename.to_external, "jpeg".to_external,
												default_pointer, "quality".to_external, a_quality.to_string.to_external, default_pointer).to_boolean
			if error then
				debug print (once "Error saving pixbuf!%N") end
			end
		end

	save (a_filename, a_type: STRING)
			-- Saves pixbuf to a file in type, which is currently
			-- "jpeg", "png", "tiff", "ico" or "bmp".
		require
			a_filename /= Void
			a_type /= Void
			(a_type.is_equal (once "jpeg") or a_type.is_equal (once "png") or
			 a_type.is_equal (once "tiff") or a_type.is_equal (once "ico") or a_type.is_equal (once "bmp"))
		local
			error: BOOLEAN
		do
			error := gdk_pixbuf_savev (handle, a_filename.to_external, a_type.to_external,
												default_pointer, default_pointer, default_pointer).to_boolean
			if error then
				debug print (once "Error saving pixbuf!%N") end
			end
		end

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

feature {ANY} -- Properties

	bits_per_sample: INTEGER
		do
			Result := gdk_pixbuf_get_bits_per_sample (handle)
		end

	colorspace: INTEGER
		do
			Result := gdk_pixbuf_get_colorspace (handle)
		end

	has_alpha: BOOLEAN
		do
			Result := gdk_pixbuf_get_has_alpha (handle).to_boolean
		end

	n_channels: INTEGER
		do
			Result := gdk_pixbuf_get_n_channels (handle)
		end

	pixels: POINTER
			-- A pointer to the pixel data of the pixbuf.
		do
			Result := gdk_pixbuf_get_pixels (handle)
		end

	pixel_rgb (a_row, a_col: INTEGER): TUPLE [INTEGER, INTEGER, INTEGER]
		require
			not has_alpha
			a_row.in_range (0, height - 1)
			a_col.in_range (0, width - 1)
		local
			packed: INTEGER_32
		do
			packed := gdk_pixbuf_get_pixel (handle, a_row, a_col)
			Result := [packed & 0x000000ff, (packed & 0x0000ff00) |>>> 8, (packed & 0x00ff0000) |>>> 16]
		end

	set_pixel_rgb (a_row, a_col, a_red, a_green, a_blue: INTEGER)
		require
			not has_alpha
			a_row.in_range (0, height - 1)
			a_col.in_range (0, width - 1)
			a_red.in_range (0, 255)
			a_green.in_range (0, 255)
			a_blue.in_range (0, 255)
		do
			gdk_pixbuf_set_pixel_byte (handle, a_row, a_col, 0, a_red)
			gdk_pixbuf_set_pixel_byte (handle, a_row, a_col, 1, a_green)
			gdk_pixbuf_set_pixel_byte (handle, a_row, a_col, 2, a_blue)
		end

	rowstride: INTEGER
			-- The number of bytes between the start of a row and the
			-- start of the next row. This number must (obviously) be
			-- at least as large as the width of the pixbuf.
		do
			Result := gdk_pixbuf_get_rowstride (handle)
		end

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
-- The "n-channels" property
-- 
--   "n-channels"           gint                  : Read / Write / Construct Only
-- 
-- The number of samples per pixel. Currently, only 3 or 4 samples per pixel are supported.
-- 
-- Allowed values: >= 0
-- 
-- Default value: 3

feature {ANY} -- Disposing

	dispose
		do
			if is_valid then
				Precursor
			else
				handle := default_pointer
			end
		end

	store_eiffel_wrapper
		do
			g_object_set_qdata (handle, eiffel_key.quark, to_pointer)
			-- g_object_class := g_object_get_class (handle)
		end

	unstore_eiffel_wrapper
		do
			g_object_set_qdata (handle, eiffel_key.quark, default_pointer)
		end

feature {ANY} -- Error reporting

	is_valid: BOOLEAN
		do
			Result := handle /= invalid_pixbuf_handle
		end

feature {} -- Error reporting

	invalid_pixbuf: GDK_PIXBUF
			-- Pointer to a 1x1 opaque pixbuf
		once
			create Result.make (False, 1, 1)
		end

	invalid_pixbuf_handle: POINTER
		once
			Result := invalid_pixbuf.handle
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkPixbuf)"
		end

feature {ANY} -- Scaling

	scale_simple (a_width, a_height, a_interp_type: INTEGER): GDK_PIXBUF
			-- Create a new GDK_PIXBUF containing a copy of Current scaled to
			-- (a_width x a_height). Leaves Current unaffected. a_interp_type
			-- should be gdk_interp_nearest if you want maximum speed (but
			-- when scaling down gdk_interp_nearest is usually unusably ugly).
			-- The default interp_type should be gdk_interp_bilinear which
			-- offers reasonable quality and speed.
			--
			-- You can scale a sub-portion of src by creating a sub-pixbuf
			-- pointing into src; see new_subpixbuf().
			--
			-- For more complicated scaling/compositing see `scale (...)' and
			-- `composite (...)'.
		require
			is_valid_gdk_interp_type (a_interp_type)
		local
			ptr: POINTER
		do
			if is_valid then
				ptr := gdk_pixbuf_scale_simple (handle, a_width, a_height, a_interp_type)
				if ptr.is_not_null then create Result.from_external_pointer_no_ref (ptr) end
			end
			if Result = Void then Result := invalid_pixbuf end
		ensure
			Result /= Void
		end

	scale (other: GDK_PIXBUF; dest_x, dest_y, dest_width, dest_height: INTEGER;
			 offset_x, offset_y, scale_x, scale_y: REAL_64; interp_type: INTEGER)
			-- Creates a transformation of the Current image by scaling by
			-- scale_x and scale_y then translating by offset_x and offset_y,
			-- then renders the rectangle (dest_x, dest_y, dest_width, dest_height)
			-- of the resulting image onto `other' replacing the previous contents.
			--
			-- Try to use scale_simple() first, this function is the
			-- industrial-strength power tool you can fall back to if
			-- scale_simple() isn't powerful enough.
			--
			-- other :       the GDK_PIXBUF into which to render the results
			-- dest_x :	     the left coordinate for region to render
			-- dest_y :      the top coordinate for region to render
			-- dest_width :  the width of the region to render
			-- dest_height : the height of the region to render
			-- offset_x :    the offset in the X direction (currently rounded to an integer)
			-- offset_y :    the offset in the Y direction (currently rounded to an integer)
			-- scale_x :     the scale factor in the X direction
			-- scale_y :     the scale factor in the Y direction
			-- interp_type : the interpolation type for the transformation.
		require
			is_valid_gdk_interp_type (interp_type)
		do
			if not is_valid then
				other.dispose
				other.set_handle (invalid_pixbuf_handle)
			end
			if other.is_valid then
				gdk_pixbuf_scale (handle, other.handle, dest_x, dest_y, dest_width, dest_height, offset_x, offset_y, scale_x, scale_y, interp_type)
			end
		end

	composite_color_simple (dest_width, dest_height: INTEGER; interp_type: INTEGER;
									overall_alpha, check_size: INTEGER; color1, color2: INTEGER_64) : GDK_PIXBUF
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
			if is_valid then
				res := gdk_pixbuf_composite_color_simple (handle, dest_width, dest_height, interp_type,
				                                          overall_alpha, check_size, color1, color2)
				if res.is_not_null then create Result.from_external_pointer_no_ref (res) end
			end
			if Result = Void then Result := invalid_pixbuf end
		ensure
			Result /= Void
		end

	composite (dest: GDK_PIXBUF; dest_x, dest_y, dest_width, dest_height: INTEGER;
				  offset_x, offset_y, scale_x, scale_y: REAL_64;
				  interp_type: INTEGER; overall_alpha: INTEGER)
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
		local
			x, y, w, h: INTEGER
		do
			if not is_valid then
				dest.dispose
				dest.set_handle (invalid_pixbuf_handle)
			end
			if dest.is_valid then
				x := dest_x
				y := dest_y
				w := dest_width
				h := dest_height
				if x < 0 then
					w := w + x
					x := 0
				end
				if y < 0 then
					h := h + y
					y := 0
				end
				if x + w > dest.width then
					w := dest.width - x
				end
				if y + h > dest.height then
					h := dest.height - y
				end
				gdk_pixbuf_composite (handle, dest.handle, x, y, w, h, offset_x, offset_y,
				                      scale_x, scale_y, interp_type, overall_alpha)
			end
		end

	composite_color (dest: GDK_PIXBUF; dest_x, dest_y, dest_width, dest_height: INTEGER;
	                 offset_x, offset_y, scale_x, scale_y: REAL_64;
	                 interp_type: INTEGER; overall_alpha, check_x, check_y, check_size: INTEGER;
	                 color1, color2: INTEGER_64)
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
			if not is_valid then
				dest.dispose
				dest.set_handle (invalid_pixbuf_handle)
			end
			if dest.is_valid then
				gdk_pixbuf_composite_color (handle, dest.handle, dest_x, dest_y, dest_width, dest_height,
				                            offset_x, offset_y, scale_x, scale_y, interp_type,
				                            overall_alpha, check_x, check_y, check_size, color1, color2)
			end
		end

invariant
	handle.is_not_null

end -- GDK_PIXBUF
