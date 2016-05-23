note
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

deferred class GTK_COLOR_BUTTON_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_color_button_new: POINTER  is
		external "C use <gtk/gtk.h>"
		end

	gtk_color_button_new_with_color (a_color: POINTER): POINTER is
			-- GtkWidget* gtk_color_button_new_with_color (const GdkColor *color);
		external "C use <gtk/gtk.h>"
		end
		
	gtk_color_button_set_color (a_color_button, a_color: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_color_button_get_color (a_color_button, a_color: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_color_button_set_alpha (a_color_button: POINTER; an_alpha: INTEGER) is
			-- void gtk_color_button_set_alpha (GtkColorButton *calor_button, guint16 
			-- alpha);

			-- TODO: `an_alpha' should be a NATURAL_16
		external "C use <gtk/gtk.h>"
		end

	gtk_color_button_get_alpha (a_color_button: POINTER): INTEGER is
			-- guint16 gtk_color_button_get_alpha (GtkColorButton
			-- *color_button);

			-- TODO: Result should be a NATURAL_16
		external "C use <gtk/gtk.h>"
		end

	gtk_color_button_set_use_alpha (a_color_button: POINTER; use_alpha_bool: INTEGER) is
			-- void gtk_color_button_set_use_alpha (GtkColorButton
			-- *color_button, gboolean use_alpha);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_button_get_use_alpha (a_color_button: POINTER): INTEGER is
			-- 	gboolean      gtk_color_button_get_use_alpha   (GtkColorButton *color_button);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_button_set_title (a_color_button, a_title: POINTER) is
			-- 	void gtk_color_button_set_title (GtkColorButton
			-- 	*color_button, const gchar *title);
		external "C use <gtk/gtk.h>"
		end

	gtk_color_button_get_title (a_color_button: POINTER): POINTER is
			-- 	const gchar* gtk_color_button_get_title (GtkColorButton
			-- 	*color_button);
		external "C use <gtk/gtk.h>"
		end


feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkColorButton)"
		end

end
