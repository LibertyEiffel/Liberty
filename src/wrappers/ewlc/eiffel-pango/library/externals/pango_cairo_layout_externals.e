note
	description: "External calls for features of PANGO_CAIRO_LAYOUT"
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

deferred class PANGO_CAIRO_LAYOUT_EXTERNALS

inherit
	ANY
		undefine is_equal, copy end

feature {} -- External calls

	pango_cairo_create_layout (a_cairo: POINTER): POINTER is
		external "C use <pango/pangocairo.h>"
		end

	pango_cairo_show_layout (a_cairo, a_layout: POINTER) is
		external "C use <pango/pangocairo.h>"
		end

	pango_cairo_layout_path (a_cairo, a_layout: POINTER) is
		external "C use <pango/pangocairo.h>"
		end

	pango_cairo_update_layout (a_cairo, a_layout: POINTER) is
		external "C use <pango/pangocairo.h>"
		end

end -- class PANGO_CAIRO_LAYOUT_EXTERNALS
