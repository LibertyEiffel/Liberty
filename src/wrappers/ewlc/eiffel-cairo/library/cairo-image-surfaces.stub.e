note
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "1.2.4"

class FOO

inherit
	(SHARED_?)C_STRUCT

insert
	FOO_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	--   Link: Cairo: A Vector Graphics Library (start)
	--   Link: Surfaces (parent)
	--   Link: cairo_surface_t (previous)
	--   Link: PDF Surfaces (next)
	--   Link: Part I. Tutorial (part)
	--   Link: Part II. Reference (part)
	--   Link: Drawing (chapter)
	--   Link: Fonts (chapter)
	--   Link: Surfaces (chapter)
	--   Link: Utilities (chapter)
	--   Link: Index (index)
	--   Link: Index of new symbols in 1.2 (index)
	--   Link: Appendix A. Creating a language binding for cairo (appendix)
	--
	--   Prev Up Home             Cairo: A Vector Graphics Library             Next
	--   Top  |  Description
	--
	--   Image Surfaces
	--
	--   Image Surfaces -- Rendering to memory buffers
	--
	--Synopsis
	--
	--
	--
	--
	-- enum        cairo_format_t;
	-- cairo_surface_t* cairo_image_surface_create (cairo_format_t format,
	--                                              int width,
	--                                              int height);
	-- cairo_surface_t* cairo_image_surface_create_for_data
	--                                             (unsigned char *data,
	--                                              cairo_format_t format,
	--                                              int width,
	--                                              int height,
	--                                              int stride);
	-- unsigned char* cairo_image_surface_get_data (cairo_surface_t *surface);
	-- cairo_format_t cairo_image_surface_get_format
	--                                             (cairo_surface_t *surface);
	-- int         cairo_image_surface_get_width   (cairo_surface_t *surface);
	-- int         cairo_image_surface_get_height  (cairo_surface_t *surface);
	-- int         cairo_image_surface_get_stride  (cairo_surface_t *surface);
	--
	--Description
	--
	--   Image surfaces provide the ability to render to memory buffers either
	--   allocated by cairo or by the calling code. The supported image formats are
	--   those defined in cairo_format_t.
	--
	--Details
	--
	--  enum cairo_format_t
	--
	-- typedef enum _cairo_format {
	--     CAIRO_FORMAT_ARGB32,
	--     CAIRO_FORMAT_RGB24,
	--     CAIRO_FORMAT_A8,
	--     CAIRO_FORMAT_A1,
	--     CAIRO_FORMAT_RGB16_565
	-- } cairo_format_t;
	--
	--   cairo_format_t is used to identify the memory format of image data.
	--
	--   New entries may be added in future versions.
	--
	--   CAIRO_FORMAT_ARGB32    each pixel is a 32-bit quantity, with alpha in the
	--                          upper 8 bits, then red, then green, then blue. The
	--                          32-bit quantities are stored native-endian.
	--                          Pre-multiplied alpha is used. (That is, 50%
	--                          transparent red is 0x80800000, not 0x80ff0000.)
	--   CAIRO_FORMAT_RGB24     each pixel is a 32-bit quantity, with the upper 8
	--                          bits unused. Red, Green, and Blue are stored in the
	--                          remaining 24 bits in that order.
	--   CAIRO_FORMAT_A8        each pixel is a 8-bit quantity holding an alpha
	--                          value.
	--   CAIRO_FORMAT_A1        each pixel is a 1-bit quantity holding an alpha
	--                          value. Pixels are packed together into 32-bit
	--                          quantities. The ordering of the bits matches the
	--                          endianess of the platform. On a big-endian machine,
	--                          the first pixel is in the uppermost bit, on a
	--                          little-endian machine the first pixel is in the
	--                          least-significant bit.
	--   CAIRO_FORMAT_RGB16_565 This format value is deprecated. It has never been
	--                          properly implemented in cairo and should not be
	--                          used by applications. For example, any attempt to
	--                          create an image surface with a format of
	--                          CAIRO_FORMAT_RGB16_565 will fail. This format value
	--                          was added as part of fixing cairo's xlib backend to
	--                          work with X servers advertising a 16-bit, 565
	--                          visual. But as it turned out, adding this format to
	--                          cairo_format_t was not necessary, and was a
	--                          mistake, (cairo's xlib backend can work fine with
	--                          16-bit visuals in the same way it works with BGR
	--                          visuals without any BGR formats in cairo_format_t).
	--                          (Since 1.2)
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_image_surface_create ()
	--
	-- cairo_surface_t* cairo_image_surface_create (cairo_format_t format,
	--                                              int width,
	--                                              int height);
	--
	--   Creates an image surface of the specified format and dimensions. Initially
	--   the surface contents are all 0. (Specifically, within each pixel, each
	--   color or alpha channel belonging to format will be 0. The contents of bits
	--   within a pixel, but not belonging to the given format are undefined).
	--
	--   format :  format of pixels in the surface to create
	--   width :   width of the surface, in pixels
	--   height :  height of the surface, in pixels
	--   Returns : a pointer to the newly created surface. The caller owns the
	--             surface and should call cairo_surface_destroy when done with it.
	--             This function always returns a valid pointer, but it will return
	--             a pointer to a "nil" surface if an error such as out of memory
	--             occurs. You can use cairo_surface_status() to check for this.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_image_surface_create_for_data ()
	--
	-- cairo_surface_t* cairo_image_surface_create_for_data
	--                                             (unsigned char *data,
	--                                              cairo_format_t format,
	--                                              int width,
	--                                              int height,
	--                                              int stride);
	--
	--   Creates an image surface for the provided pixel data. The output buffer
	--   must be kept around until the cairo_surface_t is destroyed or
	--   cairo_surface_finish() is called on the surface. The initial contents of
	--   buffer will be used as the inital image contents; you must explicitely
	--   clear the buffer, using, for example, cairo_rectangle() and cairo_fill()
	--   if you want it cleared.
	--
	--   data :    a pointer to a buffer supplied by the application in which to
	--             write contents.
	--   format :  the format of pixels in the buffer
	--   width :   the width of the image to be stored in the buffer
	--   height :  the height of the image to be stored in the buffer
	--   stride :  the number of bytes between the start of rows in the buffer.
	--             Having this be specified separate from width allows for padding
	--             at the end of rows, or for writing to a subportion of a larger
	--             image.
	--   Returns : a pointer to the newly created surface. The caller owns the
	--             surface and should call cairo_surface_destroy when done with it.
	--             This function always returns a valid pointer, but it will return
	--             a pointer to a "nil" surface if an error such as out of memory
	--             occurs. You can use cairo_surface_status() to check for this.
	--             See cairo_surface_set_user_data() for a means of attaching a
	--             destroy-notification fallback to the surface if necessary.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_image_surface_get_data ()
	--
	-- unsigned char* cairo_image_surface_get_data (cairo_surface_t *surface);
	--
	--   Get a pointer to the data of the image surface, for direct inspection or
	--   modification.
	--
	--   surface : a cairo_image_surface_t
	--   Returns : a pointer to the image data of this surface or NULL if surface
	--             is not an image surface.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_image_surface_get_format ()
	--
	-- cairo_format_t cairo_image_surface_get_format
	--                                             (cairo_surface_t *surface);
	--
	--   Get the format of the surface.
	--
	--   surface : a cairo_image_surface_t
	--   Returns : the format of the surface
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_image_surface_get_width ()
	--
	-- int         cairo_image_surface_get_width   (cairo_surface_t *surface);
	--
	--   Get the width of the image surface in pixels.
	--
	--   surface : a cairo_image_surface_t
	--   Returns : the width of the surface in pixels.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_image_surface_get_height ()
	--
	-- int         cairo_image_surface_get_height  (cairo_surface_t *surface);
	--
	--   Get the height of the image surface in pixels.
	--
	--   surface : a cairo_image_surface_t
	--   Returns : the height of the surface in pixels.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_image_surface_get_stride ()
	--
	-- int         cairo_image_surface_get_stride  (cairo_surface_t *surface);
	--
	--   Get the stride of the image surface in bytes
	--
	--   surface : a cairo_image_surface_t
	--   Returns : the stride of the image surface in bytes (or 0 if surface is not
	--             an image surface). The stride is the distance in bytes from the
	--             beginning of one row of the image data to the beginning of the
	--             next row.
	--
	--   Since 1.2

end -- class FOO
