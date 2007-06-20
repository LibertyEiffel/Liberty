indexing
	description: "the PangoUnderline enumeration is used to specify whether text should be underlined, and if so, the type of underlining."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

deferred class PANGO_UNDERLINE

inherit ANY undefine is_equal, copy end


feature {} -- enum
	is_valid_pango_underline (a_type :INTEGER): BOOLEAN is
		do	
			Result:=((a_type = pango_underline_none) or else
						(a_type = pango_underline_single) or else
						(a_type = pango_underline_double) or else
						(a_type = pango_underline_low) or else
						(a_type = pango_underline_error))
		end

	pango_underline_none: INTEGER is
			-- no underline should be drawn
		external "C macro use <pango/pango.h>"
		alias "PANGO_UNDERLINE_NONE"
		end

	pango_underline_single: INTEGER is
			-- a single underline should be drawn
		external "C macro use <pango/pango.h>"
		alias "PANGO_UNDERLINE_SINGLE"
		end

	pango_underline_double: INTEGER is
			-- a double underline should be drawn
		external "C macro use <pango/pango.h>"
		alias "PANGO_UNDERLINE_DOUBLE"
		end

	pango_underline_low: INTEGER is
			-- a single underline should be drawn at a position beneath
			-- the ink extents of the text being underlined. This should
			-- be used only for underlining single characters, such as
			-- for keyboard accelerators. PANGO_UNDERLINE_SINGLE should
			-- be used for extended portions of text.
		external "C macro use <pango/pango.h>"
		alias "PANGO_UNDERLINE_LOW"
		end

	pango_underline_error: INTEGER is
			-- a wavy underline should be drawn below. This underline is
			-- typically used to indicate an error such as a possilble
			-- mispelling; in some cases a contrasting color may
			-- automatically be used. This type of underlining is
			-- available since Pango 1.4.
		external "C macro use <pango/pango.h>"
		alias "PANGO_UNDERLINE_ERROR"
		end
	

feature {WRAPPER}

	pango_type_underline: INTEGER is
			-- The GObject type for PangoUnderline. (hint: when wrapped
			-- on 2006-07-12 it was pango_underline_get_type())
		external "C macro use <pango/pango.h>"
		alias "PANGO_TYPE_UNDERLINE"
		end
end
