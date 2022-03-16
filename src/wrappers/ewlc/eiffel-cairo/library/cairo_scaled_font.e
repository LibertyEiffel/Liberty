note
	description: "Scaled Fonts -- Caching metrics for a particular font size."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "1.2.4"

class CAIRO_SCALED_FONT
	-- A CAIRO_SCALED_FONT is a font scaled to a particular size and
	-- device resolution. It is most useful for low-level font usage
	-- where a library or application wants to cache a reference to a
	-- scaled font to speed up the computation of metrics.

	-- TODO: mostly unimplemented
inherit C_STRUCT

create {ANY} from_external_pointer

feature {} -- Creation

	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_create ()
	--
	-- cairo_scaled_font_t* cairo_scaled_font_create
	--                                             (cairo_font_face_t *font_face,
	--                                              const cairo_matrix_t *font_matrix,
	--                                              const cairo_matrix_t *ctm,
	--                                              const cairo_font_options_t *options);
	--
	--   Creates a cairo_scaled_font_t object from a font face and matrices that
	--   describe the size of the font and the environment in which it will be
	--   used.
	--
	--   font_face :   a cairo_font_face_t
	--   font_matrix : font space to user space transformation matrix for the font.
	--                 In the simplest case of a N point font, this matrix is just
	--                 a scale by N, but it can also be used to shear the font or
	--                 stretch it unequally along the two axes. See
	--                 cairo_set_font_matrix().
	--   ctm :         user to device transformation matrix with which the font
	--                 will be used.
	--   options :     options to use when getting metrics for the font and
	--                 rendering with it.
	--   Returns :     a newly created cairo_scaled_font_t. Destroy with
	--                 cairo_scaled_font_destroy()
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_reference ()
	--
	-- cairo_scaled_font_t* cairo_scaled_font_reference
	--                                             (cairo_scaled_font_t *scaled_font);
	--
	--   Increases the reference count on scaled_font by one. This prevents
	--   scaled_font from being destroyed until a matching call to
	--   cairo_scaled_font_destroy() is made.
	--
	--   scaled_font : a cairo_scaled_font_t, (may be NULL in which case this
	--                 function does nothing)
	--   Returns :     the referenced cairo_scaled_font_t
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_destroy ()
	--
	-- void        cairo_scaled_font_destroy       (cairo_scaled_font_t *scaled_font);
	--
	--   Decreases the reference count on font by one. If the result is zero, then
	--   font and all associated resources are freed. See
	--   cairo_scaled_font_reference().
	--
	--   scaled_font : a cairo_scaled_font_t
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_status ()
	--
	-- cairo_status_t cairo_scaled_font_status     (cairo_scaled_font_t *scaled_font);
	--
	--   Checks whether an error has previously occurred for this scaled_font.
	--
	--   scaled_font : a cairo_scaled_font_t
	--   Returns :     CAIRO_STATUS_SUCCESS or another error such as
	--                 CAIRO_STATUS_NO_MEMORY.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_font_extents_t
	--
	-- typedef struct {
	--     double ascent;
	--     double descent;
	--     double height;
	--     double max_x_advance;
	--     double max_y_advance;
	-- } cairo_font_extents_t;
	--
	--   The cairo_font_extents_t structure stores metric information for a font.
	--   Values are given in the current user-space coordinate system.
	--
	--   Because font metrics are in user-space coordinates, they are mostly, but
	--   not entirely, independent of the current transformation matrix. If you
	--   call cairo_scale(cr, 2.0, 2.0), text will be drawn twice as big, but the
	--   reported text extents will not be doubled. They will change slightly due
	--   to hinting (so you can't assume that metrics are independent of the
	--   transformation matrix), but otherwise will remain unchanged.
	--
	--   double ascent;        the distance that the font extends above the
	--                         baseline. Note that this is not always exactly equal
	--                         to the maximum of the extents of all the glyphs in
	--                         the font, but rather is picked to express the font
	--                         designer's intent as to how the font should align
	--                         with elements above it.
	--   double descent;       the distance that the font extends below the
	--                         baseline. This value is positive for typical fonts
	--                         that include portions below the baseline. Note that
	--                         this is not always exactly equal to the maximum of
	--                         the extents of all the glyphs in the font, but
	--                         rather is picked to express the font designer's
	--                         intent as to how the the font should align with
	--                         elements below it.
	--   double height;        the recommended vertical distance between baselines
	--                         when setting consecutive lines of text with the
	--                         font. This is greater than ascent+descent by a
	--                         quantity known as the line spacing or external
	--                         leading. When space is at a premium, most fonts can
	--                         be set with only a distance of ascent+descent
	--                         between lines.
	--   double max_x_advance; the maximum distance in the X direction that the the
	--                         origin is advanced for any glyph in the font.
	--   double max_y_advance; the maximum distance in the Y direction that the the
	--                         origin is advanced for any glyph in the font. this
	--                         will be zero for normal fonts used for horizontal
	--                         writing. (The scripts of East Asia are sometimes
	--                         written vertically.)
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_extents ()
	--
	-- void        cairo_scaled_font_extents       (cairo_scaled_font_t *scaled_font,
	--                                              cairo_font_extents_t *extents);
	--
	--   Gets the metrics for a cairo_scaled_font_t.
	--
	--   scaled_font : a cairo_scaled_font_t
	--   extents :     a cairo_font_extents_t which to store the retrieved extents.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_text_extents_t
	--
	-- typedef struct {
	--     double x_bearing;
	--     double y_bearing;
	--     double width;
	--     double height;
	--     double x_advance;
	--     double y_advance;
	-- } cairo_text_extents_t;
	--
	--   The cairo_text_extents_t structure stores the extents of a single glyph or
	--   a string of glyphs in user-space coordinates. Because text extents are in
	--   user-space coordinates, they are mostly, but not entirely, independent of
	--   the current transformation matrix. If you call cairo_scale(cr, 2.0, 2.0),
	--   text will be drawn twice as big, but the reported text extents will not be
	--   doubled. They will change slightly due to hinting (so you can't assume
	--   that metrics are independent of the transformation matrix), but otherwise
	--   will remain unchanged.
	--
	--   double x_bearing; the horizontal distance from the origin to the leftmost
	--                     part of the glyphs as drawn. Positive if the glyphs lie
	--                     entirely to the right of the origin.
	--   double y_bearing; the vertical distance from the origin to the topmost
	--                     part of the glyphs as drawn. Positive only if the glyphs
	--                     lie completely below the origin; will usually be
	--                     negative.
	--   double width;     width of the glyphs as drawn
	--   double height;    height of the glyphs as drawn
	--   double x_advance; distance to advance in the X direction after drawing
	--                     these glyphs
	--   double y_advance; distance to advance in the Y direction after drawing
	--                     these glyphs. Will typically be zero except for vertical
	--                     text layout as found in East-Asian languages.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_text_extents ()
	--
	-- void        cairo_scaled_font_text_extents  (cairo_scaled_font_t *scaled_font,
	--                                              const char *utf8,
	--                                              cairo_text_extents_t *extents);
	--
	--   Gets the extents for a string of text. The extents describe a user-space
	--   rectangle that encloses the "inked" portion of the text drawn at the
	--   origin (0,0) (as it would be drawn by cairo_show_text() if the cairo
	--   graphics state were set to the same font_face, font_matrix, ctm, and
	--   font_options as scaled_font). Additionally, the x_advance and y_advance
	--   values indicate the amount by which the current point would be advanced by
	--   cairo_show_text().
	--
	--   Note that whitespace characters do not directly contribute to the size of
	--   the rectangle (extents.width and extents.height). They do contribute
	--   indirectly by changing the position of non-whitespace characters. In
	--   particular, trailing whitespace characters are likely to not affect the
	--   size of the rectangle, though they will affect the x_advance and y_advance
	--   values.
	--
	--   scaled_font : a cairo_scaled_font_t
	--   utf8 :        a string of text, encoded in UTF-8
	--   extents :     a cairo_text_extents_t which to store the retrieved extents.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_glyph_extents ()
	--
	-- void        cairo_scaled_font_glyph_extents (cairo_scaled_font_t *scaled_font,
	--                                              cairo_glyph_t *glyphs,
	--                                              int num_glyphs,
	--                                              cairo_text_extents_t *extents);
	--
	--   Gets the extents for an array of glyphs. The extents describe a user-space
	--   rectangle that encloses the "inked" portion of the glyphs, (as they would
	--   be drawn by cairo_show_glyphs() if the cairo graphics state were set to
	--   the same font_face, font_matrix, ctm, and font_options as scaled_font).
	--   Additionally, the x_advance and y_advance values indicate the amount by
	--   which the current point would be advanced by cairo_show_glyphs.
	--
	--   Note that whitespace glyphs do not contribute to the size of the rectangle
	--   (extents.width and extents.height).
	--
	--   scaled_font : a cairo_scaled_font_t
	--   glyphs :      an array of glyph IDs with X and Y offsets.
	--   num_glyphs :  the number of glyphs in the glyphs array
	--   extents :     a cairo_text_extents_t which to store the retrieved extents.
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_get_font_face ()
	--
	-- cairo_font_face_t* cairo_scaled_font_get_font_face
	--                                             (cairo_scaled_font_t *scaled_font);
	--
	--   Gets the font face that this scaled font was created for.
	--
	--   scaled_font : a cairo_scaled_font_t
	--   Returns :     The cairo_font_face_t with which scaled_font was created.
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_get_font_options ()
	--
	-- void        cairo_scaled_font_get_font_options
	--                                             (cairo_scaled_font_t *scaled_font,
	--                                              cairo_font_options_t *options);
	--
	--   Stores the font options with which scaled_font was created into options.
	--
	--   scaled_font : a cairo_scaled_font_t
	--   options :     return value for the font options
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_get_font_matrix ()
	--
	-- void        cairo_scaled_font_get_font_matrix
	--                                             (cairo_scaled_font_t *scaled_font,
	--                                              cairo_matrix_t *font_matrix);
	--
	--   Stores the font matrix with which scaled_font was created into matrix.
	--
	--   scaled_font : a cairo_scaled_font_t
	--   font_matrix : return value for the matrix
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_get_ctm ()
	--
	-- void        cairo_scaled_font_get_ctm       (cairo_scaled_font_t *scaled_font,
	--                                              cairo_matrix_t *ctm);
	--
	--   Stores the CTM with which scaled_font was created into ctm.
	--
	--   scaled_font : a cairo_scaled_font_t
	--   ctm :         return value for the CTM
	--
	--   Since 1.2
	--
	--   --------------------------------------------------------------------------
	--
	--  cairo_scaled_font_get_type ()
	--
	-- cairo_font_type_t cairo_scaled_font_get_type
	--                                             (cairo_scaled_font_t *scaled_font);
	--
	--   This function returns the type of the backend used to create a scaled
	--   font. See cairo_font_type_t for available types.
	--
	--   scaled_font : a cairo_scaled_font_t
	--   Returns :     The type of scaled_font.
	--
	--   Since 1.2

feature {ANY} -- Memory handling 
	dispose do free(handle) end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <cairo.h>"
		alias "sizeof(cairo_scaled_font_t)"
		end

feature {} -- External calls
	cairo_scaled_font_create (a_font_face, a_font_matrix, a_ctm_matrix, some_font_options: POINTER): POINTER
		external "C use <cairo.h>"
		end

	cairo_scaled_font_reference (a_scaled_font: POINTER): POINTER
		external "C use <cairo.h>"
		end

	cairo_scaled_font_destroy (a_scaled_font: POINTER)
		external "C use <cairo.h>"
		end
	
	cairo_scaled_font_status (a_scaled_font: POINTER): INTEGER
		external "C use <cairo.h>"
		end
	
	cairo_scaled_font_extents (a_scaled_font, an_extents: POINTER)
		external "C use <cairo.h>"
		end

	cairo_scaled_font_text_extents (a_scaled_font, an_utf8, an_extents: POINTER)
		external "C use <cairo.h>"
		end
	
	cairo_scaled_font_glyph_extents (a_scaled_font, some_glyphs: POINTER; a_glyph_num: INTEGER; some_extents: POINTER)
		external "C use <cairo.h>"
		end
	
	cairo_scaled_font_get_font_face (a_scaled_font: POINTER): POINTER
		external "C use <cairo.h>"
		end
	
	cairo_scaled_font_get_font_options (a_scaled_font, a_font_options: POINTER)
		external "C use <cairo.h>"
		end

	cairo_scaled_font_get_font_matrix (a_scaled_font, a_font_matrix: POINTER)
		external "C use <cairo.h>"
		end

	cairo_scaled_font_get_ctm (a_scaled_font, a_ctm_matrix: POINTER)
		external "C use <cairo.h>"
		end
	
	cairo_scaled_font_get_type (a_scaled_font: POINTER): INTEGER
		external "C use <cairo.h>"
		end
	
end -- class CAIRO_SCALED_FONT
