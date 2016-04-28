note
	description: "External calls for using with AV_PICTURE"
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

deferred class AV_PICTURE_EXTERNALS
	-- External calls for AVPicture

inherit
	ANY
		undefine copy, is_equal end

feature {} -- External calls

	av_picture_get_linesize (a_pict: POINTER; a_channel: INTEGER): INTEGER is
		external "C inline <avcodec.h>"
		alias "(((AVPicture *)$a_pict)->linesize[$a_channel])"
		end

	av_picture_get_data (a_pict: POINTER; a_channel: INTEGER): POINTER is
		external "C inline <avcodec.h>"
		alias "(((AVPicture *)$a_pict)->data[$a_channel])"
		end

	img_convert (a_dest: POINTER; a_dest_pix_fmt: INTEGER; a_src: POINTER;
					 a_src_pix_fmt, a_width, a_height: INTEGER): INTEGER is
		external "C use <avcodec.h>"
		end

	avpicture_alloc (a_pict: POINTER; a_pixel_format, a_width, a_height: INTEGER): INTEGER is
		external "C use <avcodec.h>"
		end

	avpicture_free (a_pict: POINTER) is
		external "C use <avcodec.h>"
		end

	avpicture_get_size (a_pixel_format, a_width, a_height: INTEGER): INTEGER is
		external "C use <avcodec.h>"
		end

end -- class AV_PICTURE_EXTERNALS
