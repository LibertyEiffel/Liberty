indexing
	description: "External calls for PangoLayout"
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
	date: "$Date:$"
	revision: "$Revision:$"

class PANGO_LAYOUT_EXTERNALS

feature {NONE} -- External calls

	pango_layout_get_text (a_layout: POINTER): POINTER is
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_set_markup (a_layout, a_markup: POINTER; a_length: INTEGER) is
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_set_text (a_layout, a_markup: POINTER; a_length: INTEGER) is
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_new (a_context: POINTER): POINTER is
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_get_context (a_layout: POINTER): POINTER is
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_context_changed (a_layout: POINTER) is
		external "C use <pango/pango-layout.h>"
		end

end -- class PANGO_LAYOUT_EXTERNALS
