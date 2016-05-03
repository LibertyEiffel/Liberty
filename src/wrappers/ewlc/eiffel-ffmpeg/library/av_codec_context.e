note
	description: "The AVCodecContext structure and methods to work with it"
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

class AV_CODEC_CONTEXT

inherit
	C_STRUCT

insert
	AV_CODEC_CONTEXT_EXTERNALS
	AV_PIXEL_FORMATS
	AV_CODEC_TYPES
	AV_DISCARD
	AV_CODEC_IDS
	AV_CODEC_FINDER 
		undefine copy, is_equal end

create {ANY}
	make, from_external_pointer

feature {} -- Creation

	make is
			-- creates a new AV_CODEC_CONTEXT and sets it to default values
		do
			handle := avcodec_alloc_context
		end

feature {ANY} -- Access

	type: INTEGER is
		do
			Result := av_codec_context_get_codec_type (handle)
		ensure
			is_valid_codec_type (Result)
		end

	width: INTEGER is
			-- picture width
		do
			Result := av_codec_context_get_width (handle)
		end

	height: INTEGER is
			-- picture width
		do
			Result := av_codec_context_get_height (handle)
		end

	sample_rate: INTEGER is
			-- samples per sec
		do
			Result := av_codec_context_get_height (handle)
		end

	channels: INTEGER is
		do
			Result := av_codec_context_get_channels (handle)
		end

	frame_size: INTEGER is
			-- samples per packet.
			-- Initialized when calling `init'
		do
			Result := av_codec_context_get_frame_size (handle)
		end

	frame_number: INTEGER is
			-- audio or video frame number
		do
			Result := av_codec_context_get_frame_number (handle)
		end

	real_pict_num: INTEGER is
			-- returns the real picture number of previous encoded frame
		do
			Result := av_codec_context_get_real_pict_num (handle)
		end

	qcompress: REAL is
			-- amount of qscale change between easy & hard scenes
		do
			Result := av_codec_context_get_qcompress (handle)
		ensure
			Result.in_range (0.0, 1.0)
		end

	qblur: REAL is
			-- amount of qscale smoothing over time
		do
			Result := av_codec_context_get_qblur (handle)
		ensure
			Result.in_range (0.0, 1.0)
		end

	skip_idct: INTEGER is
			-- Set by user when decoding
		do
			Result := av_codec_context_get_skip_idct (handle)
		ensure
			is_valid_av_discard (Result)
		end

	skip_frame: INTEGER is
			-- Set by user when decoding
		do
			Result := av_codec_context_get_skip_frame (handle)
		ensure
			is_valid_av_discard (Result)
		end

	skip_loop_filter: INTEGER is
			-- Set by user when decoding
		do
			Result := av_codec_context_get_skip_loop_filter (handle)
		ensure
			is_valid_av_discard (Result)
		end

	bits_per_sample: INTEGER is
			-- bits per sample/pixel from the demuxer (needed for huffyuv).
			--   * encoding: set by lavc
			--   * decoding: set by user 
		do
			Result := av_codec_context_get_bits_per_sample (handle)
		end

	thread_count: INTEGER is
			-- Thread count.
			-- is used to decide how many independant tasks should be passed
			-- to execute()
			--   * encoding: set by user
			--   * decoding: set by user
		do
			Result := av_codec_context_get_thread_count (handle)
		end

	codec_id: INTEGER is
		do
			Result := av_codec_context_get_codec_id (handle)
		ensure
			is_valid_av_codec_id (Result)
		end

	codec: AV_CODEC is
		local codec_ptr: POINTER
		do
			codec_ptr := av_codec_context_get_codec(handle)
			check codec_ptr.is_not_null end
			Result := wrapper(codec_ptr) -- create Result.from_external_pointer(codec_ptr)
		end

	pix_fmt: INTEGER is
		do
			Result := av_codec_context_get_pix_fmt (handle)
		ensure
			is_valid_av_pixel_format (Result)
		end

feature {ANY} -- Operations

	close: BOOLEAN is
		do
			Result := avcodec_close (handle) = 0
		end

	set_thread_count (a_thread_count: INTEGER) is
		do
			av_codec_context_set_thread_count (handle, a_thread_count)
		end

	set_skip_idct (a_discard: INTEGER) is
		require
			is_valid_av_discard (a_discard)
		do
			av_codec_context_set_skip_idct (handle, a_discard)
		end

	set_skip_frame (a_discard: INTEGER) is
		require
			is_valid_av_discard (a_discard)
		do
			av_codec_context_set_skip_frame (handle, a_discard)
		end

	set_skip_loop_filter (a_discard: INTEGER) is
		require
			is_valid_av_discard (a_discard)
		do
			av_codec_context_set_skip_loop_filter (handle, a_discard)
		end

	set_bits_per_sample (a_bps: INTEGER) is
		do
			av_codec_context_set_bits_per_sample (handle, a_bps)
		end

	find_and_open_decoder: BOOLEAN is
			-- Attempts to find and open a decoder for `codec_id'.  Returns True on success.
		require
			is_valid_av_codec_id (codec_id) and codec_id /= codec_id_none
		local
			a_codec: AV_CODEC
		do
			a_codec := get_decoder (codec_id)
			if a_codec /= Void then
				Result := open (a_codec)
			end
		end

	find_and_open_encoder: BOOLEAN is
			-- Attempts to find and open a encoder for `codec_id'.  Returns True on success.
		require
			is_valid_av_codec_id (codec_id) and codec_id /= codec_id_none
		local
			a_codec: AV_CODEC
		do
			a_codec := get_encoder (codec_id)
			if a_codec.is_not_null then
				Result := open (a_codec)
			end
		end

	open (a_codec: AV_CODEC): BOOLEAN is
			-- Opens and inits `a_codec'.  Returns True on success.
		require
			a_codec /= Void
			a_codec.is_not_null
		do
			Result := avcodec_open (handle, a_codec.handle) = 0
		end

	got_picture: BOOLEAN is
			-- Returns true if the last call to decode_video completed a picture.
			-- Subsequent calls will return False once again, until another picture
			-- is decodec.
		do
			Result := internal_got_picture
			internal_got_picture := False
		end

	decode_video (a_picture: AV_FRAME; a_packet: AV_PACKET; a_offset: INTEGER): INTEGER is
			-- decode a frame.
			-- Parameters:
			--    * a_picture: The decoded picture will go here
			--    * a_packet: The encoded picture is taken from here
			--    * a_offset: Offset within a_packet's data
			-- Returns:
			--    -1 if error, otherwise return the number of bytes used. 
			-- This function sets got_picture to True if the picture was successfully decoded.
		local
			got_picture_int: INTEGER
		do
			Result := avcodec_decode_video (handle, a_picture.handle, $got_picture_int, a_packet.data + a_offset, a_packet.size - a_offset)
			internal_got_picture := got_picture_int.to_boolean
		end

feature {ANY} -- Disposing

	dispose is
		do
			--			if is_valid then
			--				if avcodec_close (handle) /= 0 then
			--					print ("Error in avcodec_close!%N")
			--				end
			--			end
			--			handle := default_pointer
		end

feature {} -- Internal

	internal_got_picture: BOOLEAN

feature {ANY} -- Size

	struct_size: INTEGER is
		external "C inline use <avformat.h>"
		alias "sizeof(AVCodecContext)"
		end

end -- class AV_CODEC_CONTEXT
