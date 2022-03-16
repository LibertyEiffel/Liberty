note
	description: "."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GTK+ team
					
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
	--   Link: PostScript Surfaces (previous)
	--   Link: SVG Surfaces (next)
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
	--   Win32 Surfaces
	--
	--   Win32 Surfaces -- Microsoft Windows surface support
	--
	--Synopsis
	--
	--
	--
	--
	-- cairo_surface_t* cairo_win32_surface_create (HDC hdc);
	-- cairo_surface_t* cairo_win32_surface_create_with_dib
	--                                             (cairo_format_t format,
	--                                              int width,
	--                                              int height);
	-- HDC         cairo_win32_surface_get_dc      (cairo_surface_t *surface);
	--
	--Description
	--
	--Details
	--
	--  cairo_win32_surface_create ()
	--
	-- cairo_surface_t* cairo_win32_surface_create (HDC hdc);
	--
	--   Creates a cairo surface that targets the given DC. The DC will be queried
	--   for its initial clip extents, and this will be used as the size of the
	--   cairo surface. Also, if the DC is a raster DC, it will be queried for its
	--   pixel format and the cairo surface format will be set appropriately.
	--
	--   hdc :     the DC to create a surface for
	--   Returns : the newly created surface
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_win32_surface_create_with_dib ()
	--
	-- cairo_surface_t* cairo_win32_surface_create_with_dib
	--                                             (cairo_format_t format,
	--                                              int width,
	--                                              int height);
	--
	--   Creates a device-independent-bitmap surface not associated with any
	--   particular existing surface or device context. The created bitmap will be
	--   unititialized.
	--
	--   format :  format of pixels in the surface to create
	--   width :   width of the surface, in pixels
	--   height :  height of the surface, in pixels
	--   Returns : the newly created surface
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_win32_surface_get_dc ()
	--
	-- HDC         cairo_win32_surface_get_dc      (cairo_surface_t *surface);
	--
	--   Returns the HDC associated with this surface, or NULL if none. Also
	--   returns NULL if the surface is not a win32 surface.
	--
	--   surface : a cairo_surface_t
	--   Returns : HDC or NULL if no HDC available.
	--
	--   Since 1.2

end -- class FOO
