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
	--   Link: Appendix A. Creating a language binding for cairo (previous)
	--   Link: Multiple return values (next)
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
	--Memory Management
	--
	--   The objects in cairo can roughly be divided into two types:
	--   reference-counted, opaque types like cairo_surface_t and plain structures
	--   like cairo_glyph_t. cairo_path_t and cairo_path_data_t are special cases
	--   and are treated separately in this appendix.
	--
	--   Refcounted opaque types all have a ..._reference() function to increase
	--   the refcount by one and a ..._destroy() to decrease the refcount by one.
	--   These should not be exposed to the user of the language binding, but
	--   rather used to implement memory management within the language binding.
	--   The simplest way to do memory management for a language binding is to
	--   treat the language binding object as a simple handle to the cairo object.
	--   The language binding object references the cairo object, and unreferences
	--   it when finalized. This is the recommended method, though there are a
	--   couple of caveats to be noted:
	--
	--     o Equality won't work as expected. You can have two language objects for
	--       the same cairo and they won't necessarily compare equal. If the
	--       language allows customizing the equality operation, then this is
	--       fixable by comparing the underlying pointers. It also can be fixed by
	--       creating at most one language object per cairo object, and uniquifying
	--       via a pin table (a hash table that goes from cairo object to language
	--       object). For cairo_surface_t you can use also
	--       cairo_surface_set_user_data() instead of a separate pin table.
	--
	--     o Derivation from the language object doesn't work because you can lose
	--       the language object while keeping the Cairo object. Code like:
	--
	-- public class MySurface (ImageSurface) {
	--    public MySurface (width, height) {
	--       super (Format.ARGB32, width, height);
	--    }
	--    public int get42 () {
	--       return 42;
	--    }
	-- }
	--
	--    cr = Cairo(MySurface(width, height));
	--    surface = cr.getTarget();
	--
	--       Can result in surface containing an ImageSurface not a MySurface. This
	--       is not easily fixable without creating memory leaks, and it's probably
	--       best to simply forbid deriving from the language objects.
	--
	--   When a plain structure is used as a return value from cairo, this is done
	--   by passing it as a "out parameter".
	--
	-- cairo_font_extents_t extents;
	--
	-- cairo_font_extents (cr, &extents);
	--
	--   In a language binding, this should typically be treated as a return value:
	--
	-- FontExtents extents = cr.fontExtents ();
	--
	--   A language binding has a choice in how it implements the language objects
	--   for plain structures. It can use a pure language object with fields
	--   corresponding to those of the C structure, and convert from and to the C
	--   structure when calling cairo functions or converting cairo return values.
	--   Or it can keep a pointer to the C structure internally and wrap it inside
	--   a language object much like occurs for refcounted objects. The choice
	--   should be invisible to the user: they should be able to imagine that it is
	--   implemented as a pure language object.

end -- class FOO
