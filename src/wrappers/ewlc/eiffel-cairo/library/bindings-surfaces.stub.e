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
	--   Link: Patterns (previous)
	--   Link: Fonts (next)
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
	--Surfaces
	--
	--   Like patterns, surfaces, which use only the cairo_surface_t type in the C
	--   API should be broken up into a hierarchy of types in a language binding.
	--
	-- cairo_surface_t
	--     cairo_image_surface_t
	--     cairo_atsui_surface_t
	--     cairo_win32_surface_t
	--     cairo_xlib_surface_t
	--
	--
	--   Unlike patterns, the constructors and methods on these types are clearly
	--   named, and can be trivially associated with the appropriate subtype. Many
	--   language bindings will want to avoid binding the platform-specific
	--   subtypes at all, since the methods on these types are not useful without
	--   passing in native C types. Unless there is a language binding for Xlib
	--   available, there is no way to represent a XLib Display * in that language.
	--
	--   This doesn't mean that platform-specific surface types can't be used in a
	--   language binding that doesn't bind the constructor. A very common
	--   situation is to use a cairo language binding in combination with a binding
	--   for a higher level system like the GTK+ widget toolkit. In such a
	--   situation, the higher level toolkit provides ways to get references to
	--   platform specific surfaces.
	--
	--   The cairo_surface_set_user_data(), and cairo_surface_get_user_data()
	--   methods are provided for use in language bindings, and should not be
	--   directly exposed to applications. One example of the use of these
	--   functions in a language binding is creating a binding for:
	--
	-- cairo_surface_t *
	-- cairo_image_surface_create_for_data (unsigned char             *data,
	--                                      cairo_format_t             format,
	--                                      int                        width,
	--                                      int                        height,
	--                                      int                        stride);
	--
	--   The memory block passed in for data must be kept around until the surface
	--   is destroyed, so the language binding must have some way of determining
	--   when that happens. The way to do this is to use the destroy argument to
	--   cairo_surface_set_user_data().
	--
	--   Some languages may not have a suitable "pointer to a block of data" type
	--   to pass in for data. And even where a language does have such a type, the
	--   user will be frequently able to cause the backing store to be reallocated
	--   to a different location or truncated. Should we recommend a standard type
	--   name and binding for a buffer object here?

end -- class FOO
