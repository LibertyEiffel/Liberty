note
	description: "enum cairo_format_t"
	copyright: "[
					Copyright (C) 2006-2022: Soluciones Informaticas Libres S.A. (Except),
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

deferred class CAIRO_FORMAT

	-- cairo_format_t is used to identify the memory format of image data.
	-- New entries may be added in future versions.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_cairo_format (a_format: INTEGER): BOOLEAN
		do
			Result := ((a_format = cairo_format_argb32) or else
						(a_format = cairo_format_rgb24) or else
						(a_format = cairo_format_a8) or else
						(a_format = cairo_format_a1))
		end

	cairo_format_argb32: INTEGER
			-- Each pixel is a 32-bit quantity, with alpha in the upper 8 bits,
			-- then red, then green, then blue. The 32-bit quantities are stored
			-- native-endian. Pre-multiplied alpha is used. (That is, 50%
			-- transparent red is 0x80800000, not 0x80ff0000.)
		external "C macro use <cairo.h>"
		alias "CAIRO_FORMAT_ARGB32"
		end

	cairo_format_rgb24: INTEGER
			-- Each pixel is a 32-bit quantity, with the upper 8 bits unused.
			-- Red, Green, and Blue are stored in the remaining 24 bits in that
			-- order.
		external "C macro use <cairo.h>"
		alias "CAIRO_FORMAT_RGB24"
		end

	cairo_format_a8: INTEGER
			-- Each pixel is a 8-bit quantity holding an alpha value.
		external "C macro use <cairo.h>"
		alias "CAIRO_FORMAT_A8"
		end

	cairo_format_a1: INTEGER
			-- Each pixel is a 1-bit quantity holding an alpha value. Pixels are
			-- packed together into 32-bit quantities. The ordering of the bits
			-- matches the endianess of the platform. On a big-endian machine,
			-- the first pixel is in the uppermost bit, on a little-endian
			-- machine the first pixel is in the least-significant bit.
		external "C macro use <cairo.h>"
		alias "CAIRO_FORMAT_A1"
		end

end -- class CAIRO_FORMAT
