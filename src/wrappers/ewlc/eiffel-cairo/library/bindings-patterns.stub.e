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
	--   Link: Appendix A. Creating a language binding for cairo (parent)
	--   Link: Error handling (previous)
	--   Link: Surfaces (next)
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
	--Patterns
	--
	--   The cairo C API allows for creating a number of different types of
	--   patterns. All of these different types of patterns map to cairo_pattern_t
	--   in C, but in an object oriented language, there should instead be a
	--   hierarchy of types. (The functions that should map to constructors for the
	--   various types are listed after the type, methods on that type are listed
	--   below)
	--
	-- cairo_pattern_t
	--       cairo_pattern_set_matrix()
	--       cairo_pattern_get_matrix()
	--    cairo_solid_pattern_t
	--    cairo_surface_pattern_t (cairo_pattern_create_for_surface())
	--          cairo_pattern_set_extend()
	--          cairo_pattern_get_extend()
	--          cairo_pattern_set_filter()
	--          cairo_pattern_get_filter()
	--    cairo_gradient_t
	--          cairo_pattern_add_color_stop_rgb()
	--          cairo_pattern_add_color_stop_rgba()
	--       cairo_linear_gradient_t (cairo_pattern_create_linear())
	--       cairo_radial_gradient_t (cairo_pattern_create_radial())
	--

end -- class FOO
