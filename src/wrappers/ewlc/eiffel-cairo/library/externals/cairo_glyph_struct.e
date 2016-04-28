note
	description: "Access to cairo_glyph_t C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class CAIRO_GLYPH_STRUCT
	--  cairo_glyph_t

	-- typedef struct {
	--   unsigned long        index;
	--   double               x;
	--   double               y;
	-- } cairo_glyph_t;

	-- The cairo_glyph_t structure holds information about a single
	-- glyph when drawing or measuring text. A font is (in simple
	-- terms) a collection of shapes used to draw text. A glyph is one
	-- of these shapes. There can be multiple glyphs for a single
	-- character (alternates to be used in different contexts, for
	-- example), or a glyph can be a ligature of multiple
	-- characters. Cairo doesn't expose any way of converting input
	-- text into glyphs, so in order to use the Cairo interfaces that
	-- take arrays of glyphs, you must directly access the appropriate
	-- underlying font system.

	-- Note that the offsets given by x and y are not cumulative. When
	-- drawing or measuring text, each glyph is individually positioned
	-- with respect to the overall origin

	-- double x; the offset in the X direction between the origin used
	-- for drawing or measuring the string and the origin of this
	-- glyph.

	--   double y; the offset in the Y direction between the origin
	--   used for drawing or measuring the string and the origin of
	--   this glyph.
feature {} -- Structure getter/setter calls

	get_index (a_struct: POINTER): INTEGER_32 is
			--   unsigned long        index;
		external "C struct cairo_glyph_t get index use <pango.h>"
		end

	set_index (a_struct: POINTER; a_index: INTEGER_32) is
		external "C struct cairo_glyph_t set index use <pango.h>"
		end

	get_x (a_struct: POINTER): REAL is
			-- double x; the offset in the X direction between the origin
			-- used for drawing or measuring the string and the origin of
			-- this glyph.
		external "C struct cairo_glyph_t get x use <pango.h>"
		end

	set_x (a_struct: POINTER; a_x: REAL) is
		external "C struct cairo_glyph_t set x use <pango.h>"
		end

	get_y (a_struct: POINTER): REAL is
			-- double y; the offset in the Y direction between the origin
			-- used for drawing or measuring the string and the origin of
			-- this glyph.
		external "C struct cairo_glyph_t get y use <pango.h>"
		end

	set_y (a_struct: POINTER; a_y: REAL) is
		external "C struct cairo_glyph_t set y use <pango.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <pango.h>"
		alias "sizeof(cairo_glyph_t)"
		end

end
