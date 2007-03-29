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

inherit SHARED_C_STRUCT

-- insert FOO_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation
	-- #define     PANGO_TYPE_FONT_METRICS
-- PangoFontMetrics* pango_font_metrics_ref    (PangoFontMetrics *metrics);
-- void        pango_font_metrics_unref        (PangoFontMetrics *metrics);
-- int         pango_font_metrics_get_ascent   (PangoFontMetrics *metrics);
-- int         pango_font_metrics_get_descent  (PangoFontMetrics *metrics);
-- int         pango_font_metrics_get_approximate_char_width
--                                             (PangoFontMetrics *metrics);
-- int         pango_font_metrics_get_approximate_digit_width
--                                             (PangoFontMetrics *metrics);
-- int         pango_font_metrics_get_underline_thickness
--                                             (PangoFontMetrics *metrics);
-- int         pango_font_metrics_get_underline_position
--                                             (PangoFontMetrics *metrics);
-- int         pango_font_metrics_get_strikethrough_thickness
--                                             (PangoFontMetrics *metrics);
-- int         pango_font_metrics_get_strikethrough_position
--                                             (PangoFontMetrics *metrics);
feature -- size
	struct_size: INTEGER is
		external "C inline use <pango/pango.h>"
		alias "sizeof(PangoFontMetrics)"
		end
end -- class PANGO_FONT_METRICS
