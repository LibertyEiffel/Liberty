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

insert PANGO_GLYPH

create {ANY} from_external_pointer, from_external_pointer_no_ref

feature {} -- Creation

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <pango/pango.h>"
		alias "sizeof(PangoFont)"
		end

feature {} -- External calls
	-- #define     PANGO_TYPE_FONT
	-- #define     PANGO_FONT                      (object)
	-- #define     PANGO_IS_FONT                   (object)
	
	pango_font_find_shaper (a_fontm a_language: POINTER; a_guint32: INTEGER_32): POINTER is
			-- PangoEngineShape* pango_font_find_shaper (PangoFont *font,
			-- PangoLanguage *language, guint32 ch);
		
			-- TODO: a_guint32 should be a NATURAL_32
		external "C use <pango/pango.h>"
		end

	pango_font_describe  (a_font: POINTER; ): POINTER is
			-- PangoFontDescription* pango_font_describe   (PangoFont *font);
		external "C use <pango/pango.h>"
		end

	pango_font_get_coverage (a_font, a_language: POINTER): POINTER is
			-- PangoCoverage* pango_font_get_coverage (PangoFont *font,
			-- PangoLanguage *language);
		external "C use <pango/pango.h>"
		end
	
	pango_font_get_glyph_extents (a_font: POINTER; a_glyph: like pango_glyph; an_ink_rect, a_logical_rect: POINTER): POINTER is
			-- void pango_font_get_glyph_extents (PangoFont *font,
			-- PangoGlyph glyph, PangoRectangle *ink_rect, PangoRectangle
			-- *logical_rect);
		external "C use <pango/pango.h>"
		end

	pango_font_get_metrics (a_font, a_language: POINTER): POINTER is
			-- PangoFontMetrics* pango_font_get_metrics (PangoFont *font,
			-- PangoLanguage *language);
		external "C use <pango/pango.h>"
		end

	pango_font_get_font_map (a_font: POINTER): POINTER is
			-- PangoFontMap* pango_font_get_font_map (PangoFont *font);
		external "C use <pango/pango.h>"
		end

end -- class PANGO_FONT
