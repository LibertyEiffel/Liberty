indexing
	description: "Cairo Renderier -- Allows Rendering with the Cairo backend"
	copyright: "[
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except),
					                   Cairo team
					
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

class PANGO_CAIRO_RENDERER

insert
	PANGO_CAIRO_RENDERER_EXTERNALS
	WRAPPER_HANDLER

create {ANY} for_cairo_context

feature {} -- Representation

	cairo: CAIRO_CONTEXT

feature {} -- Creation

	for_cairo_context (a_cairo_context: CAIRO_CONTEXT) is
		do
			cairo := a_cairo_context
		end

feature {ANY}  -- Operations

	error_underline_path (an_x, an_y, a_width, a_height: REAL) is
			-- Add a squiggly line to the current path in the cairo context that
			-- approximately covers the given rectangle in the style of an
			-- underline used to indicate a spelling error. (The width of the
			-- underline is rounded to an integer number of up/down segments
			-- and the resulting rectangle is centered in the original rectangle)
			--
			-- an_x: The X coordinate of one corner of the rectangle
			-- an_y: The Y coordinate of one corner of the rectangle
			-- a_width: Non-negative width of the rectangle
			-- a_height: Non-negative height of the rectangle
		require
			a_width >= 0
			a_height >= 0
		do
			pango_cairo_error_underline_path (cairo.handle, an_x, an_y, a_width, a_height)
		end

end -- class PANGO_CAIRO_RENDERER
