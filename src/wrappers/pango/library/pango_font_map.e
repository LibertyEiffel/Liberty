indexing
	description: "PangoFontMap - Base class for font maps, should be inherited by the different renderers"
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli,
					Soluciones Informaticas Libres S.A. (Except),
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

deferred class PANGO_FONT_MAP

	-- Known Derived Interfaces: PangoFcFontMap, PangoCairoFontMap.

inherit
	G_OBJECT

insert
	PANGO_FONT_MAP_EXTERNALS

feature {ANY}

	get_shape_engine_type: STRING is
			-- Returns the render ID for shape engines for this fontmap.
			-- See the render_type of PANGO_ENGINE_INFO.
		do
			create Result.from_external_copy (pango_font_map_get_shape_engine_type (handle))
		end

end -- class PANGO_FONT_MAP
