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
	--   Link: Streams and File I/O (previous)
	--   Link: Patterns (next)
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
	--Error handling
	--
	--   The error handling approach in C for Cairo has multiple elements:
	--
	--     o When a method on an object fails, the object is put into an error
	--       state. Subsequent operations on the object do nothing. The status of
	--       the object can be queried with a function like status().
	--
	--     o Constructors, rather than returning NULL on out-of-memory failure,
	--       return a special singleton object on which all operations do nothing.
	--       Retrieving the status of the singleton object returns
	--       CAIRO_STATUS_NO_MEMORY
	--
	--       Is this going to apply to cairo_surface_t as well?
	--
	--       What about cairo_copy_path_data()? It's probably going to have to
	--       return NULL.
	--
	--     o Errors propagate from object to object. Setting a pattern in an
	--       out-of-memory state as the source of a cairo_t puts the type into an
	--       error state.
	--
	--   Much of the above is not yet implemented at the time of this writing
	--
	--   A language binding could copy the C approach, and for a language without
	--   exceptions, this is likely the right thing to do. However, for a language
	--   with exceptions, exposing a completely different style of error handling
	--   for cairo would be strange. So, instead, status should be checked after
	--   every call to cairo, and exceptions thrown as necessary.
	--
	--   One problem that can arise with this, in languages where handling
	--   exceptions is mandatory (like Java), is that almost every cairo function
	--   can result in a status being set, usually because of an out-of-memory
	--   condition. This could make cairo hard to use. To resolve this problem,
	--   let's classify then cairo status codes:
	--
	-- /* Memory */
	-- CAIRO_STATUS_NO_MEMORY,
	--
	-- /* Programmer error */
	-- CAIRO_STATUS_INVALID_RESTORE
	-- CAIRO_STATUS_INVALID_POP_GROUP
	-- CAIRO_STATUS_NO_CURRENT_POINT
	-- CAIRO_STATUS_INVALID_MATRIX
	-- CAIRO_STATUS_NO_TARGET_SURFACE
	-- CAIRO_STATUS_INVALID_STRING
	-- CAIRO_STATUS_SURFACE_FINISHED
	-- CAIRO_STATUS_BAD_NESTING
	--
	-- /* Language binding implementation */
	-- CAIRO_STATUS_NULL_POINTER
	-- CAIRO_STATUS_INVALID_PATH_DATA
	-- CAIRO_STATUS_SURFACE_TYPE_MISMATCH
	--
	-- /* Other */
	-- CAIRO_STATUS_READ_ERROR
	-- CAIRO_STATUS_WRITE_ERROR
	--
	--   If we look at these, the CAIRO_STATUS_NO_MEMORY should map to the native
	--   out-of-memory exception, which could happen at any point in any case. Most
	--   of the others indicate programmer error, and handling them in user code
	--   would be silly. These should be mapped into whatever the language uses for
	--   assertion failures, rather than errors that are normally handled. (In
	--   Java, a subclass of Error rather than Exception, perhaps.) And
	--   CAIRO_STATUS_READ_ERROR, and CAIRO_STATUS_WRITE_ERROR can occur only in
	--   very specific places. (In fact, as described in the section called
	--   "Streams and File I/O", these errors may be mapped into the language's
	--   native I/O error types.) So, there really aren't exceptions that the
	--   programmer must handle at most points in the Cairo API.

end -- class FOO
