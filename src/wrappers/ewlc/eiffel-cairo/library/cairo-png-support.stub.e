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
	--   Link: Surfaces (parent)
	--   Link: PDF Surfaces (previous)
	--   Link: PostScript Surfaces (next)
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
	--   PNG Support
	--
	--   PNG Support -- Reading and writing PNG images
	--
	--Synopsis
	--
	--
	--
	--
	-- cairo_surface_t* cairo_image_surface_create_from_png
	--                                             (const char *filename);
	-- cairo_status_t (*cairo_read_func_t)         (void *closure,
	--                                              unsigned char *data,
	--                                              unsigned int length);
	-- cairo_surface_t* cairo_image_surface_create_from_png_stream
	--                                             (cairo_read_func_t read_func,
	--                                              void *closure);
	-- cairo_status_t cairo_surface_write_to_png   (cairo_surface_t *surface,
	--                                              const char *filename);
	-- cairo_status_t (*cairo_write_func_t)        (void *closure,
	--                                              unsigned char *data,
	--                                              unsigned int length);
	-- cairo_status_t cairo_surface_write_to_png_stream
	--                                             (cairo_surface_t *surface,
	--                                              cairo_write_func_t write_func,
	--                                              void *closure);
	--
	--Description
	--
	--Details
	--
	--  cairo_image_surface_create_from_png ()
	--
	-- cairo_surface_t* cairo_image_surface_create_from_png
	--                                             (const char *filename);
	--
	--   Creates a new image surface and initializes the contents to the given PNG
	--   file.
	--
	--   filename : name of PNG file to load
	--   Returns :  a new cairo_surface_t initialized with the contents of the PNG
	--              file, or a "nil" surface if any error occurred. A nil surface
	--              can be checked for with cairo_surface_status(surface) which may
	--              return one of the following values: CAIRO_STATUS_NO_MEMORY
	--              CAIRO_STATUS_FILE_NOT_FOUND CAIRO_STATUS_READ_ERROR
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_read_func_t ()
	--
	-- cairo_status_t (*cairo_read_func_t)         (void *closure,
	--                                              unsigned char *data,
	--                                              unsigned int length);
	--
	--   cairo_read_func_t is the type of function which is called when a backend
	--   needs to read data from an intput stream. It is passed the closure which
	--   was specified by the user at the time the read function was registered,
	--   the buffer to read the data into and the length of the data in bytes. The
	--   read function should return CAIRO_STATUS_SUCCESS if all the data was
	--   successfully read, CAIRO_STATUS_READ_ERROR otherwise.
	--
	--   closure : the input closure
	--   data :    the buffer into which to read the data
	--   length :  the amount of data to read
	--   Returns : the status code of the read operation
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_image_surface_create_from_png_stream ()
	--
	-- cairo_surface_t* cairo_image_surface_create_from_png_stream
	--                                             (cairo_read_func_t read_func,
	--                                              void *closure);
	--
	--   Creates a new image surface from PNG data read incrementally via the
	--   read_func function.
	--
	--   read_func : function called to read the data of the file
	--   closure :   data to pass to read_func.
	--   Returns :   a new cairo_surface_t initialized with the contents of the PNG
	--               file or NULL if the data read is not a valid PNG image or
	--               memory could not be allocated for the operation.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_surface_write_to_png ()
	--
	-- cairo_status_t cairo_surface_write_to_png   (cairo_surface_t *surface,
	--                                              const char *filename);
	--
	--   Writes the contents of surface to a new file filename as a PNG image.
	--
	--   surface :  a cairo_surface_t with pixel contents
	--   filename : the name of a file to write to
	--   Returns :  CAIRO_STATUS_SUCCESS if the PNG file was written successfully.
	--              Otherwise, CAIRO_STATUS_NO_MEMORY if memory could not be
	--              allocated for the operation or
	--              CAIRO_STATUS_SURFACE_TYPE_MISMATCH if the surface does not have
	--              pixel contents, or CAIRO_STATUS_WRITE_ERROR if an I/O error
	--              occurs while attempting to write the file.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_write_func_t ()
	--
	-- cairo_status_t (*cairo_write_func_t)        (void *closure,
	--                                              unsigned char *data,
	--                                              unsigned int length);
	--
	--   cairo_write_func_t is the type of function which is called when a backend
	--   needs to write data to an output stream. It is passed the closure which
	--   was specified by the user at the time the write function was registered,
	--   the data to write and the length of the data in bytes. The write function
	--   should return CAIRO_STATUS_SUCCESS if all the data was successfully
	--   written, CAIRO_STATUS_WRITE_ERROR otherwise.
	--
	--   closure : the output closure
	--   data :    the buffer containing the data to write
	--   length :  the amount of data to write
	--   Returns : the status code of the write operation
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_surface_write_to_png_stream ()
	--
	-- cairo_status_t cairo_surface_write_to_png_stream
	--                                             (cairo_surface_t *surface,
	--                                              cairo_write_func_t write_func,
	--                                              void *closure);
	--
	--   Writes the image surface to the write function.
	--
	--   surface :    a cairo_surface_t with pixel contents
	--   write_func : a cairo_write_func_t
	--   closure :    closure data for the write function
	--   Returns :    CAIRO_STATUS_SUCCESS if the PNG file was written
	--                successfully. Otherwise, CAIRO_STATUS_NO_MEMORY is returned
	--                if memory could not be allocated for the operation,
	--                CAIRO_STATUS_SURFACE_TYPE_MISMATCH if the surface does not
	--                have pixel contents.

end -- class FOO
