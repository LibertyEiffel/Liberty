note
	description: "External calls for font features of CAIRO_CONTEXT"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class CAIRO_FONT_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	cairo_select_font_face (a_context, a_family: POINTER; a_slant, a_weight: INTEGER)
			-- void cairo_select_font_face (cairo_t *cr, const char
			-- *family, cairo_font_slant_t slant, cairo_font_weight_t
			-- weight);
		external "C use <cairo.h>"
		end
	
	cairo_set_font_size (a_context: POINTER; a_size: REAL)
			-- void cairo_set_font_size (cairo_t *cr, double size);
		external "C use <cairo.h>"
		end

	cairo_set_font_matrix (a_context, a_matrix: POINTER)
			-- void cairo_set_font_matrix (cairo_t *cr, const cairo_matrix_t *matrix);
		external "C use <cairo.h>"
		end

	cairo_get_font_matrix (a_context, a_matrix: POINTER)
			-- void cairo_get_font_matrix (cairo_t *cr, cairo_matrix_t
			-- *matrix);
		external "C use <cairo.h>"
		end

	cairo_set_font_options (a_context, a_font_options: POINTER)
			-- void cairo_set_font_options (cairo_t *cr, const
			-- cairo_font_options_t *options);
		external "C use <cairo.h>"
		end

	cairo_get_font_options (a_context, a_font_options: POINTER)
			-- void cairo_get_font_options (cairo_t *cr,
			-- cairo_font_options_t *options);
		external "C use <cairo.h>"
		end

	cairo_show_text (a_context, an_utf8: POINTER)
			-- void cairo_show_text (cairo_t *cr, const char *utf8);
		external "C use <cairo.h>"
		end

	cairo_show_glyphs (a_context, some_glyphs: POINTER; an_n_glyphs: INTEGER)
			-- void cairo_show_glyphs (cairo_t *cr, cairo_glyph_t
			-- *glyphs, int num_glyphs);
		external "C use <cairo.h>"
		end

	cairo_get_font_face (a_context: POINTER): POINTER
			-- cairo_font_face_t* cairo_get_font_face (cairo_t *cr);
		external "C use <cairo.h>"
		end

	cairo_font_extents (a_context, an_extents: POINTER)
			-- void cairo_font_extents (cairo_t *cr, cairo_font_extents_t
			-- *extents);
		external "C use <cairo.h>"
		end
	
	cairo_set_font_face (a_context, a_font_face: POINTER)
			-- void cairo_set_font_face (cairo_t *cr, cairo_font_face_t
			-- *font_face);
		external "C use <cairo.h>"
		end
	
	cairo_set_scaled_font (a_context, a_scaled_font: POINTER)
			-- void cairo_set_scaled_font (cairo_t *cr, const cairo_scaled_font_t *scaled_font);
		external "C use <cairo.h>"
		end

	cairo_text_extents (a_context, an_utf8, an_extents: POINTER)
			-- void cairo_text_extents (cairo_t *cr, const char *utf8,
			-- cairo_text_extents_t *extents);
		external "C use <cairo.h>"
		end
	
	cairo_glyph_extents (a_context, some_glyphs: POINTER; an_n_glyphs: INTEGER; an_extents: POINTER)
			-- void cairo_glyph_extents (cairo_t *cr, cairo_glyph_t
			-- *glyphs, int num_glyphs, cairo_text_extents_t *extents);
		external "C use <cairo.h>"
		end
end
