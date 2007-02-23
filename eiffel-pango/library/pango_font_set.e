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

class PANGO_FONT_SET

inherit G_OBJECT

creation make, from_external_pointer

feature {} -- Creation

--             PangoFontset;
-- #define     PANGO_TYPE_FONTSET
--             PangoFontsetClass;
-- PangoFont*  pango_fontset_get_font          (PangoFontset *fontset,
--                                              guint wc);
-- PangoFontMetrics* pango_fontset_get_metrics (PangoFontset *fontset);
-- gboolean    (*PangoFontsetForeachFunc)      (PangoFontset *fontset,
--                                              PangoFont *font,
--                                              gpointer data);
-- void        pango_fontset_foreach           (PangoFontset *fontset,
--                                              PangoFontsetForeachFunc func,
--                                              gpointer data);
end -- class PANGO_FONT_SET
