note
	description: "."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, GTK+ team
					
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
	--   Link: Appendix A. Creating a language binding for cairo (parent)
	--   Link: Multiple return values (previous)
	--   Link: Streams and File I/O (next)
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
	--
	--Overloading and optional arguments
	--
	--   Function overloading (having a several variants of a function with the
	--   same name and different arguments) is a language feature available in many
	--   languages but not in C.
	--
	--   In general, language binding authors should use restraint in combining
	--   functions in the cairo API via function overloading. What may seem like an
	--   obvious overload now may turn out to be strange with future additions to
	--   cairo. It might seem logical to make cairo_set_source_rgb() an overload of
	--   cairo_set_source(), but future plans to add
	--   cairo_set_source_rgb_premultiplied(), which will also take three doubles
	--   make this a bad idea. For this reason, only the following pairs of
	--   functions should be combined via overloading
	--
	-- void
	-- cairo_set_source (cairo_t *cr, cairo_pattern_t *source);
	--
	-- void
	-- cairo_set_source_surface (cairo_t          *cr,
	--                           cairo_surface_t  *source,
	--                           double            surface_x,
	--                           double            surface_y);
	--
	-- void
	-- cairo_mask (cairo_t         *cr,
	--             cairo_pattern_t *pattern);
	--
	-- void
	-- cairo_mask_surface (cairo_t         *cr,
	--                     cairo_surface_t *surface,
	--                     double           surface_x,
	--                     double           surface_y);
	--
	-- cairo_surface_t *
	-- cairo_image_surface_create (cairo_format_t      format,
	--                             int                 width,
	--                             int                 height);
	-- cairo_surface_t *
	-- cairo_image_surface_create_for_data (unsigned char             *data,
	--                                      cairo_format_t             format,
	--                                      int                        width,
	--                                      int                        height,
	--                                      int                        stride);
	--
	-- cairo_status_t
	-- cairo_surface_write_to_png (cairo_surface_t     *surface,
	--                             const char          *filename);
	--
	-- cairo_status_t
	-- cairo_surface_write_to_png_stream (cairo_surface_t      *surface,
	--                                    cairo_write_func_t   write_func,
	--                                    void                 *closure);
	--
	-- cairo_surface_t *
	-- cairo_image_surface_create_from_png (const char *filename);
	--
	-- cairo_surface_t *
	-- cairo_image_surface_create_from_png_stream (cairo_read_func_t   read_func,
	--                                             void                *closure);
	--
	--
	--   Note that there are cases where all constructors for a type aren't
	--   overloaded together. For example cairo_image_surface_create_from_png()
	--   should not be overloaded together with cairo_image_surface_create(). In
	--   such cases, the remaining constructors will typically need to be bound as
	--   static methods. In Java, for example, we might have:
	--
	-- Surface surface1 = ImageSurface(Format.RGB24, 100, 100);
	-- Surface surface2 = ImageSurface.createFromPNG("camera.png");
	--
	--   Some other overloads that add combinations not found in C may be
	--   convenient for users for language bindings that provide cairo_point_t and
	--   cairo_rectangle_t types, for example:
	--
	-- void
	-- cairo_move_to (cairo_t       *cr,
	--                cairo_point_t *point);
	-- void
	-- cairo_rectangle (cairo_t           *cr,
	--                  cairo_rectangle_t *rectangle);
	--

end -- class FOO
