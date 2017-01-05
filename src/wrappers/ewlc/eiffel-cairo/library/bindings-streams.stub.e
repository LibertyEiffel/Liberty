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
	--   Link: Overloading and optional arguments (previous)
	--   Link: Error handling (next)
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
	--Streams and File I/O
	--
	--   Various places in the cairo API deal with reading and writing data,
	--   whether from and to files, or to other sources and destinations. In these
	--   cases, what is typically provided in the C API is a simple version that
	--   just takes a filename, and a complex version that takes a callback
	--   function. An example is the PNG handling functions:
	--
	-- cairo_surface_t *
	-- cairo_image_surface_create_from_png (const char *filename);
	--
	-- cairo_surface_t *
	-- cairo_image_surface_create_from_png_stream (cairo_read_func_t read_func,
	--                                             void             *closure);
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
	--   The expectation is that the filename version will be mapped literally in
	--   the language binding, but the callback version will be mapped to a version
	--   that takes a language stream object. For example, in Java, the four
	--   functions above might be mapped to:
	--
	-- static public ImageSurface createFromPNG (String filename) throws IOException;
	-- static public ImageSurface createFromPNG (InputStream stream) throws IOException;
	-- public void writeToPNG (String filename) throws IOException;
	-- public void writeToPNG (OutputStream stream) throws IOException;
	--
	--   In many cases, it will be better to implement the filename version
	--   internally using the stream version, rather than building it on top of the
	--   filename version in C. The reason for this is that will naturally give a
	--   more standard handling of file errors for the language, as seen in the
	--   above Java example, where createFromPNG() is marked as raising an
	--   exception. Propagating exceptions from inside the callback function to the
	--   caller will pose a challenge to the language binding implementor, since an
	--   exception must not propagate through the Cairo code. A technique that will
	--   be useful in some cases is to catch the exception in the callback, store
	--   the exception object inside a structure pointed to by closure, and then
	--   rethrow it once the function returns.
	--
	--   I'm not sure how to handle this for
	--   cairo_pdf_surface_create_for_callback(). Other than keep a "exception to
	--   rethrow" thread-specific variable that is checked after every call to a
	--   Cairo function.

end -- class FOO
