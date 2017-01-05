note
	description: "External calls for using with AV_STREAM"
	copyright: "[
					Copyright (C) 2006-2017: Soluciones Informaticas Libres S.A. (Except)
					
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

deferred class AV_STREAM_EXTERNALS
	-- External calls for AVStream

inherit
	ANY
		undefine copy, is_equal end

feature {} -- External calls

	av_stream_get_index (a_stream: POINTER): INTEGER
		external "C struct AVStream get index use <avformat.h>"
		end

	av_stream_get_id (a_stream: POINTER): INTEGER
		external "C struct AVStream get id use <avformat.h>"
		end

	av_stream_get_codec (a_stream: POINTER): POINTER
		external "C struct AVStream get codec use <avformat.h>"
		end

	av_stream_get_quality (a_stream: POINTER): REAL
		external "C struct AVStream get quality use <avformat.h>"
		end

	av_stream_get_start_time (a_stream: POINTER): INTEGER_64
		external "C struct AVStream get start_time use <avformat.h>"
		end

	av_stream_get_duration (a_stream: POINTER): INTEGER_64
		external "C struct AVStream get duration use <avformat.h>"
		end

	av_stream_get_time_base (a_stream: POINTER): POINTER
		external "C inline use <avformat.h>"
		alias "&(((AVStream*)$a_stream)->time_base)"
		end

	av_stream_get_language (a_stream: POINTER): POINTER
		external "C inline use <avformat.h>"
		alias "&(((AVStream*)$a_stream)->language)"
		end

end -- class AV_STREAM_EXTERNALS
