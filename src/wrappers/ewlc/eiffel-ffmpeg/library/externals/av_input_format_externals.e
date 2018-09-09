note
	description: "External calls for using with AV_INPUT_FORMAT"
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

deferred class AV_INPUT_FORMAT_EXTERNALS
	-- External calls for AV_INPUT_FORMAT

inherit
	ANY
		undefine copy, is_equal end

feature {} -- External Calls

	av_input_format_get_name (a_format: POINTER): POINTER
		external "C struct AVInputFormat get name use <avformat.h>"
		end

	av_input_format_get_long_name (a_format: POINTER): POINTER
		external "C struct AVInputFormat get long_name use <avformat.h>"
		end

end -- class AV_INPUT_FORMAT_EXTERNALS
