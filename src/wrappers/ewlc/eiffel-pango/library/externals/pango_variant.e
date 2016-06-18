note
	description: "An enumeration specifying capitalization variant of the font."
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class PANGO_VARIANT

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_pango_variant (a_variant :INTEGER): BOOLEAN
		do
			Result := ((a_variant = pango_variant_normal) or else
						(a_variant = pango_variant_small_caps))
		end

	pango_variant_normal: INTEGER
			-- A normal font.
		external "C macro use <pango/pango.h>"
		alias "PANGO_VARIANT_NORMAL"
		end

	pango_variant_small_caps: INTEGER
			-- A font with the lower case characters replaced by smaller
			-- variants of the capital characters.
		external "C macro use <pango/pango.h>"
		alias "PANGO_VARIANT_SMALL_CAPS"
		end

end -- class PANGO_VARIANT
