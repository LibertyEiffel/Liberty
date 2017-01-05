note
	description: "External calls for PangoLayout"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, Pango team
					
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

deferred class PANGO_LAYOUT_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	pango_layout_get_text (a_layout: POINTER): POINTER
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_set_markup (a_layout, a_markup: POINTER; a_length: INTEGER)
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_set_text (a_layout, a_markup: POINTER; a_length: INTEGER)
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_set_attributes (a_layout, a_attrs: POINTER)
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_new (a_context: POINTER): POINTER
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_get_context (a_layout: POINTER): POINTER
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_context_changed (a_layout: POINTER)
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_get_size (a_layout, a_width, a_height: POINTER)
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_get_wrap (a_layout: POINTER): INTEGER
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_set_wrap (a_layout: POINTER; a_wrap_mode: INTEGER)
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_get_width (a_layout: POINTER): INTEGER
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_set_width (a_layout: POINTER; a_width: INTEGER)
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_get_alignment (a_layout: POINTER): INTEGER
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_set_alignment (a_layout: POINTER; an_alignment: INTEGER)
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_get_spacing (a_layout: POINTER): INTEGER
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_get_justify (a_layout: POINTER): INTEGER
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_set_justify (a_layout: POINTER; a_justify: INTEGER)
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_get_font_description (a_layout: POINTER): POINTER
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_set_font_description (a_layout, a_font_description: POINTER)
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_get_line_count (a_layout: POINTER): INTEGER
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_get_line (a_layout: POINTER; a_index: INTEGER): POINTER
		external "C use <pango/pango-layout.h>"
		end

end -- class PANGO_LAYOUT_EXTERNALS
