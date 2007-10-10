indexing
	description: "AVRationals are simply rational numbers, numerator and denominator"
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

class AV_RATIONAL

inherit
	SHARED_C_STRUCT
		redefine
			from_external_pointer
		end

insert
	AV_RATIONAL_EXTERNALS

creation 
	from_external_pointer

feature {WRAPPER, WRAPPER_HANDLER} -- Creation

	from_external_pointer (a_ptr: POINTER) is
		do
			is_shared := True
			Precursor (a_ptr)
		end

feature -- Access

	numerator: INTEGER is
		do
			Result := av_rational_get_numerator (handle)
		end

	denominator: INTEGER is
		do
			Result := av_rational_get_denominator (handle)
		end

feature -- Operations

	set_numerator (a_num: INTEGER) is
		do
			av_rational_set_numerator (handle, a_num)
		end

	set_denominator (a_den: INTEGER) is
		do
			av_rational_set_denominator (handle, a_den)
		end

end -- class AV_RATIONAL
