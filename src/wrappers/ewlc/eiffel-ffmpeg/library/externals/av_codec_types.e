note
	description: "Different valid options for a codec type"
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

deferred class AV_CODEC_TYPES

inherit
	ANY
		undefine copy, is_equal end

feature {}

	is_valid_codec_type (a_codec_type: INTEGER): BOOLEAN is
		do
			Result := ((a_codec_type = codec_type_unknown) or else
					   (a_codec_type = codec_type_video) or else
					   (a_codec_type = codec_type_audio) or else
					   (a_codec_type = codec_type_data) or else
					   (a_codec_type = codec_type_subtitle))
		end

	codec_type_unknown: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_TYPE_UNKNOWN"
		end

	codec_type_video: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_TYPE_VIDEO"
		end

	codec_type_audio: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_TYPE_AUDIO"
		end

	codec_type_data: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_TYPE_DATA"
		end

	codec_type_subtitle: INTEGER is
		external "C macro use <avcodec.h>"
		alias "CODEC_TYPE_SUBTITLE"
		end

end -- class AV_CODEC_TYPES
