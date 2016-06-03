note
	description: "The AVPacket structure"
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

class AV_PACKET

inherit
	C_STRUCT

insert
	AV_PACKET_EXTERNALS
	AV_ERROR_CODES

create {ANY}
	make, from_external_pointer

feature {} -- Creation

	make is
		do
			allocate
			av_init_packet (handle)
		end

feature {ANY} -- Access

	pts: INTEGER_64 is
			-- presentation time stamp in time_base units
		do
			Result := av_packet_get_pts (handle)
		end

	dts: INTEGER_64 is
			-- decompression time stamp in time_base units
		do
			Result := av_packet_get_dts (handle)
		end

	duration: INTEGER is
			-- presentation duration in time_base units (0 if not available)
		do
			Result := av_packet_get_duration (handle)
		end

	pos: INTEGER_64 is
			-- byte position in stream, -1 if unknown
		do
			Result := av_packet_get_pos (handle)
		end

	size: INTEGER is
		do
			Result := av_packet_get_size (handle)
		end

	stream_index: INTEGER is
		do
			Result := av_packet_get_stream_index (handle)
		end

	data: POINTER is
			-- The actual packet's payload
		do
			Result := av_packet_get_data (handle)
		end

	error_code: INTEGER

feature {ANY} -- Operations

	duplicate is
			-- Duplicate this packet's payload so it won't become invalid with
			-- the next call to AV_FORMAT_CONTEXT.read_frame or .close
		do
			av_dup_packet (handle)
		end

	new, allocate_payload (a_payload_size: INTEGER) is
			-- Allocate the payload of a packet and intialized its fields
			-- to default values.
			-- Sets error_code to av_error_xxx on error.
		do
			error_code := av_new_packet (handle, a_payload_size)
		ensure
			is_valid_av_error_code (error_code)
		end

	free_payload is
			-- Dispose of the memory that's being used up by the demuxed packet.
			-- Call this after reading each frame, and before the next read.
		do
			av_free_packet (handle)
		end

feature {ANY} -- Destroying

	dispose  is
		do
			free_payload
			free (handle)
			handle:= default_pointer
		end

feature {ANY} -- Size

	struct_size: INTEGER is
		external "C inline use <avformat.h>"
		alias "sizeof(AVPacket)"
		end

end -- class AV_PACKET
