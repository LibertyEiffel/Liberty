indexing
	description: "PANGO_CAIRO_FONT_MAP is an interface exported by font maps for use with Cairo. The actual type of the font map will depend on the particular font technology Cairo was compiled to use."
	copyright: "[
					Copyright (C) 2007 Soluciones Informaticas Libres S.A. (Except),
					Pango team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
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

class PANGO_CAIRO_LAYOUT

inherit
	PANGO_LAYOUT
		redefine make end

insert
	PANGO_CAIRO_LAYOUT_EXTERNALS
	WRAPPER_HANDLER

create {ANY}
	for_cairo, make

feature {} -- Creation

	make (a_context: PANGO_CAIRO_CONTEXT) is
		do
			Precursor (a_context)
		end

	for_cairo (a_cairo: CAIRO_CONTEXT) is
			-- Creates a layout object set up to match the current
			-- transformation and target surface of the Cairo context. This
			-- layout can then be used for text measurement with functions like
			-- PANGO_LAYOUT:'get_size' or drawing with functions like
			-- 'show_layout'. If you change the transformation or target surface
			-- for a_cairo, you need to call PANGO_CAIRO_LAYOUT:'update'
			--
			-- This function is the most convenient way to use Cairo with Pango,
			-- however it is slightly inefficient since it creates a separate
			-- PANGO_CONTEXT object for each layout. This might matter in an
			-- application that was laying out large amounts of text.
			--
		do
			from_external_pointer (pango_cairo_create_layout (a_cairo.handle))
		end

feature {ANY} -- Operations

	show_on_cairo (a_cairo: CAIRO_CONTEXT) is
			-- Draws a PangoLayoutLine in the specified CAIRO_CONTEXT. The
			-- top-left corner of the PANGO_LAYOUT will be drawn at the current
			-- point of the cairo context.
		do
			pango_cairo_show_layout (a_cairo.handle, handle)
		end

	show_path (a_cairo: CAIRO_CONTEXT) is
			-- Adds the text in a PANGO_LAYOUT to the current path in the
			-- specified cairo context. The top-left corner of the PangoLayout
			-- will be at the current point of the cairo context.
		do
			pango_cairo_layout_path (a_cairo.handle, handle)
		end

	update (a_cairo: CAIRO_CONTEXT) is
			-- Updates the private PANGO_CONTEXT of the current PANGO_CAIRO_LAYOUT
			-- to match the current transformation and target surface of a
			-- CAIRO CONTEXT.
		do
			pango_cairo_update_layout (a_cairo.handle, handle)
		end
end -- class PANGO_CAIRO_LAYOUT
