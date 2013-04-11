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

class PANGO_FONT_METRICS

inherit 
	C_STRUCT
	REFERENCE_COUNTED

create {ANY} from_external_pointer

feature {ANY} -- TODO: PangoFontMetrics structure access

	-- typedef struct {
	--   guint ref_count;
	
	--   int ascent;
	--   int descent;
	--   int approximate_char_width;
	--   int approximate_digit_width;
	--   int underline_position;
	--   int underline_thickness;
	--   int strikethrough_position;
	--   int strikethrough_thickness;
	-- } PangoFontMetrics;

	-- A PangoFontMetrics structure holds the overall metric information for a font (possibly restricted to a script). The fields of this structure are private to implementations of a font backend. See the documentation of the corresponding getters for documentation of their meaning.
	-- guint ref_count; 	reference count. Used internally. See pango_font_metrics_ref() and pango_font_metrics_unref().
	-- int ascent; 	the distance from the baseline to the highest point of the glyphs of the font. This is positive in practically all fonts.
	-- int descent; 	the distance from the baseline to the lowest point of the glyphs of the font. This is positive in practically all fonts.
	-- int approximate_char_width; 	approximate average width of the regular glyphs of the font.
	-- int approximate_digit_width; 	approximate average width of the glyphs for digits of the font.
	-- int underline_position; 	position of the underline. This is normally negative.
	-- int underline_thickness; 	thickness of the underline.
	-- int strikethrough_position; 	position of the strikethrough line. This is normally positive.
	-- int strikethrough_thickness; 	thickness of the strikethrough line.
	-- PANGO_TYPE_FONT_METRICS

	-- #define PANGO_TYPE_FONT_METRICS  (pango_font_metrics_get_type ())

	-- The GObject type for PangoFontMetrics.

feature {ANY}
	ref is
			-- Increase the reference count of a font metrics structure
			-- by one.
		local p: POINTER
		do
			p:=pango_font_metrics_ref (handle)
			check p=handle end
		end

	unref is
			-- Decrease the reference count of a font metrics structure
			-- by one. If the result is zero, frees the structure and any
			-- associated memory.
		do
			pango_font_metrics_unref(handle)
		end
	
	ascent: INTEGER is
			-- the ascent of a font metrics structure. The ascent is the
			-- distance from the baseline to the logical top of a line of
			-- text. (The logical top may be above or below the top of
			-- the actual drawn ink. It is necessary to lay out the text
			-- to figure where the ink will be.). It is expressed in
			-- Pango units. (1 point == PANGO_SCALE Pango units.)
		do
			Result:=pango_font_metrics_get_ascent(handle)
		end

-- pango_font_metrics_get_descent ()

-- int         pango_font_metrics_get_descent  (PangoFontMetrics *metrics);

-- Gets the descent from a font metrics structure. The descent is the distance from the baseline to the logical bottom of a line of text. (The logical bottom may be above or below the bottom of the actual drawn ink. It is necessary to lay out the text to figure where the ink will be.)

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the descent, in Pango units. (1 point == PANGO_SCALE Pango units.)
-- pango_font_metrics_get_approximate_char_width ()

-- int         pango_font_metrics_get_approximate_char_width
--                                             (PangoFontMetrics *metrics);

-- Gets the approximate character width for a font metrics structure. This is merely a representative value useful, for example, for determining the initial size for a window. Actual characters in text will be wider and narrower than this.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the character width, in Pango units. (1 point == PANGO_SCALE Pango units.)
-- pango_font_metrics_get_approximate_digit_width ()

-- int         pango_font_metrics_get_approximate_digit_width
--                                             (PangoFontMetrics *metrics);

-- Gets the approximate digit width for a font metrics structure. This is merely a representative value useful, for example, for determining the initial size for a window. Actual digits in text can be wider or narrower than this, though this value is generally somewhat more accurate than the result of pango_font_metrics_get_approximate_char_width() for digits.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the digit width, in Pango units. (1 point == PANGO_SCALE Pango units.)
-- pango_font_metrics_get_underline_thickness ()

-- int         pango_font_metrics_get_underline_thickness
--                                             (PangoFontMetrics *metrics);

-- Gets the suggested thickness to draw for the underline.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the suggested underline thickness, in Pango units.

-- Since 1.6
-- pango_font_metrics_get_underline_position ()

-- int         pango_font_metrics_get_underline_position
--                                             (PangoFontMetrics *metrics);

-- Gets the suggested position to draw the underline. The value returned is the distance above the baseline of the top of the underline. Since most fonts have underline positions beneath the baseline, this value is typically negative.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the suggested underline position, in Pango units.

-- Since 1.6
-- pango_font_metrics_get_strikethrough_thickness ()

-- int         pango_font_metrics_get_strikethrough_thickness
--                                             (PangoFontMetrics *metrics);

-- Gets the suggested thickness to draw for the strikethrough.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the suggested strikethrough thickness, in Pango units.

-- Since 1.6
-- pango_font_metrics_get_strikethrough_position ()

-- int         pango_font_metrics_get_strikethrough_position
--                                             (PangoFontMetrics *metrics);

-- Gets the suggested position to draw the strikethrough. The value returned is the distance above the baseline of the top of the strikethrough.

-- metrics : 	a PangoFontMetrics structure
-- Returns : 	the suggested strikethrough position, in Pango units.

-- Since 1.6

feature {} -- Creation
	-- #define     PANGO_TYPE_FONT_METRICS

	pango_font_metrics_ref (a_metrics: POINTER): POINTER is
			-- PangoFontMetrics* pango_font_metrics_ref (PangoFontMetrics *metrics);
		external "C use <pango/pango.h>"
		end

	pango_font_metrics_unref (a_metrics: POINTER) is
			-- void pango_font_metrics_unref (PangoFontMetrics *metrics);
		external "C use <pango/pango.h>"
		end

	pango_font_metrics_get_ascent (a_metrics: POINTER): INTEGER is
			-- int pango_font_metrics_get_ascent (PangoFontMetrics *metrics);
		external "C use <pango/pango.h>"
		end

	pango_font_metrics_get_descent (a_metrics: POINTER): INTEGER is
			-- int pango_font_metrics_get_descent (PangoFontMetrics *metrics);
		external "C use <pango/pango.h>"
		end

	pango_font_metrics_get_approximate_char_width (a_metrics: POINTER): INTEGER is
			-- int pango_font_metrics_get_approximate_char_width (PangoFontMetrics *metrics);
		external "C use <pango/pango.h>"
		end

	pango_font_metrics_get_approximate_digit_width (a_metrics: POINTER): INTEGER is
			-- int pango_font_metrics_get_approximate_digit_width (PangoFontMetrics *metrics);
		external "C use <pango/pango.h>"
		end

	pango_font_metrics_get_underline_thickness (a_metrics: POINTER): INTEGER is
			-- int pango_font_metrics_get_underline_thickness (PangoFontMetrics *metrics);
		external "C use <pango/pango.h>"
		end

	pango_font_metrics_get_underline_position (a_metrics: POINTER): INTEGER is
			-- int pango_font_metrics_get_underline_position (PangoFontMetrics *metrics);
		external "C use <pango/pango.h>"
		end

	pango_font_metrics_get_strikethrough_thickness (a_metrics: POINTER): INTEGER is
			-- int pango_font_metrics_get_strikethrough_thickness (PangoFontMetrics *metrics);
		external "C use <pango/pango.h>"
		end

	pango_font_metrics_get_strikethrough_position (a_metrics: POINTER): INTEGER is
			-- int pango_font_metrics_get_strikethrough_position (PangoFontMetrics *metrics);
		external "C use <pango/pango.h>"
		end


feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <pango/pango.h>"
		alias "sizeof(PangoFontMetrics)"
		end
end -- class PANGO_FONT_METRICS
