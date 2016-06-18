note
	description: "AVRationals are simply rational numbers, numerator and denominator"
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

class AV_RATIONAL

inherit
	C_STRUCT
	C_OWNED
		--	MIXED_MEMORY_HANDLING
	-- TODO: check memory handling

insert
	AV_RATIONAL_EXTERNALS

create {ANY}
	from_external_pointer

feature {ANY} -- Access

	numerator: INTEGER
		do
			Result := av_rational_get_numerator (handle)
		end

	denominator: INTEGER
		do
			Result := av_rational_get_denominator (handle)
		end

	to_real: REAL
		do
			Result := numerator / denominator
		end

feature {ANY} -- Operations

	set_numerator (a_num: INTEGER)
		do
			av_rational_set_numerator (handle, a_num)
		end

	set_denominator (a_den: INTEGER)
		do
			av_rational_set_denominator (handle, a_den)
		end

feature {ANY} -- Size

	struct_size: INTEGER
		external "C inline use <rational.h>"
		alias "sizeof(AVRational)"
		end

end -- class AV_RATIONAL
