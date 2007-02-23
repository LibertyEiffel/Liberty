indexing
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

creation make, from_external_pointer

feature {} -- Creation

	--   Link: Cairo: A Vector Graphics Library (start)
	--   Link: Surfaces (parent)
	--   Link: Image Surfaces (previous)
	--   Link: PNG Support (next)
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
	--   PDF Surfaces
	--
	--   PDF Surfaces -- Rendering PDF documents
	--
	--Synopsis
	--
	--
	--
	--
	-- cairo_surface_t* cairo_pdf_surface_create   (const char *filename,
	--                                              double width_in_points,
	--                                              double height_in_points);
	-- cairo_surface_t* cairo_pdf_surface_create_for_stream
	--                                             (cairo_write_func_t write_func,
	--                                              void *closure,
	--                                              double width_in_points,
	--                                              double height_in_points);
	-- void        cairo_pdf_surface_set_size      (cairo_surface_t *surface,
	--                                              double width_in_points,
	--                                              double height_in_points);
	--
	--Description
	--
	--Details
	--
	--  cairo_pdf_surface_create ()
	--
	-- cairo_surface_t* cairo_pdf_surface_create   (const char *filename,
	--                                              double width_in_points,
	--                                              double height_in_points);
	--
	--   Creates a PDF surface of the specified size in points to be written to
	--   filename.
	--
	--   filename :         a filename for the PDF output (must be writable)
	--   width_in_points :  width of the surface, in points (1 point == 1/72.0
	--                      inch)
	--   height_in_points : height of the surface, in points (1 point == 1/72.0
	--                      inch)
	--   Returns :          a pointer to the newly created surface. The caller owns
	--                      the surface and should call cairo_surface_destroy when
	--                      done with it. This function always returns a valid
	--                      pointer, but it will return a pointer to a "nil"
	--                      surface if an error such as out of memory occurs. You
	--                      can use cairo_surface_status() to check for this.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_pdf_surface_create_for_stream ()
	--
	-- cairo_surface_t* cairo_pdf_surface_create_for_stream
	--                                             (cairo_write_func_t write_func,
	--                                              void *closure,
	--                                              double width_in_points,
	--                                              double height_in_points);
	--
	--   Creates a PDF surface of the specified size in points to be written
	--   incrementally to the stream represented by write_func and closure.
	--
	--   write_func :       a cairo_write_func_t to accept the output data
	--   closure :          the closure argument for write_func
	--   width_in_points :  width of the surface, in points (1 point == 1/72.0
	--                      inch)
	--   height_in_points : height of the surface, in points (1 point == 1/72.0
	--                      inch)
	--   Returns :          a pointer to the newly created surface. The caller owns
	--                      the surface and should call cairo_surface_destroy when
	--                      done with it. This function always returns a valid
	--                      pointer, but it will return a pointer to a "nil"
	--                      surface if an error such as out of memory occurs. You
	--                      can use cairo_surface_status() to check for this.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_pdf_surface_set_size ()
	--
	-- void        cairo_pdf_surface_set_size      (cairo_surface_t *surface,
	--                                              double width_in_points,
	--                                              double height_in_points);
	--
	--   Changes the size of a PDF surface for the current (and subsequent) pages.
	--
	--   This function should only be called before any drawing operations have
	--   been performed on the current page. The simplest way to do this is to call
	--   this function immediately after creating the surface or immediately after
	--   completing a page with either cairo_show_page() or cairo_copy_page().
	--
	--   surface :          a PDF cairo_surface_t
	--   width_in_points :  new surface width, in points (1 point == 1/72.0 inch)
	--   height_in_points : new surface height, in points (1 point == 1/72.0 inch)
	--
	--   Since 1.2

end -- class FOO
