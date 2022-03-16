note
	description: "External calls for PangoLayoutLine"
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class PANGO_LAYOUT_LINE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	pango_layout_line_ref (a_line: POINTER): POINTER
			-- PangoLayoutLine* pango_layout_line_ref      (PangoLayoutLine *line);
		external "C use <pango/pango-layout.h>"
		end

	pango_layout_line_unref (a_line: POINTER)
		-- void pango_layout_line_unref (PangoLayoutLine *line);
			external "C use <pango/pango-layout.h>"
		end


	pango_layout_line_get_layout (a_layout_line: POINTER): POINTER
		external "C struct PangoLayoutLine get layout use <pango/pango-layout.h>"
		end

	pango_layout_line_get_start_index (a_layout_line: POINTER): INTEGER
		external "C struct PangoLayoutLine get start_index use <pango/pango-layout.h>"
		end

	pango_layout_line_get_length (a_layout_line: POINTER): INTEGER
		external "C struct PangoLayoutLine get length use <pango/pango-layout.h>"
		end

	pango_layout_line_get_is_paragraph_start (a_layout_line: POINTER): INTEGER
		external "C struct PangoLayoutLine get is_paragraph_start use <pango/pango-layout.h>"
		end

	pango_layout_line_get_resolved_direction (a_layout_line: POINTER): INTEGER
		external "C struct PangoLayoutLine get resolved_dir use <pango/pango-layout.h>"
		end


end -- class PANGO_LAYOUT_LINE_EXTERNALS
