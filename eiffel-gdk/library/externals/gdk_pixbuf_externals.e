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

insert GDK_INTERP_TYPE

feature {NONE} -- External calls

	gdk_pixbuf_copy (pixbuf: POINTER): POINTER is
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

	gdk_pixbuf_new_from_file (filename, error: POINTER): POINTER is
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

	gdk_pixbuf_new_from_file_at_size (filename: POINTER; a_width, a_height: INTEGER;
	                                  error: POINTER): POINTER is
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

	gdk_pixbuf_new_from_file_at_scale (filename: POINTER; a_width, a_height, preserve_aspect_ratio: INTEGER;
	                                   error_dummy: POINTER): POINTER is
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

	gdk_pixbuf_new (a_colorspace, a_alpha, a_bps, a_width, a_height: INTEGER): POINTER is
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

	gdk_pixbuf_render_pixmap_and_mask (handle, pixmap_return, bitmap_return: POINTER; alpha_threshold: INTEGER) is
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

	gdk_pixbuf_composite_color_simple (src: POINTER; dest_width, dest_height: INTEGER; interp_type: INTEGER;
	                                   overall_alpha, check_size: INTEGER; color1, color2: INTEGER_64) : POINTER is
			-- GdkPixbuf*  gdk_pixbuf_composite_color_simple (const GdkPixbuf *src,
			--                                                int dest_width,
			--                                                int dest_height,
			--                                                GdkInterpType interp_type,
			--                                                int overall_alpha,
			--                                                int check_size,
			--                                                guint32 color1,
			--                                                guint32 color2);
			-- src :   a GdkPixbuf
			-- dest_width :    the width of destination image
			-- dest_height :   the height of destination image
			-- interp_type :   the interpolation type for the transformation.
			-- overall_alpha :     overall alpha for source image (0..255)
			-- check_size :    the size of checks in the checkboard (must be a power of two)
			-- color1 :    the color of check at upper left
			-- color2 :    the color of the other check
			-- Returns :   the new GdkPixbuf, or NULL if not enough memory could be allocated for it.
		require is_valid_gdk_interp_type (interp_type)
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

	gdk_pixbuf_composite (src, dest: POINTER; dest_x, dest_y, dest_width, dest_height: INTEGER;
	                      offset_x, offset_y, scale_x, scale_y: REAL_64;
	                      interp_type: INTEGER; overall_alpha: INTEGER) is
			-- void        gdk_pixbuf_composite            (const GdkPixbuf *src,
			--                                              GdkPixbuf *dest,
			--                                              int dest_x,
			--                                              int dest_y,
			--                                              int dest_width,
			--                                              int dest_height,
			--                                              double offset_x,
			--                                              double offset_y,
			--                                              double scale_x,
			--                                              double scale_y,
			--                                              GdkInterpType interp_type,
			--                                              int overall_alpha);
			-- src :    a GdkPixbuf
			-- dest :  the GdkPixbuf into which to render the results
			-- dest_x :    the left coordinate for region to render
			-- dest_y :    the top coordinate for region to render
			-- dest_width :    the width of the region to render
			-- dest_height :   the height of the region to render
			-- offset_x :  the offset in the X direction (currently rounded to an integer)
			-- offset_y :  the offset in the Y direction (currently rounded to an integer)
			-- scale_x :   the scale factor in the X direction
			-- scale_y :   the scale factor in the Y direction
			-- interp_type :   the interpolation type for the transformation.
			-- overall_alpha :     overall alpha for source image (0..255)
		require is_valid_gdk_interp_type (interp_type)
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

	gdk_pixbuf_composite_color (src, dest: POINTER; dest_x, dest_y, dest_width, dest_height: INTEGER;
	                            offset_x, offset_y, scale_x, scale_y: REAL_64;
	                            interp_type: INTEGER; overall_alpha, check_x, check_y, check_size: INTEGER;
	                            color1, color2: INTEGER_64) is
			-- void        gdk_pixbuf_composite_color      (const GdkPixbuf *src,
			--                                              GdkPixbuf *dest,
			--                                              int dest_x,
			--                                              int dest_y,
			--                                              int dest_width,
			--                                              int dest_height,
			--                                              double offset_x,
			--                                              double offset_y,
			--                                              double scale_x,
			--                                              double scale_y,
			--                                              GdkInterpType interp_type,
			--                                              int overall_alpha,
			--                                              int check_x,
			--                                              int check_y,
			--                                              int check_size,
			--                                              guint32 color1,
			--                                              guint32 color2);
			-- src : 	 a GdkPixbuf
			-- dest : 	the GdkPixbuf into which to render the results
			-- dest_x : 	the left coordinate for region to render
			-- dest_y : 	the top coordinate for region to render
			-- dest_width : 	the width of the region to render
			-- dest_height : 	the height of the region to render
			-- offset_x : 	the offset in the X direction (currently rounded to an integer)
			-- offset_y : 	the offset in the Y direction (currently rounded to an integer)
			-- scale_x : 	the scale factor in the X direction
			-- scale_y : 	the scale factor in the Y direction
			-- interp_type : 	the interpolation type for the transformation.
			-- overall_alpha : 	overall alpha for source image (0..255)
			-- check_x : 	the X offset for the checkboard (origin of checkboard is at -check_x, -check_y)
			-- check_y : 	the Y offset for the checkboard
			-- check_size : 	the size of checks in the checkboard (must be a power of two)
			-- color1 : 	the color of check at upper left
			-- color2 : 	the color of the other check
		require is_valid_gdk_interp_type (interp_type)
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end

	gdk_pixbuf_get_from_drawable (a_pixbuf, a_drawable, a_colormap: POINTER;
				 src_x, src_y, dest_x, dest_y, a_width, a_height: INTEGER): POINTER is
		external "C use <gdk-pixbuf/gdk-pixbuf.h>"
		end


end -- class GDK_PIXBUF_EXTERNALS
