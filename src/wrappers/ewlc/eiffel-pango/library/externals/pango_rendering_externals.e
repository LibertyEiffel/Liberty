note
	description: "External calls shown on Pango Rendering documentation page"
	copyright: "Copyright (C) 2007 Paolo Redaelli, Pango developers"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class PANGO_RENDERING_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	-- #define     PANGO_ANALYSIS_FLAG_CENTERED_BASELINE
	
	-- TODO: enum        PangoDirection;
	
	-- #define     PANGO_TYPE_DIRECTION
	
	pango_itemize (a_context, a_text: POINTER; a_start_index, a_length: INTEGER; some_attrs, a_cached_iter: POINTER): POINTER is
			-- GList* pango_itemize (PangoContext *context, const char
			-- *text, int start_index, int length, PangoAttrList *attrs,
			-- PangoAttrIterator *cached_iter);
		external "C use <pango/pango.h>"
		end

	pango_itemize_with_base_dir (a_context: POINTER; a_base_dir: INTEGER; a_text: POINTER; a_start_index, a_length: INTEGER; some_attrs, a_cached_iter: POINTER): POINTER is
			-- 	GList* pango_itemize_with_base_dir (PangoContext *context, PangoDirection base_dir, const char *text, int start_index, int length, PangoAttrList *attrs, PangoAttrIterator *cached_iter);
		external "C use <pango/pango.h>"
		end

	pango_item_free (an_item: POINTER) is
			-- 	void pango_item_free (PangoItem *item);
		external "C use <pango/pango.h>"
		end

	pango_item_copy (an_item: POINTER): POINTER is
			-- 	PangoItem* pango_item_copy (PangoItem *item);
		external "C use <pango/pango.h>"
		end

	pango_item_new: POINTER is
			-- 	PangoItem* pango_item_new (void);
		external "C use <pango/pango.h>"
		end

	pango_item_split (a_orig: POINTER; a_split_index, a_split_offset: INTEGER): POINTER is
			-- 	PangoItem* pango_item_split (PangoItem *orig, int split_index, int split_offset);
		external "C use <pango/pango.h>"
		end

	pango_reorder_items (a_logical_items: POINTER): POINTER is
			-- 	GList* pango_reorder_items (GList *logical_items);
		external "C use <pango/pango.h>"
		end


	pango_context_new: POINTER is
			-- 	PangoContext* pango_context_new (void);
		external "C use <pango/pango.h>"
		end

	pango_context_set_font_map (a_context, a_font_map: POINTER) is
			-- 	void pango_context_set_font_map (PangoContext *context, PangoFontMap *font_map);
		external "C use <pango/pango.h>"
		end

	pango_context_get_font_map (a_context: POINTER): POINTER is
			-- 	PangoFontMap* pango_context_get_font_map (PangoContext *context);
		external "C use <pango/pango.h>"
		end

	pango_context_get_font_description (a_context: POINTER): POINTER is
			-- 	PangoFontDescription* pango_context_get_font_description (PangoContext *context);
		external "C use <pango/pango.h>"
		end

	pango_context_set_font_description (a_context, a_desc: POINTER) is
			-- 	void pango_context_set_font_description (PangoContext *context, const PangoFontDescription *desc);
		external "C use <pango/pango.h>"
		end

	pango_context_get_language (a_context: POINTER): POINTER is
			-- 	PangoLanguage* pango_context_get_language (PangoContext *context);
		external "C use <pango/pango.h>"
		end

	pango_context_set_language (a_context, a_language: POINTER) is
			-- 	void pango_context_set_language (PangoContext *context, PangoLanguage *language);
		external "C use <pango/pango.h>"
		end

	pango_context_get_base_dir (a_context: POINTER): INTEGER is
			-- 	PangoDirection pango_context_get_base_dir (PangoContext *context);
		external "C use <pango/pango.h>"
		end

	pango_context_set_base_dir (a_context: POINTER; a_direction: INTEGER) is
			-- 	void pango_context_set_base_dir (PangoContext *context, PangoDirection direction);
		external "C use <pango/pango.h>"
		end

	pango_context_get_base_gravity (a_context: POINTER): INTEGER is
			-- 	PangoGravity pango_context_get_base_gravity (PangoContext *context);
		external "C use <pango/pango.h>"
		end

	pango_context_set_base_gravity (a_context: POINTER; a_gravity: INTEGER) is
			-- 	void pango_context_set_base_gravity (PangoContext *context, PangoGravity gravity);
		external "C use <pango/pango.h>"
		end

	pango_context_get_gravity (a_context: POINTER): INTEGER is
			-- 	PangoGravity pango_context_get_gravity (PangoContext *context);
		external "C use <pango/pango.h>"
		end

	pango_context_get_gravity_hint (a_context: POINTER): INTEGER is
			-- 	PangoGravityHint pango_context_get_gravity_hint (PangoContext *context);
		external "C use <pango/pango.h>"
		end

	pango_context_set_gravity_hint (a_context: POINTER; a_hint: INTEGER) is
			-- 	void pango_context_set_gravity_hint (PangoContext *context, PangoGravityHint hint);
		external "C use <pango/pango.h>"
		end
	
	pango_context_get_matrix (a_context: POINTER): POINTER is
			-- 	const PangoMatrix* pango_context_get_matrix (PangoContext *context);
		external "C use <pango/pango.h>"
		end

	pango_context_load_font (a_context, a_desc: POINTER): POINTER is
			-- 	PangoFont* pango_context_load_font (PangoContext *context, const PangoFontDescription *desc);
		external "C use <pango/pango.h>"
		end

	pango_context_load_fontset (a_context, a_desc, a_language: POINTER): POINTER is
			-- 	PangoFontset* pango_context_load_fontset (PangoContext *context, const PangoFontDescription *desc, PangoLanguage *language);
		external "C use <pango/pango.h>"
		end

	pango_context_get_metrics (a_context, a_desc, a_language: POINTER): POINTER is
			-- 	PangoFontMetrics* pango_context_get_metrics (PangoContext *context, const PangoFontDescription *desc, PangoLanguage *language);
		external "C use <pango/pango.h>"
		end

	pango_context_list_families (a_context, some_families_ref_ref, a_n_families: POINTER) is
			--	void pango_context_list_families (PangoContext *context,
			--	PangoFontFamily ***families, int *n_families);
		external "C use <pango/pango.h>"
		end

	-- 	gboolean pango_get_mirror_char (gunichar ch, gunichar *mirrored_ch);
	
	-- 	PangoDirection pango_unichar_direction (gunichar ch);
	
	pango_find_base_dir (a_text: POINTER; a_length: INTEGER): INTEGER is
			-- 	PangoDirection pango_find_base_dir (const gchar *text, gint length);
		external "C use <pango/pango.h>"
		end

	pango_gravity_to_rotation (a_gravity: INTEGER): REAL is
			-- 	double pango_gravity_to_rotation (PangoGravity gravity);
		external "C use <pango/pango.h>"
		end

	pango_break (a_text: POINTER; a_length: INTEGER; an_analysis, some_attrs: POINTER; an_attrs_len: INTEGER) is
			-- 	void pango_break (const gchar *text, int length, PangoAnalysis *analysis, PangoLogAttr *attrs, int attrs_len);
		external "C use <pango/pango.h>"
		end

	pango_get_log_attrs (a_text: POINTER; a_length, a_level: INTEGER; a_language, some_log_attrs: POINTER; an_attrs_len: INTEGER) is
			-- 	void pango_get_log_attrs (const char *text, int length, int level, PangoLanguage *language, PangoLogAttr *log_attrs, int attrs_len);
		external "C use <pango/pango.h>"
		end

	pango_find_paragraph_boundary (a_text: POINTER; a_length: INTEGER; a_paragraph_delimiter_index, a_next_paragraph_start: POINTER) is
			-- 	void pango_find_paragraph_boundary (const gchar *text, gint length, gint *paragraph_delimiter_index, gint *next_paragraph_start);
		external "C use <pango/pango.h>"
		end

	pango_default_break (a_text: POINTER; a_length: INTEGER; an_analysis, some_attrs: POINTER; an_attrs_len: INTEGER) is
			-- 	void pango_default_break (const gchar *text, int length, PangoAnalysis *analysis, PangoLogAttr *attrs, int attrs_len);
		external "C use <pango/pango.h>"
		end

	-- PangoLogAttr;

	pango_shape (a_text: POINTER; a_length: INTEGER; an_analysis, some_glyphs: POINTER) is
			-- 	void pango_shape (const gchar *text, gint length, const PangoAnalysis *analysis, PangoGlyphString *glyphs);
		external "C use <pango/pango.h>"
		end
end
