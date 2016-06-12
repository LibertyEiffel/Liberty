note
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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
	--   Link: Cairo: A Vector Graphics Library (parent)
	--   Link: Index of new symbols in 1.2 (previous)
	--   Link: Memory Management (next)
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
	--   Prev   Home             Cairo: A Vector Graphics Library              Next
	--
	--Appendix A. Creating a language binding for cairo
	--
	--   While cairo is implemented and C, and has a C API, it is expected that
	--   many users of cairo will be using it from languages other than C. The glue
	--   that connects the core cairo library to another language is known as a
	--   language binding. This appendix attempts to collect together issues that
	--   come up when creating a language bindings for cairo and present
	--   standardized solutions to promote consistency among the different language
	--   bindings.
	--
	--General considerations
	--
	--   The naming of the central cairo_t type is a special exception. The object
	--   is "a cairo context" not "a cairo", and names such as cairo_t rather than
	--   cairo_context_t and cairo_set_source() rather than
	--   cairo_context_set_source() are simply abbreviations to make the C API more
	--   palatable. In languages which have object-oriented syntax, this
	--   abbreviation is much less useful. In fact, if `Cairo' is used as a
	--   namespace, then in many languages, you'd end up with a ridiculous type
	--   name like `Cairo.Cairo'. For this reason, and for inter-language
	--   consistency all object-oriented languages should name this type as if it
	--   were cairo_context_t.
	--
	--   The punctuation and casing of the type names and method names of cairo
	--   should be changed to match the general convention of the language. In
	--   Java, where type names are written in StudlyCaps and method names in
	--   javaCaps, cairo_font_extents_t will become FontExtents and
	--   cairo_set_source(cr,source), cr.setSource(source). As compared to changing
	--   the punctuation, and casing, much more reluctance should be used in
	--   changing the method names themselves. Even if get is usually omitted from
	--   getters in your language, you shouldn't bind cairo_get_source() as
	--   cr.source().

end -- class FOO
