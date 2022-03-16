note
	description: "GDK_DRAWABLE - Drawing Primitives ��Functions for drawing points, lines, arcs, and text."
	copyright: "[
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

deferred class GDK_DRAWABLE
	-- These functions provide support for drawing points, lines, arcs
	-- and text onto what are called 'drawables'. Drawables, as the
	-- name suggests, are things which support drawing onto them, and
	-- are either GdkWindow or GdkPixmap objects.

	-- Many of the drawing operations take a GdkGC argument, which
	-- represents a graphics context. This GdkGC contains a number of
	-- drawing attributes such as foreground color, background color
	-- and line width, and is used to reduce the number of arguments
	-- needed for each drawing operation. See the Graphics Contexts
	-- section for more information.

	-- Some of the drawing operations take Pango data structures like
	-- PangoContext, PangoLayout or PangoLayoutLine as arguments. If
	-- you're using GTK+, the ususal way to obtain these structures is
	-- via gtk_widget_create_pango_context() or
	-- gtk_widget_create_pango_layout().

inherit G_OBJECT

insert GDK_DRAWABLE_EXTERNALS

feature {ANY}
	context: CAIRO_CONTEXT
    	-- A (newly allocated) context for drawing to drawable. 
	do
    	create Result.from_external_pointer (handle)
		-- Note: A CAIRO_CONTEXT will automatically call cairo_destroy when
		-- disposed. In fact, since it is a REFERENCE_COUNTE when disposed. In
		-- fact, since it is a REFERENCE_COUNTED, its memory will be handled by
		-- SmartEiffel garbage collector.
  	end	
	


	-- TODO: display: GDK_DISPLAY is
	-- the GdkDisplay associated with a GdkDrawable.
	-- do
	-- create Result.from_external_pointer (gdk_drawable_get_display (handle))
	-- end
	
	-- TODO: screen: GDK_SCREEN is
	-- the GdkScreen associated with a GdkDrawable.
	-- do
	-- create Result.from_external_pointer (gdk_drawable_get_screen (handle))
	-- end
	
	-- TODO: visual: GDK_VISUAL is
	-- the GdkVisual describing the pixel format of drawable.
	-- do
	-- create Result.from_external_pointer (gdk_drawable_get_visual (handle))
	-- end

	-- TODO: gdk_drawable_set_colormap ()

	-- void        gdk_drawable_set_colormap       (GdkDrawable *drawable,
	--                                              GdkColormap *colormap);

	-- Sets the colormap associated with drawable. Normally this will happen automatically when the drawable is created; you only need to use this function if the drawable-creating function did not have a way to determine the colormap, and you then use drawable operations that require a colormap. The colormap for all drawables and graphics contexts you intend to use together should match. i.e. when using a GdkGC to draw to a drawable, or copying one drawable to another, the colormaps should match.

	-- drawable : 	a GdkDrawable
	-- colormap : 	a GdkColormap
	-- gdk_drawable_get_colormap ()

	-- GdkColormap* gdk_drawable_get_colormap      (GdkDrawable *drawable);

	-- Gets the colormap for drawable, if one is set; returns NULL otherwise.

	-- drawable : 	a GdkDrawable
	-- Returns : 	the colormap, or NULL

	depth: INTEGER
			-- the bit depth of the drawable, that is, the number of bits
			-- that make up a pixel in the drawable's visual. Examples
			-- are 8 bits per pixel, 24 bits per pixel, etc.
		do
			Result := gdk_drawable_get_depth (handle)
		end

	dimensions: TUPLE [INTEGER, INTEGER]
			-- width and height with the size of drawable. On the X11
			-- platform, if drawable is a GdkWindow, the returned size is
			-- the size reported in the most-recently-processed configure
			-- event, rather than the current size on the X server.
		local a_width, a_height: INTEGER
		do
			gdk_drawable_get_size (handle, $a_width, $a_height)
			create Result.make_2 (a_width, a_height)
		ensure not_void: Result /= Void
		end

	width: INTEGER
			-- width of the drawable. On the X11 platform, if drawable is
			-- a GdkWindow, the returned size is the size reported in the
			-- most-recently-processed configure event, rather than the
			-- current size on the X server.
		do
			gdk_drawable_get_size (handle, $Result, default_pointer)
		end

	height: INTEGER
			-- height of the drawable. On the X11 platform, if drawable is
			-- a GdkWindow, the returned size is the size reported in the
			-- most-recently-processed configure event, rather than the
			-- current size on the X server.
		do
			gdk_drawable_get_size (handle, default_pointer, $Result)
		end

	clip_region: GDK_REGION
			-- the region of a drawable that potentially can be written
			-- to by drawing primitives. This region will not take into
			-- account the clip region for the GC, and may also not take
			-- into account other factors such as if the window is
			-- obscured by other windows, but no area outside of this
			-- region will be affected by drawing primitives.
		do
			create Result.from_external_pointer (gdk_drawable_get_clip_region (handle))
		end

	visible_region: GDK_REGION
			-- the region of a drawable that is potentially visible. This
			-- does not necessarily take into account if the window is
			-- obscured by other windows, but no area outside of this
			-- region is visible.
		do
			create Result.from_external_pointer (gdk_drawable_get_visible_region (handle))
		end
	
	draw_point (a_gc: GDK_GC; an_x, an_y: INTEGER)
			-- Draws a point, using the foreground color and other
			-- attributes of the GDK_GC.
		do
			gdk_draw_point (handle, a_gc.handle, an_x, an_y)
		end

	-- gdk_draw_points ()

	-- void        gdk_draw_points                 (GdkDrawable *drawable,
	--                                              GdkGC *gc,
	--                                              GdkPoint *points,
	--                                              gint npoints);

	-- Draws a number of points, using the foreground color and other attributes of the GdkGC.

	-- drawable : 	a GdkDrawable (a GdkWindow or a GdkPixmap).
	-- gc : 	a GdkGC.
	-- points : 	an array of GdkPoint structures.
	-- npoints : 	the number of points to be drawn.

	draw_line (a_gc: GDK_GC; x1, y1, x2, y2: INTEGER)
			-- Draws a line, using the foreground color and other attributes
			-- of the GdkGC.
		do
			gdk_draw_line (handle, a_gc.handle, x1, y1, x2, y2)
		end

	-- gdk_draw_lines ()

	-- void        gdk_draw_lines                  (GdkDrawable *drawable,
	--                                              GdkGC *gc,
	--                                              GdkPoint *points,
	--                                              gint npoints);

	-- Draws a series of lines connecting the given points. The way in which joins between lines are draw is determined by the GdkCapStyle value in the GdkGC. This can be set with gdk_gc_set_line_attributes().

	-- drawable : 	a GdkDrawable (a GdkWindow or a GdkPixmap).
	-- gc : 	a GdkGC.
	-- points : 	an array of GdkPoint structures specifying the endpoints of the
	-- npoints : 	the size of the points array.
	-- gdk_draw_pixbuf ()

	-- void        gdk_draw_pixbuf                 (GdkDrawable *drawable,
	--                                              GdkGC *gc,
	--                                              GdkPixbuf *pixbuf,
	--                                              gint src_x,
	--                                              gint src_y,
	--                                              gint dest_x,
	--                                              gint dest_y,
	--                                              gint width,
	--                                              gint height,
	--                                              GdkRgbDither dither,
	--                                              gint x_dither,
	--                                              gint y_dither);

	-- Renders a rectangular portion of a pixbuf to a drawable. The destination drawable must have a colormap. All windows have a colormap, however, pixmaps only have colormap by default if they were created with a non-NULL window argument. Otherwise a colormap must be set on them with gdk_drawable_set_colormap().

	-- On older X servers, rendering pixbufs with an alpha channel involves round trips to the X server, and may be somewhat slow.

	-- The clip mask of gc is ignored, but clip rectangles and clip regions work fine.

	-- drawable : 	Destination drawable.
	-- gc : 	a GdkGC, used for clipping, or NULL
	-- pixbuf : 	a GdkPixbuf
	-- src_x : 	Source X coordinate within pixbuf.
	-- src_y : 	Source Y coordinates within pixbuf.
	-- dest_x : 	Destination X coordinate within drawable.
	-- dest_y : 	Destination Y coordinate within drawable.
	-- width : 	Width of region to render, in pixels, or -1 to use pixbuf width.
	-- height : 	Height of region to render, in pixels, or -1 to use pixbuf height.
	-- dither : 	Dithering mode for GdkRGB.
	-- x_dither : 	X offset for dither.
	-- y_dither : 	Y offset for dither.

	-- Since 2.2
	-- gdk_draw_segments ()

	-- void        gdk_draw_segments               (GdkDrawable *drawable,
	--                                              GdkGC *gc,
	--                                              GdkSegment *segs,
	--                                              gint nsegs);

	-- Draws a number of unconnected lines.

	-- drawable : 	a GdkDrawable (a GdkWindow or a GdkPixmap).
	-- gc : 	a GdkGC.
	-- segs : 	an array of GdkSegment structures specifying the start and end points of the lines to be drawn.
	-- nsegs : 	the number of line segments to draw, i.e. the size of the segs array.
	-- GdkSegment

	-- typedef struct {
	--   gint x1;
	--   gint y1;
	--   gint x2;
	--   gint y2;
	-- } GdkSegment;

	-- Specifies the start and end point of a line for use by the gdk_draw_segments() function.
	-- gint x1; 	the x coordinate of the start point.
	-- gint y1; 	the y coordinate of the start point.
	-- gint x2; 	the x coordinate of the end point.
	-- gint y2; 	the y coordinate of the end point.
	-- gdk_draw_rectangle ()

	draw_rectangle (a_gc: GDK_GC; filled: BOOLEAN; an_x, an_y, a_width, a_height: INTEGER)
			-- Draws a rectangular outline or filled rectangle, using the
			-- foreground color and other attributes of the GdkGC.
			--
			-- A rectangle drawn filled is 1 pixel smaller in both dimensions than
			-- a rectangle outlined. Calling draw_rectangle (gc, True, 0, 0, 20, 20)
			-- results in a filled rectangle 20 pixels wide and 20 pixels high.
			-- Calling draw_rectangle (gc, False, 0, 0, 20, 20) results in an
			-- outlined rectangle with corners at (0, 0), (0, 20), (20, 20),
			-- and (20, 0), which makes it 21 pixels wide and 21 pixels high.
		do
			gdk_draw_rectangle (handle, a_gc.handle, filled.to_integer,
								an_x, an_y, a_width, a_height)
		end

	draw_arc (a_gc: GDK_GC; a_filled: BOOLEAN; an_x, an_y,
							 a_width, a_height, angle1, angle2: INTEGER)
			-- Draws an arc or a filled 'pie slice'. The arc is defined by
			-- the bounding rectangle of the entire ellipse, and the start
			-- and end angles of the part of the ellipse to be drawn.
			--
			-- a_filled:  TRUE if the arc should be filled, producing a 'pie slice'.
			-- an_x:  the x coordinate of the left edge of the bounding rectangle.
			-- an_y:  the y coordinate of the top edge of the bounding rectangle.
			-- a_width:  the width of the bounding rectangle.
			-- a_height:  the height of the bounding rectangle.
			-- angle1:  the start angle of the arc, relative to the 3 o'clock
			--          position, counter-clockwise, in 1/64ths of a degree.
			-- angle2:  the end angle of the arc, relative to angle1, in
			--          1/64ths of a degree.
		do
			gdk_draw_arc (handle, a_gc.handle, a_filled.to_integer, an_x, an_y,
							a_width, a_height, angle1, angle2)
		end

	-- gdk_draw_polygon ()

	-- void        gdk_draw_polygon                (GdkDrawable *drawable,
	--                                              GdkGC *gc,
	--                                              gboolean filled,
	--                                              GdkPoint *points,
	--                                              gint npoints);

	-- Draws an outlined or filled polygon.

	-- drawable : 	a GdkDrawable (a GdkWindow or a GdkPixmap).
	-- gc : 	a GdkGC.
	-- filled : 	TRUE if the polygon should be filled. The polygon is closed automatically, connecting the last point to the first point if necessary.
	-- points : 	an array of GdkPoint structures specifying the points making up the polygon.
	-- npoints : 	the number of points.
	-- gdk_draw_trapezoids ()

	-- void        gdk_draw_trapezoids             (GdkDrawable *drawable,
	--                                              GdkGC *gc,
	--                                              GdkTrapezoid *trapezoids,
	--                                              gint n_trapezoids);

	-- Draws a set of anti-aliased trapezoids. The trapezoids are combined using saturation addition, then drawn over the background as a set. This is low level functionality used internally to implement rotated underlines and backgrouds when rendering a PangoLayout and is likely not useful for applications.

	-- drawable : 	a GdkDrawable
	-- gc : 	a GdkGC
	-- trapezoids : 	an array of GdkTrapezoid structures
	-- n_trapezoids : 	the number of trapezoids to draw

	-- Since 2.6
	-- GdkTrapezoid

	-- typedef struct {
	--   double y1, x11, x21, y2, x12, x22;
	-- } GdkTrapezoid;

	-- Specifies a trapezpoid for use by the gdk_draw_trapezoids(). The trapezoids used here have parallel, horizontal top and bottom edges.
	-- double y1; 	the y coordinate of the start point.
	-- double x11; 	the x coordinate of the top left corner
	-- double x21; 	the x coordinate of the top right corner
	-- double y2; 	the y coordinate of the end point.
	-- double x12; 	the x coordinate of the bottom left corner
	-- double x22; 	the x coordinate of the bottom right corner
	-- gdk_draw_glyphs ()

	-- void        gdk_draw_glyphs                 (GdkDrawable *drawable,
	--                                              GdkGC *gc,
	--                                              PangoFont *font,
	--                                              gint x,
	--                                              gint y,
	--                                              PangoGlyphString *glyphs);

	-- This is a low-level function; 99% of text rendering should be done using gdk_draw_layout() instead.

	-- A glyph is a single image in a font. This function draws a sequence of glyphs. To obtain a sequence of glyphs you have to understand a lot about internationalized text handling, which you don't want to understand; thus, use gdk_draw_layout() instead of this function, gdk_draw_layout() handles the details.

	-- drawable : 	a GdkDrawable
	-- gc : 	a GdkGC
	-- font : 	font to be used
	-- x : 	X coordinate of baseline origin
	-- y : 	Y coordinate of baseline origin
	-- glyphs : 	the glyph string to draw
	-- gdk_draw_glyphs_transformed ()

	-- void        gdk_draw_glyphs_transformed     (GdkDrawable *drawable,
	--                                              GdkGC *gc,
	--                                              PangoMatrix *matrix,
	--                                              PangoFont *font,
	--                                              gint x,
	--                                              gint y,
	--                                              PangoGlyphString *glyphs);

	-- Renders a PangoGlyphString onto a drawable, possibly transforming the layed-out coordinates through a transformation matrix. Note that the transformation matrix for font is not changed, so to produce correct rendering results, the font must have been loaded using a PangoContext with an identical transformation matrix to that passed in to this function.

	-- See also gdk_draw_glyphs(), gdk_draw_layout().

	-- drawable : 	a GdkDrawable
	-- gc : 	a GdkGC
	-- matrix : 	a PangoMatrix, or NULL to use an identity transformation
	-- font : 	the font in which to draw the string
	-- x : 	the x position of the start of the string (in Pango units in user space coordinates)
	-- y : 	the y position of the baseline (in Pango units in user space coordinates)
	-- glyphs : 	the glyph string to draw

	-- Since 2.6
	-- gdk_draw_layout_line ()

	-- void        gdk_draw_layout_line            (GdkDrawable *drawable,
	--                                              GdkGC *gc,
	--                                              gint x,
	--                                              gint y,
	--                                              PangoLayoutLine *line);

	-- Render a PangoLayoutLine onto an GDK drawable

	-- If the layout's PangoContext has a transformation matrix set, then x and y specify the position of the left edge of the baseline (left is in before-tranform user coordinates) in after-transform device coordinates.

	-- drawable : 	the drawable on which to draw the line
	-- gc : 	base graphics to use
	-- x : 	the x position of start of string (in pixels)
	-- y : 	the y position of baseline (in pixels)
	-- line : 	a PangoLayoutLine
	-- gdk_draw_layout_line_with_colors ()

	-- void        gdk_draw_layout_line_with_colors
	--                                             (GdkDrawable *drawable,
	--                                              GdkGC *gc,
	--                                              gint x,
	--                                              gint y,
	--                                              PangoLayoutLine *line,
	--                                              const GdkColor *foreground,
	--                                              const GdkColor *background);

	-- Render a PangoLayoutLine onto a GdkDrawable, overriding the layout's normal colors with foreground and/or background. foreground and background need not be allocated.

	-- If the layout's PangoContext has a transformation matrix set, then x and y specify the position of the left edge of the baseline (left is in before-tranform user coordinates) in after-transform device coordinates.

	-- drawable : 	the drawable on which to draw the line
	-- gc : 	base graphics to use
	-- x : 	the x position of start of string (in pixels)
	-- y : 	the y position of baseline (in pixels)
	-- line : 	a PangoLayoutLine
	-- foreground : 	foreground override color, or NULL for none
	-- background : 	background override color, or NULL for none


	draw_layout (a_gc: GDK_GC; an_x, an_y: INTEGER; a_layout: PANGO_LAYOUT)
			-- Render a PangoLayout onto a GDK drawable
			--
			-- If the layout's PANGO_CONTEXT has a transformation matrix set,
			-- then an_x and an_y specify the position of the top left corner
			-- of the bounding box (in device space) of the transformed layout.
			--
			-- If you're using GTK+, the usual way to obtain a PANGO_LAYOUT is
			-- my_widget.create_pango_layout
		require
			a_gc /= Void
			a_layout /= Void
		do
			gdk_draw_layout (handle, a_gc.handle, an_x, an_y, a_layout.handle)
		end

	draw_layout_with_colors (a_gc: GDK_GC; an_x, an_y: INTEGER;
				a_layout: PANGO_LAYOUT; a_foreground, a_background: GDK_COLOR)
			-- Render a PANGO_LAYOUT onto a GDK_DRAWABLE, overriding the
			-- layout's normal colors with a_foreground and/or a_background.
			-- a_foreground and a_background need not be allocated.
			--
			-- If the layout's PANGO_CONTEXT has a transformation matrix set,
			-- then an_x and an_y specify the position of the top left corner
			-- of the bounding box (in device space) of the transformed layout.
			--
			-- If you're using GTK+, the ususal way to obtain a PANGO_LAYOUT
			-- is my_widget.create_pango_layout.
		require
			a_gc /= Void
			a_layout /= Void
		local
			fg_ptr, bg_ptr: POINTER
		do
			if a_foreground /= Void then fg_ptr := a_foreground.handle end
			if a_background /= Void then bg_ptr := a_background.handle end
			gdk_draw_layout_with_colors (handle, a_gc.handle, an_x, an_y,
									a_layout.handle, fg_ptr, bg_ptr)
		end

	draw_drawable (a_gc: GDK_GC; a_drawable: GDK_DRAWABLE; xsrc, ysrc, xdest,
					ydest, a_width, a_height: INTEGER)
			-- Copies the <width x height> region of a_drawable at coordinates
			-- (xsrc, ysrc) to coordinates (xdest, ydest) in Current.
			-- a_width and/or a_height may be given as -1, in which case the
			-- entire a_drawable drawable will be copied.
			--
			-- Most fields in a_gc are not used for this operation, but notably
			-- the clip mask or clip region will be honored.
			--
			-- The source and destination drawables must have the same visual
			-- and colormap, or errors will result. (On X11, failure to match
			-- visual/colormap results in a BadMatch error from the X server.)
			-- A common cause of this problem is an attempt to draw a bitmap
			-- to a color drawable. The way to draw a bitmap is to set the
			-- bitmap as the stipple on the GdkGC, set the fill mode to
			-- GDK_STIPPLED, and then draw the rectangle.
		require
			a_gc /= Void
			a_drawable /= Void
		do
			gdk_draw_drawable (handle, a_gc.handle, a_drawable.handle,
								xsrc, ysrc, xdest, ydest, a_width, a_height)
		end

	-- gdk_draw_image ()

	-- void        gdk_draw_image                  (GdkDrawable *drawable,
	--                                              GdkGC *gc,
	--                                              GdkImage *image,
	--                                              gint xsrc,
	--                                              gint ysrc,
	--                                              gint xdest,
	--                                              gint ydest,
	--                                              gint width,
	--                                              gint height);

	-- Draws a GdkImage onto a drawable. The depth of the GdkImage must match the depth of the GdkDrawable.

	-- drawable : 	a GdkDrawable (a GdkWindow or a GdkPixmap).
	-- gc : 	a GdkGC.
	-- image : 	the GdkImage to draw.
	-- xsrc : 	the left edge of the source rectangle within image.
	-- ysrc : 	the top of the source rectangle within image.
	-- xdest : 	the x coordinate of the destination within drawable.
	-- ydest : 	the y coordinate of the destination within drawable.
	-- width : 	the width of the area to be copied, or -1 to make the area extend to the right edge of image.
	-- height : 	the height of the area to be copied, or -1 to make the area extend to the bottom edge of image.
	-- gdk_drawable_get_image ()

	-- GdkImage*   gdk_drawable_get_image          (GdkDrawable *drawable,
	--                                              gint x,
	--                                              gint y,
	--                                              gint width,
	--                                              gint height);

	-- A GdkImage stores client-side image data (pixels). In contrast, GdkPixmap and GdkWindow are server-side objects. gdk_drawable_get_image() obtains the pixels from a server-side drawable as a client-side GdkImage. The format of a GdkImage depends on the GdkVisual of the current display, which makes manipulating GdkImage extremely difficult; therefore, in most cases you should use gdk_pixbuf_get_from_drawable() instead of this lower-level function. A GdkPixbuf contains image data in a canonicalized RGB format, rather than a display-dependent format. Of course, there's a convenience vs. speed tradeoff here, so you'll want to think about what makes sense for your application.

	-- x, y, width, and height define the region of drawable to obtain as an image.

	-- You would usually copy image data to the client side if you intend to examine the values of individual pixels, for example to darken an image or add a red tint. It would be prohibitively slow to make a round-trip request to the windowing system for each pixel, so instead you get all of them at once, modify them, then copy them all back at once.

	-- If the X server or other windowing system backend is on the local machine, this function may use shared memory to avoid copying the image data.

	-- If the source drawable is a GdkWindow and partially offscreen or obscured, then the obscured portions of the returned image will contain undefined data.

	-- drawable : 	a GdkDrawable
	-- x : 	x coordinate on drawable
	-- y : 	y coordinate on drawable
	-- width : 	width of region to get
	-- height : 	height or region to get
	-- Returns : 	a GdkImage containing the contents of drawable
	-- gdk_drawable_copy_to_image ()

	-- GdkImage*   gdk_drawable_copy_to_image      (GdkDrawable *drawable,
	--                                              GdkImage *image,
	--                                              gint src_x,
	--                                              gint src_y,
	--                                              gint dest_x,
	--                                              gint dest_y,
	--                                              gint width,
	--                                              gint height);

	-- Copies a portion of drawable into the client side image structure image. If image is NULL, creates a new image of size width x height and copies into that. See gdk_drawable_get_image() for further details.

	-- drawable : 	a GdkDrawable
	-- image : 	a GdkDrawable, or NULL if a new image should be created.
	-- src_x : 	x coordinate on drawable
	-- src_y : 	y coordinate on drawable
	-- dest_x : 	x coordinate within image. Must be 0 if image is NULL
	-- dest_y : 	y coordinate within image. Must be 0 if image is NULL
	-- width : 	width of region to get
	-- height : 	height or region to get
	-- Returns : 	image, or a new a GdkImage containing the contents of drawable

	-- Since 2.4
end
