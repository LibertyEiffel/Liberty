note
	description: "The AVFormatParameters structure"
	copyright: "[
					Copyright (C) 2006-2022: Soluciones Informaticas Libres S.A. (Except)
					
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

class AV_FORMAT_PARAMETERS

inherit
	C_STRUCT
	EIFFEL_OWNED

create {ANY}
	make, from_external_pointer

feature {ANY} -- Size

	struct_size: INTEGER
		external "C inline use <avformat.h>"
		alias "sizeof(AVFormatParameters)"
		end

feature {ANY}

	make
		do
			allocate
		end

feature {ANY} -- Access

	sample_rate: INTEGER
		do
			Result := av_format_parameters_get_sample_rate (handle)
		end

	channels: INTEGER
		do
			Result := av_format_parameters_get_channels (handle)
		end

	width: INTEGER
		do
			Result := av_format_parameters_get_width (handle)
		end

	height: INTEGER
		do
			Result := av_format_parameters_get_height (handle)
		end

	initial_pause: BOOLEAN
		do
			Result := av_format_parameters_get_initial_pause (handle).to_boolean
		end

feature {ANY} -- Operations

	set_sample_rate (a_sample_rate: INTEGER)
		do
			av_format_parameters_set_sample_rate (handle, a_sample_rate)
		end

	set_channels (a_channels: INTEGER)
		do
			av_format_parameters_set_channels (handle, a_channels)
		end

	set_width (a_width: INTEGER)
		do
			av_format_parameters_set_width (handle, a_width)
		end

	set_height (a_height: INTEGER)
		do
			av_format_parameters_set_height (handle, a_height)
		end

	set_initial_pause (a_pause: BOOLEAN)
		do
			av_format_parameters_set_initial_pause (handle, a_pause.to_integer)
		end

feature {} -- Externals

	av_format_parameters_get_sample_rate (a_handle: POINTER): INTEGER
		external "C struct AVFormatParameters get sample_rate use <avformat.h>"
		end

	av_format_parameters_get_width (a_handle: POINTER): INTEGER
		external "C struct AVFormatParameters get width use <avformat.h>"
		end

	av_format_parameters_get_height (a_handle: POINTER): INTEGER
		external "C struct AVFormatParameters get height use <avformat.h>"
		end

	av_format_parameters_get_channels (a_handle: POINTER): INTEGER
		external "C struct AVFormatParameters get channels use <avformat.h>"
		end

	av_format_parameters_get_initial_pause (a_handle: POINTER): INTEGER
		external "C struct AVFormatParameters get initial_pause use <avformat.h>"
		end

	av_format_parameters_set_sample_rate (a_handle: POINTER; a_sample_rate: INTEGER)
		external "C struct AVFormatParameters set sample_rate use <avformat.h>"
		end

	av_format_parameters_set_channels (a_handle: POINTER; a_channels: INTEGER)
		external "C struct AVFormatParameters set channels use <avformat.h>"
		end

	av_format_parameters_set_width (a_handle: POINTER; a_width: INTEGER)
		external "C struct AVFormatParameters set width use <avformat.h>"
		end

	av_format_parameters_set_height (a_handle: POINTER; a_height: INTEGER)
		external "C struct AVFormatParameters set height use <avformat.h>"
		end

	av_format_parameters_set_initial_pause (a_handle: POINTER; a_initial_pause: INTEGER)
		external "C struct AVFormatParameters set intial_pause use <avformat.h>"
		end

end -- class AV_FORMAT_PARAMETERS
