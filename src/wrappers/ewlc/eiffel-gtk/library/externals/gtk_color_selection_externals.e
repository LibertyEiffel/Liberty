note
	description: "External calls for GtkColorSelection"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_COLOR_SELECTION_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- Externals

	gtk_color_selection_get_current_color (a_handle, a_color: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_set_current_color (a_handle, a_color: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_color_selection_new: POINTER
			-- GtkWidget* gtk_color_selection_new (void);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_set_has_opacity_control (a_colorsel: POINTER; has_opacity_bool: INTEGER)
			-- gtk_color_selection_set_has_opacity_control (GtkColorSelection *colorsel, gboolean has_opacity);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_get_has_opacity_control (a_colorsel: POINTER): INTEGER
			-- gboolean gtk_color_selection_get_has_opacity_control (GtkColorSelection *colorsel);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_set_has_palette (a_colorsel: POINTER; has_palette_bool: INTEGER)
			-- gtk_color_selection_set_has_palette (GtkColorSelection *colorsel, gboolean has_palette);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_get_has_palette (a_colorsel: POINTER): INTEGER
			-- gboolean gtk_color_selection_get_has_palette (GtkColorSelection *colorsel);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_get_current_alpha (a_colorsel: POINTER): INTEGER
			-- guint16 gtk_color_selection_get_current_alpha (GtkColorSelection 
			-- *colorsel);

			-- TODO: should be NATURAL_16 since it's a guint16.
			-- Currently it's an INTEGER relying on the silent cast at C
			-- level.
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_set_current_alpha (a_colorsel: POINTER; an_alpha: INTEGER)
			-- gtk_color_selection_set_current_alpha (GtkColorSelection
			-- *colorsel, guint16 alpha); TODO: should be NATURAL_16
			-- since it's a guint16. Currently it's an INTEGER relying on
			-- the silent cast at C level.
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_get_previous_alpha (a_colorsel: POINTER): INTEGER
			-- guint16 gtk_color_selection_get_previous_alpha
			-- (GtkColorSelection *colorsel); TODO: should be NATURAL_16
			-- since it's a guint16. Currently it's an INTEGER relying on
			-- the silent cast at C level.
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_set_previous_alpha (a_colorsel: POINTER; an_alpha: INTEGER)
			-- gtk_color_selection_set_previous_alpha (GtkColorSelection
			-- *colorsel, guint16 alpha); TODO: should be NATURAL_16
			-- since it's a guint16. Currently it's an INTEGER relying on
			-- the silent cast at C level.
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_get_previous_color (a_colorsel, a_color: POINTER)
			-- gtk_color_selection_get_previous_color (GtkColorSelection *colorsel, GdkColor *color);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_set_previous_color (a_colorsel, a_color: POINTER)
			-- gtk_color_selection_set_previous_color (GtkColorSelection *colorsel, const GdkColor *color);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_is_adjusting (a_colorsel: POINTER): INTEGER
			-- gboolean gtk_color_selection_is_adjusting (GtkColorSelection *colorsel);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_palette_from_string (a_string, some_colors, colors_n: POINTER): INTEGER
			-- gboolean gtk_color_selection_palette_from_string (const gchar *str, GdkColor **colors, gint *n_colors);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_selection_palette_to_string (some_colors: POINTERM an_n_colors: INTEGER): POINTER
			-- gchar* gtk_color_selection_palette_to_string (const GdkColor *colors, gint n_colors);
		external "C use <gtk/gtk.h>"
		end

	-- (*GtkColorSelectionChangePaletteFunc) (const GdkColor *colors, gint n_colors);
	
	gtk_color_selection_set_change_palette_with_screen_hook (a_func: POINTER): POINTER
			-- GtkColorSelectionChangePaletteWithScreenFunc
			-- gtk_color_selection_set_change_palette_with_screen_hook
			-- (GtkColorSelectionChangePaletteWithScreenFunc func);
		external "C use <gtk/gtk.h>"
		end

	-- (*GtkColorSelectionChangePaletteWithScreenFunc) (GdkScreen *screen, const GdkColor *colors, gint n_colors);
	
end -- class GTK_COLOR_SELECTION_EXTERNALS
