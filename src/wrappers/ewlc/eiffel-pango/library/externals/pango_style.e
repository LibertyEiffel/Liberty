note
	description: "An enumeration specifying the various slant styles possible for a font."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli,
					Soluciones Informaticas Libres S.A. (Except),
					Pango team
					
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class PANGO_STYLE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_pango_style (a_style :INTEGER): BOOLEAN
		do
			Result:=((a_style = pango_style_normal) or else
						(a_style = pango_style_oblique) or else
						(a_style = pango_style_italic))
		end

	pango_style_normal: INTEGER
			-- the font is upright.
		external "C macro use <pango/pango.h>"
		alias "PANGO_STYLE_NORMAL"
		end

	pango_style_oblique: INTEGER
			-- the font is slanted, but in a roman style.
		external "C macro use <pango/pango.h>"
		alias "PANGO_STYLE_OBLIQUE"
		end

	pango_style_italic: INTEGER
			-- the font is slanted in an italic style.
		external "C macro use <pango/pango.h>"
		alias "PANGO_STYLE_ITALIC"
		end

end -- class PANGO_STYLE
