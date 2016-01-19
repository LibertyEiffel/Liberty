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

class PANGO_CAIRO_FONT_MAP
	-- PANGO_CAIRO_FONT_MAP is an interface exported by font maps for
	-- use with Cairo. The actual type of the font map will depend on
	-- the particular font technology Cairo was compiled to use.

inherit
	PANGO_FONT_MAP

insert
	PANGO_CAIRO_FONT_MAP_EXTERNALS

create {ANY}
	make, make_default, from_external_pointer

feature {} -- Creation

	make is
			-- Creates a new PANGO_CAIRO_FONT_MAP object; a fontmap is used to
			-- cache information about available fonts, and holds certain global
			-- parameters such as the resolution. In most cases, you can use
			-- PANGO_CAIRO_RENDERER.default_font_map instead.
			
			-- Note that the type of the returned object will depend on the
			-- particular font backend Cairo was compiled to use; You generally
			-- should only use the PANGO_FONT_MAP and PANGO_CAIRO_FONT_MAP
			-- interfaces on the object.
		do
			from_external_pointer (pango_cairo_font_map_new)
			
		end

	make_default is
			-- Gets a default font map to use with Cairo.
			-- Returns the default Cairo fontmap for Pango. This object is owned
			-- by Pango and must not be freed.
		do
			from_external_pointer (pango_cairo_font_map_get_default)
		end

feature {ANY} -- Operations

	set_resolution (a_dpi: REAL) is
			-- Sets the resolution for the fontmap. This is a scale factor
			-- between points specified in a PANGO_FONT_DESCRIPTION and Cairo
			-- units. The default value is 96, meaning that a 10 point font
			-- will be 13 units high. (10 * 96. / 72. = 13.3).
			--
			-- a_dpi: the resolution in "dots per inch". (Physical inches aren't
			--        actually involved; the terminology is conventional.)
		do
			pango_cairo_font_map_set_resolution (handle, a_dpi)
		end

feature {ANY} -- Access

	resolution: REAL is
			-- Gets the resolution for the fontmap. See 'set_resolution'
		do
			Result := pango_cairo_font_map_get_resolution (handle)
		end

	create_context: PANGO_CAIRO_CONTEXT is
			-- Create a PangoContext for the given fontmap.
		do
			create Result.from_external_pointer (pango_cairo_font_map_create_context (handle))
		end

feature {} -- Implementation
	struct_size: INTEGER is
		external "C inline use <pango/pango.h>"
		alias "sizeof(PangoCairoFontMap)"
		end
	
end -- class PANGO_CAIRO_FONT_MAP
