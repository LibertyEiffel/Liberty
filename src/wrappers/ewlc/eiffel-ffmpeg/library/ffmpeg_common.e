note
	description: "Common functions and constants for using FFMPEG"
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

class FFMPEG_COMMON
	-- This class calls the ffmpeg_init function that has to be called
	-- before any work can be done with FFmpeg, and other features needed by
	-- any FFmpeg program.

feature {ANY}

	ffmpeg_init
			-- call av_register_all and any other initialization for the video
			-- system
		once
			av_register_all
		end

	av_codec_version: STRING
		do
			Result := string_version_from_integer (av_codec_get_version)
		end

	av_format_version: STRING
		do
			Result := string_version_from_integer (av_format_get_version)
		end

	av_util_version: STRING
		do
			Result := string_version_from_integer (av_util_get_version)
		end

feature {} -- Utils

	string_version_from_integer (an_integer: INTEGER): STRING
		do
			Result := ((an_integer |>>> 16) & 255).to_string + "." +
			          ((an_integer |>>>  8) & 255).to_string + "." +
			          ((an_integer |>>>  0) & 255).to_string
		end

feature {} -- Externals

	av_register_all
			-- Don't call this method directly!! use ffmpeg_init instead
		external "C use <avformat.h>"
		end

	av_time_base: INTEGER
		external "C macro use <avcodec.h>"
		alias "AV_TIME_BASE"
		end

	av_nopts_value: INTEGER_64
		external "C macro use <avcodec.h>"
		alias "AV_NOPTS_VALUE"
		end

	av_codec_get_version: INTEGER
		external "C macro use <avcodec.h>"
		alias "LIBAVCODEC_VERSION_INT"
		end

	av_format_get_version: INTEGER
		external "C macro use <avformat.h>"
		alias "LIBAVFORMAT_VERSION_INT"
		end

	av_util_get_version: INTEGER
		external "C macro use <avutil.h>"
		alias "LIBAVUTIL_VERSION_INT"
		end

end -- class FFMPEG_COMMON
