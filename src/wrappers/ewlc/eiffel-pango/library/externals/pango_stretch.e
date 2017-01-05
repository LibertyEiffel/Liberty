note
	description: "An enumeration specifying the width of the font relative to other designs within a family. "
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team,
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

deferred class PANGO_STRETCH

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_pango_stretch (a_stretch :INTEGER): BOOLEAN
		do
			Result := ((a_stretch = pango_stretch_ultra_condensed) or else
						(a_stretch = pango_stretch_extra_condensed) or else
						(a_stretch = pango_stretch_condensed) or else
						(a_stretch = pango_stretch_semi_condensed) or else
						(a_stretch = pango_stretch_normal) or else
						(a_stretch = pango_stretch_semi_expanded) or else
						(a_stretch = pango_stretch_expanded) or else
						(a_stretch = pango_stretch_extra_expanded) or else
						(a_stretch = pango_stretch_ultra_expanded))
		end

	pango_stretch_ultra_condensed: INTEGER
			-- ultra condensed width
		external "C macro use <pango/pango.h>"
		alias "PANGO_STRETCH_ULTRA_CONDENSED"
		end

	pango_stretch_extra_condensed: INTEGER
			-- extra condensed width
		external "C macro use <pango/pango.h>"
		alias "PANGO_STRETCH_EXTRA_CONDENSED"
		end

	pango_stretch_condensed: INTEGER
		-- condensed width
		external "C macro use <pango/pango.h>"
		alias "PANGO_STRETCH_CONDENSED"
		end

	pango_stretch_semi_condensed: INTEGER
			-- semi condensed width
		external "C macro use <pango/pango.h>"
		alias "PANGO_STRETCH_SEMI_CONDENSED"
		end

	pango_stretch_normal: INTEGER
			-- the normal width
		external "C macro use <pango/pango.h>"
		alias "PANGO_STRETCH_NORMAL"
		end

	pango_stretch_semi_expanded: INTEGER
			-- semi expanded width
		external "C macro use <pango/pango.h>"
		alias "PANGO_STRETCH_SEMI_EXPANDED"
		end

	pango_stretch_expanded: INTEGER
			-- expanded width
		external "C macro use <pango/pango.h>"
		alias "PANGO_STRETCH_EXPANDED"
		end

	pango_stretch_extra_expanded: INTEGER
			-- extra expanded width
		external "C macro use <pango/pango.h>"
		alias "PANGO_STRETCH_EXTRA_EXPANDED"
		end

	pango_stretch_ultra_expanded: INTEGER
			-- ultra expanded width
		external "C macro use <pango/pango.h>"
		alias "PANGO_STRETCH_ULTRA_EXPANDED"
		end

	pango_type_stretch: INTEGER
		external "C macro use <pango/pango.h>"
		alias "PANGO_TYPE_STRETCH"
		end

end -- class PANGO_STRETCH
