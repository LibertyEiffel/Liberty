note
	description: "External calls for using with AV_RATIONAL"
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


deferred class AV_RATIONAL_EXTERNALS

inherit
	ANY
		undefine copy, is_equal end

feature {} -- External calls

	av_rational_get_numerator (a_handle: POINTER): INTEGER
		external "C struct AVRational get num use <rational.h>"
		end

	av_rational_get_denominator (a_handle: POINTER): INTEGER
		external "C struct AVRational get den use <rational.h>"
		end

	av_rational_set_numerator (a_handle: POINTER; a_num: INTEGER)
		external "C struct AVRational set num use <rational.h>"
		end

	av_rational_set_denominator (a_handle: POINTER; a_den: INTEGER)
		external "C struct AVRational set den use <rational.h>"
		end

end -- class AV_RATIONAL_EXTERNALS
