note
	description: "External calls for using with AV_FORMAT_CONTEXT"
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


deferred class AV_FORMAT_CONTEXT_EXTERNALS

inherit
	ANY
		undefine copy, is_equal end

feature {} -- External calls

	av_format_context_get_iformat (a_context: POINTER): POINTER is
		external "C struct AVFormatContext get iformat use <avformat.h>"
		end

	av_format_context_get_filename (a_context: POINTER): POINTER is
		external "C inline use <avformat.h>"
		alias "&(((AVFormatContext *)$a_context)->filename)"
		end

	av_format_context_get_title (a_context: POINTER): POINTER is
		external "C inline use <avformat.h>"
		alias "&(((AVFormatContext *)$a_context)->title)"
		end

	av_format_context_get_author (a_context: POINTER): POINTER is
		external "C inline use <avformat.h>"
		alias "&(((AVFormatContext *)$a_context)->author)"
		end

	av_format_context_get_comment (a_context: POINTER): POINTER is
		external "C inline use <avformat.h>"
		alias "&(((AVFormatContext *)$a_context)->comment)"
		end

	av_format_context_get_year (a_context: POINTER): INTEGER is
		external "C struct AVFormatContext get year use <avformat.h>"
		end

	av_format_context_get_track (a_context: POINTER): INTEGER is
		external "C struct AVFormatContext get track use <avformat.h>"
		end

	av_format_context_get_nb_streams (a_context: POINTER): INTEGER is
		external "C struct AVFormatContext get nb_streams use <avformat.h>"
		end

	av_format_context_get_start_time (a_context: POINTER): INTEGER_64 is
		external "C struct AVFormatContext get start_time use <avformat.h>"
		end

	av_format_context_get_duration (a_context: POINTER): INTEGER_64 is
		external "C struct AVFormatContext get duration use <avformat.h>"
		end

	av_format_context_get_file_size (a_context: POINTER): INTEGER_64 is
		external "C struct AVFormatContext get file_size use <avformat.h>"
		end

	av_format_context_get_bit_rate (a_context: POINTER): INTEGER is
		external "C struct AVFormatContext get bit_rate use <avformat.h>"
		end

	av_format_context_get_stream (a_context: POINTER; a_index: INTEGER): POINTER is
		external "C inline use <avformat.h>"
		alias "((AVFormatContext*)$a_context)->streams[$a_index]"
		end

	av_open_input_file (a_context_pointer, a_filename, a_input_format_dummy: POINTER;
						a_buffer_size_dummy: INTEGER; a_parameters: POINTER): INTEGER is
		external "C use <avformat.h>"
		end

	av_close_input_file (a_context: POINTER) is
		external "C use <avformat.h>"
		end

	av_find_default_stream_index (a_context: POINTER): INTEGER is
		external "C use <avformat.h>"
		end

	av_find_stream_info (a_context: POINTER): INTEGER is
		external "C use <avformat.h>"
		end

	av_alloc_format_context: POINTER is
		external "C use <avformat.h>"
		end

	av_seek_frame (a_context: POINTER; a_stream_index: INTEGER;
					 a_timestamp: INTEGER_64; some_flags: INTEGER): INTEGER is
		external "C use <avformat.h>"
		end

	av_read_frame (a_context, a_packet: POINTER): INTEGER is
		external "C use <avformat.h>"
		end

	av_format_context_dump_format (a_context_pointer: POINTER; a_index: INTEGER; a_filename: POINTER;
						dump_output: INTEGER) is
		external "C use <avformat.h>"
		alias "dump_format"
		end

end -- class AV_FORMAT_CONTEXT_EXTERNALS
