note
	description: "Enum PangoAlignment"
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, Pango team
					
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

	-- A PangoAlignment describes how to align the lines of a PangoLayout
	-- within the available space. If the PangoLayout is set to justify
	-- using my_layout.set_justify(), this only has effect for partial lines.

deferred class PANGO_ALIGNMENT

inherit ANY undefine is_equal, copy end

feature {ANY} -- enum

	is_valid_pango_alignment (an_alignment: INTEGER) : BOOLEAN
		do
			Result:=((an_alignment = pango_align_left) or else
			         (an_alignment = pango_align_center) or else
			         (an_alignment = pango_align_right))
		end

	pango_align_left: INTEGER
			-- Put all available space on the right
		external "C macro use <pango/pango-layout.h>"
		alias "PANGO_ALIGN_LEFT"
		end

	pango_align_center: INTEGER
			-- Center the line within the available space
		external "C macro use <pango/pango-layout.h>"
		alias "PANGO_ALIGN_CENTER"
		end

	pango_align_right: INTEGER
			-- Put all available space on the left
		external "C macro use <pango/pango-layout.h>"
		alias "PANGO_ALIGN_RIGHT"
		end

end -- PANGO_ALIGNMENT
