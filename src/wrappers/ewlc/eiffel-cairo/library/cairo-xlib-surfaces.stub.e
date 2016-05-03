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
	--   Link: SVG Surfaces (previous)
	--   Link: Utilities (next)
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
	--   XLib Surfaces
	--
	--   XLib Surfaces -- X Window System rendering using XLib
	--
	--Synopsis
	--
	--
	--
	--
	-- cairo_surface_t* cairo_xlib_surface_create  (Display *dpy,
	--                                              Drawable drawable,
	--                                              Visual *visual,
	--                                              int width,
	--                                              int height);
	-- cairo_surface_t* cairo_xlib_surface_create_for_bitmap
	--                                             (Display *dpy,
	--                                              Pixmap bitmap,
	--                                              Screen *screen,
	--                                              int width,
	--                                              int height);
	-- void        cairo_xlib_surface_set_size     (cairo_surface_t *surface,
	--                                              int width,
	--                                              int height);
	-- Display*    cairo_xlib_surface_get_display  (cairo_surface_t *surface);
	-- Screen*     cairo_xlib_surface_get_screen   (cairo_surface_t *surface);
	-- void        cairo_xlib_surface_set_drawable (cairo_surface_t *surface,
	--                                              Drawable drawable,
	--                                              int width,
	--                                              int height);
	-- Drawable    cairo_xlib_surface_get_drawable (cairo_surface_t *surface);
	-- Visual*     cairo_xlib_surface_get_visual   (cairo_surface_t *surface);
	-- int         cairo_xlib_surface_get_width    (cairo_surface_t *surface);
	-- int         cairo_xlib_surface_get_height   (cairo_surface_t *surface);
	-- int         cairo_xlib_surface_get_depth    (cairo_surface_t *surface);
	--
	--Description
	--
	--Details
	--
	--  cairo_xlib_surface_create ()
	--
	-- cairo_surface_t* cairo_xlib_surface_create  (Display *dpy,
	--                                              Drawable drawable,
	--                                              Visual *visual,
	--                                              int width,
	--                                              int height);
	--
	--   Creates an Xlib surface that draws to the given drawable. The way that
	--   colors are represented in the drawable is specified by the provided
	--   visual.
	--
	--   NOTE: If drawable is a Window, then the function
	--   cairo_xlib_surface_set_size must be called whenever the size of the window
	--   changes.
	--
	--   dpy :      an X Display
	--   drawable : an X Drawable, (a Pixmap or a Window)
	--   visual :   the visual to use for drawing to drawable. The depth of the
	--              visual must match the depth of the drawable. Currently, only
	--              TrueColor visuals are fully supported.
	--   width :    the current width of drawable.
	--   height :   the current height of drawable.
	--   Returns :  the newly created surface
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_xlib_surface_create_for_bitmap ()
	--
	-- cairo_surface_t* cairo_xlib_surface_create_for_bitmap
	--                                             (Display *dpy,
	--                                              Pixmap bitmap,
	--                                              Screen *screen,
	--                                              int width,
	--                                              int height);
	--
	--   Creates an Xlib surface that draws to the given bitmap. This will be drawn
	--   to as a CAIRO_FORMAT_A1 object.
	--
	--   dpy :     an X Display
	--   bitmap :  an X Drawable, (a depth-1 Pixmap)
	--   screen :  the X Screen associated with bitmap
	--   width :   the current width of bitmap.
	--   height :  the current height of bitmap.
	--   Returns : the newly created surface
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_xlib_surface_set_size ()
	--
	-- void        cairo_xlib_surface_set_size     (cairo_surface_t *surface,
	--                                              int width,
	--                                              int height);
	--
	--   Informs cairo of the new size of the X Drawable underlying the surface.
	--   For a surface created for a Window (rather than a Pixmap), this function
	--   must be called each time the size of the window changes. (For a subwindow,
	--   you are normally resizing the window yourself, but for a toplevel window,
	--   it is necessary to listen for ConfigureNotify events.)
	--
	--   A Pixmap can never change size, so it is never necessary to call this
	--   function on a surface created for a Pixmap.
	--
	--   surface : a cairo_surface_t for the XLib backend
	--   width :   the new width of the surface
	--   height :  the new height of the surface
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_xlib_surface_get_display ()
	--
	-- Display*    cairo_xlib_surface_get_display  (cairo_surface_t *surface);
	--
	--   Get the X Display for the underlying X Drawable.
	--
	--   surface : a cairo_xlib_surface_t
	--   Returns : the display.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_xlib_surface_get_screen ()
	--
	-- Screen*     cairo_xlib_surface_get_screen   (cairo_surface_t *surface);
	--
	--   Get the X Screen for the underlying X Drawable.
	--
	--   surface : a cairo_xlib_surface_t
	--   Returns : the screen.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_xlib_surface_set_drawable ()
	--
	-- void        cairo_xlib_surface_set_drawable (cairo_surface_t *surface,
	--                                              Drawable drawable,
	--                                              int width,
	--                                              int height);
	--
	--   Informs cairo of a new X Drawable underlying the surface. The drawable
	--   must match the display, screen and format of the existing drawable or the
	--   application will get X protocol errors and will probably terminate. No
	--   checks are done by this function to ensure this compatibility.
	--
	--   surface :  a cairo_surface_t for the XLib backend
	--   drawable : the new drawable for the surface
	--   width :    the width of the new drawable
	--   height :   the height of the new drawable
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_xlib_surface_get_drawable ()
	--
	-- Drawable    cairo_xlib_surface_get_drawable (cairo_surface_t *surface);
	--
	--   Get the underlying X Drawable used for the surface.
	--
	--   surface : a cairo_xlib_surface_t
	--   Returns : the drawable.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_xlib_surface_get_visual ()
	--
	-- Visual*     cairo_xlib_surface_get_visual   (cairo_surface_t *surface);
	--
	--   Get the X Visual used for underlying X Drawable.
	--
	--   surface : a cairo_xlib_surface_t
	--   Returns : the visual.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_xlib_surface_get_width ()
	--
	-- int         cairo_xlib_surface_get_width    (cairo_surface_t *surface);
	--
	--   Get the width of the X Drawable underlying the surface in pixels.
	--
	--   surface : a cairo_xlib_surface_t
	--   Returns : the width of the surface in pixels.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_xlib_surface_get_height ()
	--
	-- int         cairo_xlib_surface_get_height   (cairo_surface_t *surface);
	--
	--   Get the height of the X Drawable underlying the surface in pixels.
	--
	--   surface : a cairo_xlib_surface_t
	--   Returns : the height of the surface in pixels.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_xlib_surface_get_depth ()
	--
	-- int         cairo_xlib_surface_get_depth    (cairo_surface_t *surface);
	--
	--   Get the number of bits used to represent each pixel value.
	--
	--   surface : a cairo_xlib_surface_t
	--   Returns : the depth of the surface in bits.
	--
	--   Since 1.2

end -- class FOO
