note
	description: "External calls for using with AV_PACKET"
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

deferred class AV_PACKET_EXTERNALS

inherit
	ANY
		undefine copy, is_equal end

feature {} -- External calls

	av_packet_get_pts (a_packet: POINTER): INTEGER_64 is
		external "C struct AVPacket get pts use <avformat.h>"
		end

	av_packet_get_dts (a_packet: POINTER): INTEGER_64 is
		external "C struct AVPacket get dts use <avformat.h>"
		end

	av_packet_get_duration (a_packet: POINTER): INTEGER is
		external "C struct AVPacket get duration use <avformat.h>"
		end

	av_packet_get_pos (a_packet: POINTER): INTEGER_64 is
		external "C struct AVPacket get pos use <avformat.h>"
		end

	av_packet_get_size (a_packet: POINTER): INTEGER is
		external "C struct AVPacket get size use <avformat.h>"
		end

	av_packet_get_stream_index (a_packet: POINTER): INTEGER is
		external "C struct AVPacket get stream_index use <avformat.h>"
		end

	av_packet_get_data (a_packet: POINTER): POINTER is
		external "C struct AVPacket get data use <avformat.h>"
		end

	av_free_packet (a_packet: POINTER) is
		external "C use <avformat.h>"
		end

	av_dup_packet (a_packet: POINTER) is
		external "C use <avformat.h>"
		end

	av_init_packet (a_packet: POINTER) is
		external "C use <avformat.h>"
		end

	av_new_packet (a_packet: POINTER; a_payload_size: INTEGER): INTEGER is
		external "C use <avformat.h>"
		end

end -- class AV_PACKET_EXTERNALS
