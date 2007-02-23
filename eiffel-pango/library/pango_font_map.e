indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Pango team
					
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

class PANGO_FONT_MAP

inherit G_OBJECT

	-- NOTE: PangoFcFontMap is a know heir of PangoFontMap (at C level).

	-- Known Derived Interfaces: PangoFontMap is required by
	-- PangoCairoFontMap.

creation make, from_external_pointer

feature {} -- Creation

--             PangoFontMap;
-- #define     PANGO_TYPE_FONT_MAP
-- #define     PANGO_FONT_MAP                  (object)
-- #define     PANGO_IS_FONT_MAP               (object)
--             PangoFontMapClass;
-- #define     PANGO_FONT_MAP_CLASS            (klass)
-- #define     PANGO_IS_FONT_MAP_CLASS         (klass)
-- #define     PANGO_FONT_MAP_GET_CLASS        (obj)e

-- PangoFont*  pango_font_map_load_font        (PangoFontMap *fontmap,
--                                              PangoContext *context,
--                                              const PangoFontDescription 
--                                              *desc);
-- PangoFontset* pango_font_map_load_fontset   (PangoFontMap *fontmap,
--                                              PangoContext *context,
--                                              const PangoFontDescription *desc,
--                                              PangoLanguage *language);
-- void        pango_font_map_list_families    (PangoFontMap *fontmap,
--                                              PangoFontFamily ***families,
--                                              int *n_families);
-- const char* pango_font_map_get_shape_engine_type
--                                             (PangoFontMap *fontmap);

end -- class PANGO_FONT_MAP
