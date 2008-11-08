indexing
	description: "."
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli
					
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

deferred class PANGO
	-- This class is inserted by GTK_MAIN and other libraries requiring
	-- PANGO to invoke `store_pango_creation_agents'.

insert SHARED_CREATION_DICTIONARY undefine default_create end

feature {} -- Creation agents
	store_pango_creation_agents is
		once
			creation_agents.put (agent create_pango_context , "PangoContext")
			creation_agents.put (agent create_pango_layout , "PangoLayout")
			creation_agents.put (agent create_pango_font , "PangoFont")
			creation_agents.put (agent create_pango_font_face , "PangoFontFace")
			creation_agents.put (agent create_pango_font_family , "PangoFontFamily")
			creation_agents.put (agent create_pango_font_set_simple , "PangoFontSetSimple")
			creation_agents.put (agent create_pango_cairo_font_map,"PangoCairoFontMap")
			-- creation_agents.put (agent create_ , "")
		end

		create_pango_context (p: POINTER): PANGO_CONTEXT is do create Result.from_external_pointer(p) end
		create_pango_layout (p: POINTER): PANGO_LAYOUT is do create Result.from_external_pointer(p) end
		create_pango_font (p: POINTER): PANGO_FONT is do create Result.from_external_pointer(p) end
		create_pango_font_face (p: POINTER): PANGO_FONT_FACE is do create Result.from_external_pointer(p) end
		create_pango_font_family (p: POINTER): PANGO_FONT_FAMILY is do create Result.from_external_pointer(p) end
		create_pango_font_set_simple (p: POINTER): PANGO_FONT_SET_SIMPLE is do create Result.from_external_pointer(p) end
		create_pango_cairo_font_map (p: POINTER): PANGO_CAIRO_FONT_MAP is do create Result.from_external_pointer(p) end
		--create_pango_ (p: POINTER): PANGO_ is do create Result.from_external_pointer(p) end
	
end -- class PANGO
