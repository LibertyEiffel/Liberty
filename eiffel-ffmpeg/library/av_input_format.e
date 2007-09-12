indexing
	description: "The AVInputFormat structure"
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

class AV_INPUT_FORMAT

inherit
	SHARED_C_STRUCT
		redefine from_external_pointer end

insert
	AV_INPUT_FORMAT_EXTERNALS

creation dummy,
	from_external_pointer

feature {WRAPPER, WRAPPER_HANDLER} -- Creation

	from_external_pointer (a_ptr: POINTER) is
		do
			Precursor (a_ptr)
			set_shared
		end

feature -- Access

	name: STRING is
		do
			create Result.from_external_copy (av_input_format_get_name (handle))
		end

	long_name: STRING is
		do
			create Result.from_external_copy (av_input_format_get_name (handle))
		end

feature -- Size

	struct_size: INTEGER is
		external "C inline use <avformat.h>"
		alias "sizeof(AVInputFormat)"
		end

end -- class AV_INPUT_FORMAT
