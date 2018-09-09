note
	description: "The AVFormatContext structure"
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

class AV_FORMAT_CONTEXT

inherit
	C_STRUCT
	EIFFEL_OWNED redefine dispose end
	
insert
	AV_FORMAT_CONTEXT_EXTERNALS
	AV_ERROR_CODES
	AV_SEEK_FLAGS
	AV_CODEC_TYPES

create {ANY}
	from_file

feature {} -- Creation

	make
		do
			handle := av_alloc_format_context
		end

	from_file (a_filename: STRING)
			-- Open the given filename and inspect it's headers.
		do
			error_code := av_open_input_file ($handle, a_filename.to_external,
								default_pointer, 0, parameters.handle)
		end

feature {ANY} -- Operations

	open_input_file (a_filename: STRING)
			-- Open a media file as input.
			--
			-- The codecs are not opened. Only the file header (if present) is read.
			-- The file format is autodetected.  Eventually we'll implement a way to
			-- force the file format.
			--
			-- Parameters:
			--	 a_filename:   filename to open.
			--	 a_parameters: additionnal parameters needed when opening the
			--				   file (Void if default)
			--
			-- Sets error_code on exit.
		do
			free (handle)
			error_code := av_open_input_file ($handle, a_filename.to_external,
									 default_pointer, 0, parameters.handle)
		end

	find_stream_info
			-- Read the beginning of the media file to get stream information.
			--
			-- This is useful for file formats with no headers such as MPEG.
			-- This function also compute the real frame rate in case of
			-- mpeg2 repeat frame mode.
			--
			-- Sets error_code if an error ocurred.
			--
			-- Todo:
			--	let user decide somehow what information is needed so we
			--	dont waste time geting stuff the user doesnt need
		require
			is_valid
		local
			error: INTEGER
		do
			error := av_find_stream_info (handle)
			error_code := error.min (av_error_noerror)
		end

	seek_frame (a_stream_index: INTEGER; a_timestamp: INTEGER_64; some_flags: INTEGER): BOOLEAN
			-- Seek to the key frame at `a_timestamp' in `stream_index'.
			-- Parameters:
			--	a_stream_index: If a_stream_index is (-1), a default stream
			--					is selected, and a_timestamp is automatically
			--					converted from AV_TIME_BASE units to the stream
			--					specific time_base.
			--	a_timestamp:	timestamp in AV_STREAM.time_base units or
			--					if there is no stream specified then in
			--					AV_TIME_BASE units
			--	some_flags:	 flags which select direction and seeking mode
			--
			-- Returns True on success
		require
			is_valid_av_seek_flags (some_flags)
		do
			Result := av_seek_frame (handle, a_stream_index, a_timestamp, some_flags) >= 0
		end

	read_frame (a_packet: AV_PACKET): INTEGER
			-- Return the next frame of a stream.
			-- The returned packet is valid until the next read_frame()
			-- or until close(). For video, the packet contains exactly
			-- one frame. For audio, it contains an integer number of
			-- frames if each frame has a known fixed size (e.g. PCM or
			-- ADPCM data). If the audio frames have a variable size
			-- (e.g. MPEG audio), then it contains one frame.
			--
			-- a_packet.pts, a_packet.dts and a_packet.duration are always
			-- set to correct values in av_time_base unit (and guessed if
			-- the format cannot provide them). a_packet.pts can be
			-- av_nopts_value if the video format has B frames, so it is
			-- better to rely on a_packet.dts if you do not decompress
			-- the payload.
			--
			-- Returns:
			--	0 if OK, < 0 if error or end of file. 
		do
			Result := av_read_frame (handle, a_packet.handle)
		end

	dump_format (a_index: INTEGER; a_filename: STRING; dump_output: BOOLEAN)
			-- Dump a log of the format onto file `a_filename'.
		do
			av_format_context_dump_format (handle, a_index, a_filename.to_external, dump_output.to_integer)
		end

	close
		do
			if handle.is_not_null then
				av_close_input_file (handle)
				handle:= default_pointer -- null
			end
		end

feature {ANY} -- Access

	error_code: INTEGER

	is_valid: BOOLEAN
			-- True if video is a valid video file
		do
			Result := error_code = av_error_noerror
		end

	filename: STRING
			-- Returns the filename of the video
		do
			create Result.from_external_copy (av_format_context_get_filename (handle))
		end

	title: STRING
			-- Returns the title of the video
		do
			create Result.from_external_copy (av_format_context_get_title (handle))
		end

	author: STRING
			-- Returns the author of the video
		do
			create Result.from_external_copy (av_format_context_get_author (handle))
		end

	comment: STRING
			-- Returns the comment of the video
		do
			create Result.from_external_copy (av_format_context_get_comment (handle))
		end

	year: INTEGER
		do
			Result := av_format_context_get_year (handle)
		end

	track: INTEGER
		do
			Result := av_format_context_get_track (handle)
		end

	streams: ARRAY [AV_STREAM]
		local
			nb_streams, stream_idx: INTEGER
			a_stream: AV_STREAM
		do
			if wrapped_streams = Void then
				nb_streams := av_format_context_get_nb_streams (handle)
				create wrapped_streams.make (0, nb_streams - 1)
				from
					stream_idx := 0
				until
					stream_idx >= nb_streams
				loop
					create a_stream.from_external_pointer (av_format_context_get_stream (handle, stream_idx))
					wrapped_streams.put (a_stream, stream_idx)
					stream_idx := stream_idx + 1
				end
			end
			Result := wrapped_streams
		end

	default_stream_index: INTEGER
			-- Returns the default stream index within the file
		do
			Result := av_find_default_stream_index (handle)
		end

	default_video_stream_width: INTEGER
			-- Returns the width of the default video stream
		require
			is_valid
		local
			a_stream: ITERATOR [AV_STREAM]
		do
			if (streams @ default_stream_index).codec.type = codec_type_video then
				Result := (streams @ default_stream_index).codec.width
			else
				from
					a_stream := streams.get_new_iterator
				until
					Result > 0 or a_stream.is_off
				loop
					if a_stream.item.codec.type = codec_type_video then
						Result := a_stream.item.codec.width
					end
					a_stream.next
				end
			end
		end

	default_video_stream_height: INTEGER
			-- Returns the height of the default video stream
		require
			is_valid
		local
			a_stream: ITERATOR [AV_STREAM]
		do
			if (streams @ default_stream_index).codec.type = codec_type_video then
				Result := (streams @ default_stream_index).codec.height
			else
				from
					a_stream := streams.get_new_iterator
				until
					Result > 0 or a_stream.is_off
				loop
					if a_stream.item.codec.type = codec_type_video then
						Result := a_stream.item.codec.height
					end
					a_stream.next
				end
			end
		end


	parameters: AV_FORMAT_PARAMETERS
		do
			if wrapped_parameters = Void then
				create wrapped_parameters.make
			end
			Result := wrapped_parameters
		end

	start_time: INTEGER_64
		do
			Result := av_format_context_get_start_time (handle)
		end

	duration: INTEGER_64
		do
			Result := av_format_context_get_duration (handle)
		end

	file_size: INTEGER_64
		do
			Result := av_format_context_get_file_size (handle)
		end

	bit_rate: INTEGER
		do
			Result := av_format_context_get_bit_rate (handle)
		end

	input_format: AV_INPUT_FORMAT
		do
			if wrapped_input_format = Void then
				create wrapped_input_format.from_external_pointer (av_format_context_get_iformat (handle))
			end
			Result := wrapped_input_format
		end


feature {ANY} -- Disposing

	dispose
		do
			-- wrapped_streams items shall not be disposed because this
			-- shall be handled by the garbage collector; in fact a
			-- reference to some of those streams could be used
			-- elsewhere. Paolo 2008-04-20
			
			--if wrapped_streams /= Void then
			-- from i := wrapped_streams.lower
			-- until	i > wrapped_streams.upper
			--	loop
			--		if wrapped_streams.item (i) /= Void then
			--			wrapped_streams.item (i).dispose
			--		end
			--		i := i + 1
			--	end
			--end
			close
			Precursor
		end

feature {} -- Representation

	wrapped_parameters: AV_FORMAT_PARAMETERS

	wrapped_input_format: AV_INPUT_FORMAT

	wrapped_streams: ARRAY [AV_STREAM]

feature {ANY} -- Size

	struct_size: INTEGER
		external "C inline use <avformat.h>"
		alias "sizeof(AVFormatContext)"
		end

invariant

	error_codes_le_zero: error_code <= 0

end -- class AV_FORMAT_CONTEXT
