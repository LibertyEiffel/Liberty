note
	description: "The AVFrame structure"
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

class AV_FRAME

inherit
	AV_PICTURE
		redefine struct_size end

insert
	AV_FRAME_EXTERNALS

create {ANY}
	make

feature {} -- Creation

	make is
		do
			handle := avcodec_alloc_frame
		end

feature {ANY} -- Access

	is_keyframe: BOOLEAN is
		do
			Result := av_frame_get_is_keyframe (handle).to_boolean
		end

	pts: INTEGER_64 is
		do
			Result := av_frame_get_pts (handle)
		end

feature {ANY} -- Size

	struct_size: INTEGER is
		external "C inline use <avcodec.h>"
		alias "sizeof(AVFrame)"
		end

end -- class AV_FRAME
