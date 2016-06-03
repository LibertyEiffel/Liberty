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
	--   Link: Part I. Tutorial (next)
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
	--                        Cairo: A Vector Graphics Library
	--
	--   for Cairo 1.2.4
	--
	--   --------------------------------------------------------------------------
	--
	--   Table of Contents
	--
	--   I. Tutorial
	--
	--   II. Reference
	--
	--                Drawing
	--
	--                             cairo_t - The cairo drawing context
	--
	--                             Paths - Creating paths and manipulating path
	--                             data
	--
	--                             Patterns - Gradients and filtered sources
	--
	--                             Transformations - Manipulating the current
	--                             transformation matrix
	--
	--                             Text - Rendering text and sets of glyphs
	--
	--                Fonts
	--
	--                             cairo_font_face_t - Base class for fonts
	--
	--                             Scaled Fonts - Caching metrics for a particular
	--                             font size
	--
	--                             Font Options - How a font should be rendered
	--
	--                             FreeType Fonts - Font support for FreeType
	--
	--                             Win32 Fonts - Font support for Microsoft Windows
	--
	--                Surfaces
	--
	--                             cairo_surface_t - Base class for surfaces
	--
	--                             Image Surfaces - Rendering to memory buffers
	--
	--                             PDF Surfaces - Rendering PDF documents
	--
	--                             PNG Support - Reading and writing PNG images
	--
	--                             PostScript Surfaces - Rendering PostScript
	--                             documents
	--
	--                             Win32 Surfaces - Microsoft Windows surface
	--                             support
	--
	--                             SVG Surfaces - Rendering SVG documents
	--
	--                             XLib Surfaces - X Window System rendering using
	--                             XLib
	--
	--                Utilities
	--
	--                             cairo_matrix_t - Generic matrix operations
	--
	--                             Error handling - Decoding cairo's status
	--
	--                             Version Information - Compile-time and run-time
	--                             version checks.
	--
	--                             Types - Generic data types used in the cairo API
	--
	--   Index
	--
	--   Index of new symbols in 1.2
	--
	--   A. Creating a language binding for cairo
	--
	--                General considerations
	--
	--                Memory Management
	--
	--                Multiple return values
	--
	--                Overloading and optional arguments
	--
	--                Streams and File I/O
	--
	--                Error handling
	--
	--                Patterns
	--
	--                Surfaces
	--
	--                Fonts
	--
	--                cairo_path_t

end -- class FOO
