indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

class PANGO_FONT
	-- Pango supports a flexible architecture where a particular
	-- rendering architecture can supply an implementation of
	-- fonts. The PangoFont structure represents an abstract
	-- rendering-system-indepent font. Pango provides routines to list
	-- available fonts, and to load a font of a given description.

inherit G_OBJECT

	-- Note: PangoFcFont is a know heir of PangoFont (at C level)

creation make, from_external_pointer
feature {} -- Creation
--             PangoFont;
-- #define     PANGO_TYPE_FONT
-- #define     PANGO_FONT                      (object)
-- #define     PANGO_IS_FONT                   (object)
-- PangoEngineShape* pango_font_find_shaper    (PangoFont *font,
--                                              PangoLanguage *language,
--                                              guint32 ch);
-- PangoFontDescription* pango_font_describe   (PangoFont *font);
-- PangoCoverage* pango_font_get_coverage      (PangoFont *font,
--                                              PangoLanguage *language);
-- void        pango_font_get_glyph_extents    (PangoFont *font,
--                                              PangoGlyph glyph,
--                                              PangoRectangle *ink_rect,
--                                              PangoRectangle *logical_rect);
-- PangoFontMetrics* pango_font_get_metrics    (PangoFont *font,
--                                              PangoLanguage *language);
-- PangoFontMap* pango_font_get_font_map       (PangoFont *font);


end -- class PANGO_FONT
