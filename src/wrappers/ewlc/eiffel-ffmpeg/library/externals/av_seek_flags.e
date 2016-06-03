note
	description: "Different valid seek flags"
	copyright: "[
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except)
					
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

deferred class AV_SEEK_FLAGS
	-- Flags used for seeking within streams

inherit
	ANY
		undefine copy, is_equal end

feature {ANY}

	is_valid_av_seek_flags (some_flags: INTEGER): BOOLEAN is
		do
			Result := some_flags & ~(av_seek_flag_any | av_seek_flag_backward | av_seek_flag_byte) = 0
		end

	av_seek_flag_any: INTEGER is
		external "C macro use <avcodec.h>"
		alias "AVSEEK_FLAG_ANY"
		end

	av_seek_flag_byte: INTEGER is
		external "C macro use <avcodec.h>"
		alias "AVSEEK_FLAG_BYTE"
		end

	av_seek_flag_backward: INTEGER is
		external "C macro use <avcodec.h>"
		alias "AVSEEK_FLAG_BACKWARD"
		end

end -- class AV_SEEK_FLAGS
