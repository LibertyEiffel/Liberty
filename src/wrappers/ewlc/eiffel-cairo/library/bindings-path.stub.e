note
	description: "."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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
	--   Link: Fonts (previous)
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
	--   Prev Up Home              Cairo: A Vector Graphics Library
	--
	--cairo_path_t
	--
	--   The cairo_path_t type is one area in which most language bindings will
	--   differ significantly from the C API. The C API for cairo_path_t is
	--   designed for efficiency and to avoid auxiliary objects that would be have
	--   to be manually memory managed by the application. However, a language
	--   binding should not present cairo_path_t as an array, but rather as an
	--   opaque that can be iterated over. Different languages have quite different
	--   conventions for how iterators work, so it is impossible to give an exact
	--   specification for how this API should work, but the type names and methods
	--   should be similar to the language's mapping of the following:
	--
	-- typedef struct cairo_path_iterator cairo_path_iterator_t;
	-- typedef struct cairo_path_element cairo_path_element_t;
	--
	-- cairo_path_iterator_t *
	-- cairo_path_get_iterator (cairo_path_t *path);
	--
	-- cairo_bool_t
	-- cairo_path_iterator_has_next (cairo_path_iterator_t *iterator);
	--
	-- cairo_path_element_t *
	-- cairo_path_iterator_next (cairo_path_iterator_t *iterator);
	--
	-- cairo_path_element_type_t
	-- cairo_path_element_get_type (cairo_path_element_t *element);
	--
	-- void
	-- cairo_path_element_get_point (cairo_path_element_t *element,
	--                               int                   index,
	--                               double                *x,
	--                               double                *y);
	--
	--
	--   The above is written using the Java conventions for iterators. To
	--   illustrate how the API for PathIterator might depend on the native
	--   iteration conventions of the API, examine three versions of the loop,
	--   first written in a hypothetical Java binding:
	--
	-- PathIterator iter = cr.copyPath().iterator();
	-- while (cr.hasNext()) {
	--     PathElement element = iter.next();
	--     if (element.getType() == PathElementType.MOVE_TO) {
	--         Point p = element.getPoint(0);
	--         doMoveTo (p.x, p.y);
	--     }
	-- }
	--
	--   And then in a hypothetical C++ binding:
	--
	-- Path path = cr.copyPath();
	-- for (PathIterator iter = path.begin(); iter != path.end(); iter++) {
	--     PathElement element = *iter;
	--     if (element.getType() == PathElementType.MOVE_TO) {
	--         Point p = element.getPoint(0);
	--         doMoveTo (p.x, p.y);
	--     }
	-- }
	--
	--   And then finally in a Python binding:
	--
	-- for element in cr.copy_path():
	--     if element.getType == cairo.PATH_ELEMENT_MOVE_TO:
	--         (x, y) = element.getPoint(0)
	--         doMoveTo (x, y);
	--
	--   While many of the API elements stay the same in the three examples, the
	--   exact iteration mechanism is quite different, to match how users of the
	--   language would expect to iterate over a container.
	--
	--   You should not present an API for mutating or for creating new
	--   cairo_path_t objects. In the future, these guidelines may be extended to
	--   present an API for creating a cairo_path_t from scratch for use with
	--   cairo_append_path() but the current expectation is that
	--   cairo_append_path() will mostly be used with paths from cairo_copy_path().

end -- class FOO
