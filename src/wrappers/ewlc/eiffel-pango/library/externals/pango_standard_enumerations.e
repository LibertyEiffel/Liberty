note
	description: "Enum "
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

deferred class PANGO_STANDARD_ENUMERATIONS

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
-- 	is_valid_ (a_ :INTEGER): BOOLEAN is
-- 		do	
-- 			Result:=()
-- 		end
-- enum PangoDirection

-- typedef enum {
--   PANGO_DIRECTION_LTR,
--   PANGO_DIRECTION_RTL,
--   PANGO_DIRECTION_TTB_LTR,
--   PANGO_DIRECTION_TTB_RTL,
--   PANGO_DIRECTION_WEAK_LTR,
--   PANGO_DIRECTION_WEAK_RTL,
--   PANGO_DIRECTION_NEUTRAL
-- } PangoDirection;

-- The PangoDirection type represents a direction in the Unicode bidirectional algorithm; not every value in this enumeration makes sense for every usage of PangoDirection; for example, the return value of pango_unichar_direction() and pango_find_base_dir() cannot be PANGO_DIRECTION_WEAK_LTR or PANGO_DIRECTION_WEAK_RTL, since every character is either neutral or has a strong direction; on the other hand PANGO_DIRECTION_NEUTRAL doesn't make sense to pass to pango_itemize_with_base_dir().

-- The PANGO_DIRECTION_TTB_LTR, PANGO_DIRECTION_TTB_RTL values come from an earlier interpretation of this enumeration as the writing direction of a block of text and are no longer used; See the Text module of the CSS3 spec for how vertical text is planned to be handled in a future version of Pango. The explanation of why PANGO_DIRECTION_TTB_LTR is treated as PANGO_DIRECTION_RTL can be found there as well.

-- PANGO_DIRECTION_LTR 	A strong left-to-right direction
-- PANGO_DIRECTION_RTL 	A strong right-to-left direction
-- PANGO_DIRECTION_TTB_LTR 	Deprecated value; treated the same as PANGO_DIRECTION_RTL.
-- PANGO_DIRECTION_TTB_RTL 	Deprecated value; treated the same as PANGO_DIRECTION_LTR
-- PANGO_DIRECTION_WEAK_LTR 	A weak left-to-right direction
-- PANGO_DIRECTION_WEAK_RTL 	A weak right-to-left direction
-- PANGO_DIRECTION_NEUTRAL 	No direction specified
-- end
end
