note
	description: "The bits in a PANGO_FONT_MASK correspond to fields in a PangoFontDescription that have been set."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team,
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class PANGO_FONT_MASK

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_pango_font_mask (a_stretch :INTEGER): BOOLEAN
		do
			Result := a_stretch & ~pango_font_mask_all = 0
		end

	pango_font_mask_family: INTEGER
			-- the font family is specified.
		external "C macro use <pango/pango.h>"
		alias "PANGO_FONT_MASK_FAMILY"
		end

	pango_font_mask_style: INTEGER
			-- 	the font style is specified.
		external "C macro use <pango/pango.h>"
		alias "PANGO_FONT_MASK_STYLE"
		end

	pango_font_mask_variant: INTEGER
			-- the font variant is specified.
		external "C macro use <pango/pango.h>"
		alias "PANGO_FONT_MASK_VARIANT"
		end

	pango_font_mask_weight: INTEGER
			-- the font weight is specified.
		external "C macro use <pango/pango.h>"
		alias "PANGO_FONT_MASK_WEIGHT"
		end

	pango_font_mask_stretch: INTEGER
			-- the font stretch is specified.
		external "C macro use <pango/pango.h>"
		alias "PANGO_FONT_MASK_STRETCH"
		end

	pango_font_mask_size: INTEGER
			-- the font size is specified.
		external "C macro use <pango/pango.h>"
		alias "PANGO_FONT_MASK_SIZE"
		end

	pango_font_mask_gravity: INTEGER
			-- the font gravity is specified (Since: 1.16.)
		external "C macro use <pango/pango.h>"
		alias "PANGO_FONT_MASK_GRAVITY"
		end

	pango_font_mask_all: INTEGER
		do
			Result := pango_font_mask_family |
			          pango_font_mask_style |
			          pango_font_mask_variant |
			          pango_font_mask_weight |
			          pango_font_mask_stretch |
			          pango_font_mask_size |
			          pango_font_mask_gravity
		end

end -- class PANGO_FONT_MASK
