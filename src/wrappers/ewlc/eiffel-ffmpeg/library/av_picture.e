note
	description: "The AVPicture structure"
	copyright: "[
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except)
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class AV_PICTURE

inherit
	C_STRUCT
		rename allocate as c_struct_allocate end

	EIFFEL_OWNED

insert
	AV_PICTURE_EXTERNALS
	AV_PIXEL_FORMATS

feature {ANY} -- Operations

	convert (a_dest: AV_PICTURE; a_dest_pix_fmt, a_src_pix_fmt, a_width, a_height: INTEGER): BOOLEAN is
		require
			is_valid_av_pixel_format (a_dest_pix_fmt)
			is_valid_av_pixel_format (a_src_pix_fmt)
		do
			Result := img_convert (a_dest.handle, a_dest_pix_fmt, handle, a_src_pix_fmt, a_width, a_height) = 0
		end

	allocate (a_pixel_format, a_width, a_height: INTEGER): BOOLEAN is
			-- Allocate memory for a picture.
			-- Call deallocate to free it.
			--
			-- Parameters:
			--    a_pixel_format: the format of the picture.
			--    a_width: the width of the picture.
			--    a_height: the height of the picture.
			--
			-- Returns True if successful, False if not.
		require
			is_valid_av_pixel_format (a_pixel_format)
		do
			Result := avpicture_alloc (handle, a_pixel_format, a_width, a_height) = 0
		end

	deallocate, free_picture is
			-- Free the memory allocated for the picture but not the AVPicture
			-- structure itself
		do
			avpicture_free (handle)
		end

	size (a_pixel_format, a_width, a_height: INTEGER): INTEGER is
			-- Returns the amount of memory necessary for a picture
			-- `a_width' x `a_height' in `a_ pixel_format' format.
		require
			is_valid_av_pixel_format (a_pixel_format)
		do
			Result := avpicture_get_size (a_pixel_format, a_width, a_height)
		end

	linesize (a_channel: INTEGER): INTEGER is
		require
			a_channel.in_range (1, 4)
		do
			Result := av_picture_get_linesize (handle, a_channel - 1)
		end

	data (a_channel: INTEGER): POINTER is
		require
			is_valid_channel (a_channel)
		do
			Result := av_picture_get_data (handle, a_channel - 1)
		end

	is_valid_channel (a_channel: INTEGER): BOOLEAN is
		require
			a_channel.in_range (1, 4)
		do
			Result := av_picture_get_data (handle, a_channel - 1).is_not_null
		end

	num_channels: INTEGER is
		local
			i: INTEGER
		do
			from
				i := 0
			until
				i >= 4
			loop
				Result := Result + (av_picture_get_data (handle, i).is_not_null).to_integer
				i := i + 1
			end
		ensure
			Result.in_range (0, 4)
		end

feature {ANY} -- Size

	struct_size: INTEGER is
		external "C inline use <avcodec.h>"
		alias "sizeof(AVPicture)"
		end

end -- class AV_PICTURE
