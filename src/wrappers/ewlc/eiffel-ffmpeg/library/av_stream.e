note
	description: "The AVStream structure"
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

class AV_STREAM

inherit
	C_STRUCT
	C_OWNED
		--	MIXED_MEMORY_HANDLING
		-- EIFFEL_OWNED was used for a while but it seems that an
		-- AV_STREAM is handled differently. Perhaps it has
		-- MIXED_MEMORY_HANDLING but it should be investigated more
		-- throughtly.

insert
	AV_STREAM_EXTERNALS

create {ANY}
	from_external_pointer

feature {ANY} -- Access

	index: INTEGER
		do
			Result := av_stream_get_index (handle)
		end

	id: INTEGER
		do
			Result := av_stream_get_id (handle)
		end

	codec: AV_CODEC_CONTEXT
		do
			if wrapped_codec = Void then
				create wrapped_codec.from_external_pointer (av_stream_get_codec (handle))
			end
			Result := wrapped_codec
		end

	quality: REAL
		do
			Result := av_stream_get_quality (handle)
		end

	start_time: INTEGER_64
		do
			Result := av_stream_get_start_time (handle)
		end

	duration: INTEGER_64
		do
			Result := av_stream_get_duration (handle)
		end

	language: STRING
		do
			create Result.from_external_copy (av_stream_get_language (handle))
		end

	time_base: AV_RATIONAL
		do
			create Result.from_external_pointer (av_stream_get_time_base (handle))
		end

feature {ANY} -- Size

	struct_size: INTEGER
		external "C inline use <avformat.h>"
		alias "sizeof(AVStream)"
		end

feature {} -- Representation

	wrapped_codec: AV_CODEC_CONTEXT

end -- class AV_STREAM
