note
	description: "External calls for PANGO_CAIRO_CONTEXT"
	copyright: "[
					Copyright (C) 2007 Soluciones Informaticas Libres S.A. (Except),
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

deferred class PANGO_CAIRO_CONTEXT_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	pango_cairo_context_get_resolution  (a_context: POINTER): REAL
		external "C use <pango/pangocairo.h>"
		end

	pango_cairo_get_font_options (a_context: POINTER): POINTER
		external "C use <pango/pangocairo.h>"
		end

	pango_cairo_update_context (a_cairo, a_context: POINTER)
		external "C use <pango/pangocairo.h>"
		end

	pango_cairo_context_set_font_options (a_context, a_font_options: POINTER)
		external "C use <pango/pangocairo.h>"
		end

	pango_cairo_context_set_resolution (a_context: POINTER; a_dpi: REAL)
		external "C use <pango/pangocairo.h>"
		end

end -- class PANGO_CAIRO_CONTEXT_EXTERNALS
