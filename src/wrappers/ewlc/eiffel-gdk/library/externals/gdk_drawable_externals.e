note
	description: "External calls for GdkDrawable"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

deferred class GDK_DRAWABLE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gdk_cairo_create (a_drawable : POINTER) : POINTER
    external "C use <gdk/gdk.h>"
    end


	gdk_drawable_get_display (a_gdkdrawable: POINTER): POINTER is -- GdkDisplay*
		external "C use <gdk/gdk.h>"
		end

	gdk_drawable_get_screen (a_gdkdrawable: POINTER): POINTER is -- GdkScreen*
		external "C use <gdk/gdk.h>"
		end

	gdk_drawable_get_visual (a_gdkdrawable: POINTER): POINTER is -- GdkVisual*
		external "C use <gdk/gdk.h>"
		end

	gdk_drawable_set_colormap (a_gdkdrawable, a_gdkcolormap: POINTER)
		external "C use <gdk/gdk.h>"
		end

	gdk_drawable_get_colormap (a_gdkdrawable: POINTER): POINTER is -- GdkColormap*
		external "C use <gdk/gdk.h>"
		end

	gdk_drawable_get_depth (a_gdkdrawable: POINTER): INTEGER is -- gint
		external "C use <gdk/gdk.h>"
		end

	gdk_drawable_get_size (a_gdkdrawable, gint_width, gint_height: POINTER)
		external "C use <gdk/gdk.h>"
		end

	gdk_drawable_get_clip_region (a_gdkdrawable: POINTER): POINTER is -- GdkRegion*
		external "C use <gdk/gdk.h>"
		end

	gdk_drawable_get_visible_region (a_gdkdrawable: POINTER): POINTER is -- GdkRegion*
		external "C use <gdk/gdk.h>"
		end
	

	gdk_draw_point (a_gdkdrawable, a_gdk_gc: POINTER; an_x, an_y: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_points (a_gdkdrawable, a_gdkgc, some_points: POINTER;  npoints: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_line (a_gdkdrawable, a_gdk_gc: POINTER; an_x1, an_y1, an_x2, an_y2: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_lines (a_gdkdrawable, a_gdk_gc: POINTER; some_gdk_points: POINTER; npoints: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_pixbuf (a_gdkdrawable, a_gdk_gc, a_gdkpixbuf: POINTER;
	                 src_x, src_y, dest_x, dest_y, a_width, an_height: INTEGER;
	                 gdkrgbdither: INTEGER; x_dither, y_dither: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_segments (a_gdkdrawable, a_gdk_gc, some_gdksegment: POINTER; nsegs: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_rectangle (a_gdkdrawable, a_gdk_gc: POINTER; gboolean_filled: INTEGER;
	                    an_x, an_y, a_width, an_height: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_arc (a_gdkdrawable, a_gdk_gc: POINTER; a_filled, an_x, an_y,
					a_width, a_height, angle1, angle2: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_polygon (a_gdkdrawable, a_gdk_gc: POINTER; boolean_filled: INTEGER; some_gdkpoint: POINTER; npoints: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_trapezoids (a_gdkdrawable, a_gdk_gc, some_gdktrapezoid: POINTER; n_trapezoids: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_glyphs (a_gdkdrawable, a_gdk_gc, a_pangofont: POINTER; an_x, an_y: INTEGER; some_pangoglyphstring: POINTER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_glyphs_transformed (a_gdkdrawable, a_gdk_gc, a_pangomatrix, a_pangofont: POINTER; an_x, an_y: INTEGERM; some_pangoglyphstring: POINTER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_layout_line (a_gdkdrawable, a_gdk_gc: POINTER; an_x, an_y: INTEGER; a_pangolayoutline: POINTER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_layout_line_with_colors (a_gdkdrawable, a_gdk_gc: POINTER; an_x, an_y: INTEGER; a_pangolayoutline, a_const_gdkcolor_foreground, const_gdkcolor_background: POINTER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_layout (a_gdkdrawable, a_gdk_gc: POINTER; an_x, an_y: INTEGER; a_pangolayout: POINTER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_layout_with_colors (a_gdkdrawable, a_gdk_gc: POINTER; an_x, an_y: INTEGER; a_pangolayout, const_gdkcolor_foreground, const_gdkcolor_background: POINTER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_drawable (a_gdkdrawable, a_gdk_gc, a_src_gdkdrawable: POINTER; a_xsrc, a_ysrc, a_xdest, a_ydest, a_width, an_height: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_draw_image (a_gdkdrawable, a_gdk_gc, a_gdkimage: POINTER; a_xsrc, a_ysrc, a_xdest, a_ydest, a_width, an_height: INTEGER)
		external "C use <gdk/gdk.h>"
		end

	gdk_drawable_get_image (a_gdkdrawable: POINTER; an_x, an_y, a_width, an_height: INTEGER): POINTER is -- GdkImage*
		external "C use <gdk/gdk.h>"
		end

	gdk_drawable_copy_to_image (a_gdkdrawable, a_gdkimage: POINTER; a_src_x, a_src_y, a_dest_x, a_dest_y, a_width, an_height: INTEGER): POINTER is -- GdkImage*
		external "C use <gdk/gdk.h>"
		end

end -- class GDK_DRAWABLE_EXTERNALS
