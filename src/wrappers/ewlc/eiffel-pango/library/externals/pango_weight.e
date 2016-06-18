note
	description: "An enumeration specifying the weight (boldness) of a font. This is a numerical value ranging from 100 to 900, but there are some predefined values"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team,
					Soluciones Informaticas Libres S.A. (Except)
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

deferred class PANGO_WEIGHT

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_pango_weight (a_weight: INTEGER): BOOLEAN
		do
			Result:= a_weight.in_range(100,900)
		end

	pango_weight_ultralight: INTEGER
			-- the ultralight weight (= 200)
		external "C macro use <pango/pango.h>"
		alias "PANGO_WEIGHT_HEAVY"
		end

	pango_weight_light: INTEGER
			-- the light weight (=300)
		external "C macro use <pango/pango.h>"
		alias "PANGO_WEIGHT_HEAVY"
		end

	pango_weight_normal: INTEGER
			-- the default weight (= 400)
		external "C macro use <pango/pango.h>"
		alias "PANGO_WEIGHT_HEAVY"
		end

	pango_weight_semibold: INTEGER
			-- a weight intermediate between normal and bold (=600)
		external "C macro use <pango/pango.h>"
		alias "PANGO_WEIGHT_HEAVY"
		end

	pango_weight_bold: INTEGER
			-- the bold weight (= 700)
		external "C macro use <pango/pango.h>"
		alias "PANGO_WEIGHT_HEAVY"
		end

	pango_weight_ultrabold: INTEGER
			-- the ultrabold weight (= 800)
		external "C macro use <pango/pango.h>"
		alias "PANGO_WEIGHT_HEAVY"
		end

	pango_weight_heavy: INTEGER
			-- the heavy weight (= 900)
		external "C macro use <pango/pango.h>"
		alias "PANGO_WEIGHT_HEAVY"
		end

end -- class PANGO_WEIGHT
