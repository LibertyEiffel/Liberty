note
	description: "enum cairo_filter_t"
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli,
					Soluciones Informaticas Libres S.A. (Except),
					Cairo team
					
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
	date: "$Date:$"
	revision: "$Revision:$"
	wrapped_version: "1.2.4"

deferred class CAIRO_FILTER

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_filter (a_filter: INTEGER): BOOLEAN
		do
			Result := ((a_filter = cairo_filter_fast) or else
						(a_filter = cairo_filter_good) or else
						(a_filter = cairo_filter_best) or else
						(a_filter = cairo_filter_nearest) or else
						(a_filter = cairo_filter_bilinear) or else
						(a_filter = cairo_filter_gaussian))
		end

	cairo_filter_fast: INTEGER
			-- CAIRO_FILTER_FAST
		external "C macro use <pango.h>"
		alias "CAIRO_FILTER_FAST"
		end

	cairo_filter_good: INTEGER
			-- CAIRO_FILTER_GOOD
		external "C macro use <pango.h>"
		alias "CAIRO_FILTER_GOOD"
		end

	cairo_filter_best: INTEGER
			-- CAIRO_FILTER_BEST
		external "C macro use <pango.h>"
		alias "CAIRO_FILTER_BEST"
		end

	cairo_filter_nearest: INTEGER
			-- CAIRO_FILTER_NEAREST
		external "C macro use <pango.h>"
		alias "CAIRO_FILTER_NEAREST"
		end

	cairo_filter_bilinear: INTEGER
			-- CAIRO_FILTER_BILINEAR
		external "C macro use <pango.h>"
		alias "CAIRO_FILTER_BILINEAR"
		end

	cairo_filter_gaussian: INTEGER
			-- CAIRO_FILTER_GAUSSIAN
		external "C macro use <pango.h>"
		alias "CAIRO_FILTER_GAUSSIAN"
		end

end
