note
	description: "."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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
class GTK_TEXT_APPEARANCE

inherit G_STRUCT

create {ANY} from_external_pointer

	-- TODO: wrap this structure for real
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTextAppearance)"
		end
	
feature {} -- External calls and stucture access

	--   GtkTextAppearance
	
	--  typedef struct {
	--    GdkColor bg_color;
	--    GdkColor fg_color;
	--    GdkBitmap *bg_stipple;
	--    GdkBitmap *fg_stipple;
	
	--    /* super/subscript rise, can be negative */
	--    gint rise;
	
	--    guint underline : 4;          /* PangoUnderline */
	--    guint strikethrough : 1;
	
	--    /* Whether to use background-related values; this is irrelevant for
	--     * the values struct when in a tag, but is used for the composite
	--     * values struct; it's true if any of the tags being composited
	--     * had background stuff set.
	--     */
	--    guint draw_bg : 1;
	
	--    /* These are only used when we are actually laying out and rendering
	--     * a paragraph; not when a GtkTextAppearance is part of a
	--     * GtkTextAttributes.
	--     */
	--    guint inside_selection : 1;
	--    guint is_text : 1;
	--  } GtkTextAppearance;
	
end
