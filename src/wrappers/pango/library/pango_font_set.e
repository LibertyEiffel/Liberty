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

deferred class PANGO_FONT_SET
	-- A PangoFontset represents a set of PangoFont to use when
	-- rendering text. It is the result of resolving a
	-- PangoFontDescription against a particular PangoContext. It has
	-- operations for finding the component font for a particular
	-- Unicode character, and for finding a composite set of metrics
	-- for the entire fontset.

inherit G_OBJECT

feature {ANY} 
	
-- PangoFontsetClass

-- typedef struct {
--   GObjectClass parent_class;

	
--   PangoFont *       (*get_font)     (PangoFontset     *fontset,
-- 				     guint             wc);

--   PangoFontMetrics *(*get_metrics)  (PangoFontset     *fontset);
--   PangoLanguage *   (*get_language) (PangoFontset     *fontset);
--   void              (*foreach)      (PangoFontset           *fontset,
-- 				     PangoFontsetForeachFunc func,
-- 				     gpointer                data);
-- } PangoFontsetClass;

-- The PangoFontsetClass structure holds the virtual functions for a particular PangoFontset implementation.
-- GObjectClass parent_class; 	parent GObjectClass.
-- get_font () 	a function to get the font in the fontset that contains the best glyph for the given Unicode character; see pango_fontset_get_font().
-- get_metrics () 	a function to get overall metric information for the fonts in the fontset; see pango_fontset_get_metrics().
-- get_language () 	a function to get the language of the fontset.
-- foreach () 	a function to loop over the fonts in the fontset. See pango_fontset_foreach().


	font_for (a_unicode_character: INTEGER_32): PANGO_FONT is
			-- the font in the fontset that contains the best glyph for `a_unicode_character'.

			-- TODO: `a_unicode_character' should be NATURAL_32
		do
			-- pango_fontset_get_font returns a PangoFont. The caller
			-- must call g_object_unref when finished with the font.
			create Result.from_external_pointer_no_ref(pango_fontset_get_font(handle,a_unicode_character))
		end

	metrics: PANGO_FONT_METRICS is
			-- the overall metric information for the fonts in the fontset.
		local ptr: POINTER
		do
			ptr:=pango_fontset_get_metrics(handle)
			-- pango_fontset_get_metrics returns a PangoFontMetrics
			-- object. The caller must call pango_font_metrics_unref when
			-- finished using the object. This is automatically done
			-- because a PANGO_FONT_METRICS object is actually also
			-- REFERENCE_COUNTED
			create Result.from_external_pointer(ptr)
		end

-- PangoFontsetForeachFunc ()

-- gboolean    (*PangoFontsetForeachFunc)      (PangoFontset *fontset,
--                                              PangoFont *font,
--                                              gpointer data);

-- A callback function used by pango_fontset_foreach() when enumerating the fonts in a fontset.

-- fontset : 	a PangoFontset
-- font : 	a font from fontset
-- data : 	callback data
-- Returns : 	if TRUE, stop iteration and return immediately.

-- Since 1.4
-- pango_fontset_foreach ()

-- void        pango_fontset_foreach           (PangoFontset *fontset,
--                                              PangoFontsetForeachFunc func,
--                                              gpointer data);

-- Iterates through all the fonts in a fontset, calling func for each one. If func returns TRUE, that stops the iteration.

-- fontset : 	a PangoFontset
-- func : 	Callback function
-- data : 	data to pass to the callback function

-- Since 1.4
feature {} -- External calls
	-- #define     PANGO_TYPE_FONTSET

	pango_fontset_get_font (a_fontset: POINTER; a_wc: INTEGER): POINTER is
			-- PangoFont* pango_fontset_get_font (PangoFontset *fontset,
			-- guint wc);
		
			-- TODO: a_wc should be NATURAL
		external "C use <pango.h>"
		end

	pango_fontset_get_metrics (a_fontset: POINTER): POINTER is
			-- PangoFontMetrics* pango_fontset_get_metrics (PangoFontset
			-- *fontset);
		external "C use <pango.h>"
		end

	pango_fontset_foreach_callback: POINTER is
			-- gboolean (*PangoFontsetForeachFunc) (PangoFontset
			-- *fontset, PangoFont *font, gpointer data);
		external "[
					 C inline use "pango-cecil.h"
														  ]"
		alias "PangoFontsetForeachCallback"
		end
	
	pango_fontset_foreach (a_fontset, a_foreach, data: POINTER) is
			-- void pango_fontset_foreach (PangoFontset *fontset,
			-- PangoFontsetForeachFunc func, gpointer data);
		external "C use <pango.h>"
		end
	
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <pango.h>"
		alias "sizeof(PangoFontSet)"
		end
end -- class PANGO_FONT_SET
