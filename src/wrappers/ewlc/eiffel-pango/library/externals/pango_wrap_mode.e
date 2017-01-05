note
	description: "Enum PangoWrapMode"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

	-- A PangoWrapMode describes how to wrap the lines of a PangoLayout
	-- to the desired width.

deferred class PANGO_WRAP_MODE

inherit ANY undefine is_equal, copy end

feature {ANY} -- enum

	is_valid_pango_wrap_mode (a_wrap_mode: INTEGER) : BOOLEAN
		do
			Result:=((a_wrap_mode = pango_wrap_word) or else
			         (a_wrap_mode = pango_wrap_char) or else
			         (a_wrap_mode = pango_wrap_word_char))
		end

	pango_wrap_word: INTEGER
			-- wrap lines at word boundaries.
		external "C macro use <pango/pango-layout.h>"
		alias "PANGO_WRAP_WORD"
		end

	pango_wrap_char: INTEGER
			-- wrap lines at character boundaries.
		external "C macro use <pango/pango-layout.h>"
		alias "PANGO_WRAP_CHAR"
		end

	pango_wrap_word_char: INTEGER
			-- wrap lines at word boundaries, but fall back to character
			-- boundaries if there is not enough space for a full word.
		external "C macro use <pango/pango-layout.h>"
		alias "PANGO_WRAP_WORD_CHAR"
		end

end -- PANGO_WRAP_MODE
