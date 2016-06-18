note
	description: "Cairo Image Surface: Cairo surfaces that represent data in memory."
	copyright: "[
					Copyright (C) 2007 Soluciones Informaticas Libres S.A. (Except),
					                   Cairo team
					
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
	date: "$Date:$"
	revision: "$Revision:$"
	wrapped_version: "1.2.4"

class CAIRO_IMAGE_SURFACE
	-- Image surfaces provide the ability to render to memory buffers either
	-- allocated by cairo or by the calling code. The supported image formats
	-- are those defined in CAIRO_FORMAT.

inherit
	CAIRO_SURFACE

insert
	CAIRO_FORMAT
	CAIRO_IMAGE_SURFACE_EXTERNALS

create {ANY}
	make, for_data, from_png

feature {} -- Creation

	make (a_format, a_width, a_height: INTEGER)
			-- Creates an image surface of the specified format and dimensions.
			-- Initially the surface contents are all 0. (Specifically, within
			-- each pixel, each color or alpha channel belonging to format will
			-- be 0. The contents of bits within a pixel, but not belonging to
			-- the given format are undefined).
			-- a_format: format of pixels in the surface to create
			-- a_width: width of the surface, in pixels
			-- a_height: height of the surface, in pixels
			-- Returns: A pointer to the newly created surface. The caller owns
			-- the surface and should call cairo_surface_destroy when done with
			-- it. This function always returns a valid pointer, but it will
			-- return a pointer to a "nil" surface if an error such as out of
			-- memory occurs. Always check 'status' to check for this.

		require
			is_valid_cairo_format (a_format)
		do
			from_external_pointer (cairo_image_surface_create (a_format, a_width, a_height))
		end

	for_data (some_data: POINTER; a_format, a_width, a_height, a_stride: INTEGER)
			-- Creates an image surface for the provided pixel data.
			-- The output buffer must be kept around until the CAIRO_SURFACE is
			-- destroyed or 'finish' is called on the surface. The initial
			-- contents of buffer will be used as the initial image contents;
			-- you must explicitly clear the buffer, using, for example,
			-- 'rectangle()' and 'fill()' if you want it cleared.
			--
			--  data: a pointer to a buffer supplied by the application in which
			--        to write contents.
			--  format: the format of pixels in the buffer
			--  width: the width of the image to be stored in the buffer
			--  height: the height of the image to be stored in the buffer
			--  stride: the number of bytes between the start of rows in the
			--          buffer. Having this be specified separate from width
			--          allows for padding at the end of rows, or for writing to
			--          a subportion of a larger image.
		require
			is_valid_cairo_format (a_format)
		do
			from_external_pointer (cairo_image_surface_create_for_data (some_data,
			                       a_format, a_width, a_height, a_stride))
		end

	from_png (a_filename: STRING)
			-- Creates a new image surface and initializes the contents to the
			-- given PNG file.
			-- Creates a CAIRO_SURFACE initialized with the contents of the
			-- PNG file, or a "nil" surface if any error occurred. A nil surface
			-- can be checked for with 'status' which may return one of the
			-- following values: cairo_status_no_memory,
			--                   cairo_status_file_not_found,
			--                   cairo_status_read_error
		require
			a_filename /= Void
		do
			from_external_pointer (cairo_image_surface_create_from_png (
			                       a_filename.to_external))
		end

feature {ANY} -- Access

	data: POINTER
			--Get a pointer to the data of the image surface, for direct
			-- inspection or modification.
		do
			Result := cairo_image_surface_get_data (handle)
		end

	format: INTEGER
		--Get the format of the surface.
		do
			Result := cairo_image_surface_get_format (handle)
		ensure
			is_valid_cairo_format (Result)
		end

	width: INTEGER
			--Get the width of the image surface in pixels.
		do
			Result := cairo_image_surface_get_width (handle)
		end

	height: INTEGER
			--Get the height of the image surface in pixels.
		do
			Result := cairo_image_surface_get_height (handle)
		end

	stride: INTEGER
			--Get the stride of the image surface in bytes
		do
			Result := cairo_image_surface_get_stride (handle)
		end

feature {ANY} -- Operations

	write_to_png (a_filename: STRING): INTEGER
			-- Writes the contents of surface to a new file filename as a PNG
			-- image.
			-- filename: the name of a file to write to
			-- Returns: cairo_status_success if the PNG file was written successfully.
			-- Otherwise, cairo_status_no_memory if memory could not be allocated
			-- for the operation or cairo_status_surface_type_mismatch if the
			-- surface does not have pixel contents, or cairo_status_write_error
			-- if an I/O error occurs while attempting to write the file.
		require
			a_filename /= Void
		do
			Result := cairo_surface_write_to_png (handle, a_filename.to_external)
		ensure
			is_valid_cairo_status (Result)
		end

end -- class CAIRO_IMAGE_SURFACE
