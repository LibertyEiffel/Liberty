note
	description: "Enum PangoDirection"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, Pango team
					
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

	-- The PangoDirection type represents a direction in the Unicode bidirectional algorithm;
	-- not every value in this enumeration makes sense for every usage of PANGO_DIRECTION;
	-- for example, the return value of pango_unichar_direction() and pango_find_base_dir()
	-- cannot be PANGO_DIRECTION_WEAK_LTR or PANGO_DIRECTION_WEAK_RTL, since every character is
	-- either neutral or has a strong direction; on the other hand PANGO_DIRECTION_NEUTRAL
	-- doesn't make sense to pass to pango_itemize_with_base_dir().
	--
	-- The PANGO_DIRECTION_TTB_LTR, PANGO_DIRECTION_TTB_RTL values come from an earlier
	-- interpretation of this enumeration as the writing direction of a block of text and are no
	-- longer used; See PANGO_GRAVITY for how vertical text is handled in Pango.


deferred class PANGO_DIRECTION

inherit ANY undefine is_equal, copy end

feature {ANY} -- enum

	is_valid_pango_direction (a_direction: INTEGER) : BOOLEAN
		do
			Result:=((a_direction = pango_direction_ltr) or else
			         (a_direction = pango_direction_rtl) or else
			         (a_direction = pango_direction_ttb_ltr) or else
			         (a_direction = pango_direction_ttb_rtl) or else
			         (a_direction = pango_direction_weak_ltr) or else
			         (a_direction = pango_direction_weak_rtl) or else
			         (a_direction = pango_direction_neutral))
		end

	pango_direction_ltr: INTEGER
			-- A strong left-to-right direction
		external "C macro use <pango/pango.h>"
		alias "PANGO_DIRECTION_LTR"
		end

	pango_direction_rtl: INTEGER
			-- A strong right-to-left direction
		external "C macro use <pango/pango.h>"
		alias "PANGO_DIRECTION_RTL"
		end

	pango_direction_ttb_ltr: INTEGER
			-- Deprecated value; treated the same as pango_direction_rtl.
		external "C macro use <pango/pango.h>"
		alias "PANGO_DIRECTION_TTB_LTR"
		end

	pango_direction_ttb_rtl: INTEGER
			-- Deprecated value; treated the same as pango_direction_ltr.
		external "C macro use <pango/pango.h>"
		alias "PANGO_DIRECTION_TTB_RTL"
		end

	pango_direction_weak_ltr: INTEGER
			-- A weak left-to-right direction
		external "C macro use <pango/pango.h>"
		alias "PANGO_DIRECTION_WEAK_LTR"
		end

	pango_direction_weak_rtl: INTEGER
			-- A weak right-to-left direction
		external "C macro use <pango/pango.h>"
		alias "PANGO_DIRECTION_WEAK_RTL"
		end

	pango_direction_neutral: INTEGER
			-- No direction specified
		external "C macro use <pango/pango.h>"
		alias "PANGO_DIRECTION_NEUTRAL"
		end

end -- class PANGO_DIRECTION
