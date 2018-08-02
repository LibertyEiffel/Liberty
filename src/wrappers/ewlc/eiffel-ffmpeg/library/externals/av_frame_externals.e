note
	description: "External calls for using with AV_FRAME"
	copyright: "[
					Copyright (C) 2006-2018: Soluciones Informaticas Libres S.A. (Except)
					
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

deferred class AV_FRAME_EXTERNALS
	-- External calls for AVFrame

inherit
	ANY
		undefine copy, is_equal end

feature {ANY}

	avcodec_alloc_frame: POINTER
		external "C use <avcodec.h>"
		end

	av_frame_get_is_keyframe (a_frame: POINTER): INTEGER
		external "C struct AVFrame get key_frame use <avcodec.h>"
		end

	av_frame_get_pts (a_frame: POINTER): INTEGER
		external "C struct AVFrame get pts use <avcodec.h>"
		end

end -- class AV_FRAME_EXTERNALS
