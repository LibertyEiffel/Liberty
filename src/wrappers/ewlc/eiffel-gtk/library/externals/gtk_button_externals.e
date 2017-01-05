note
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_BUTTON_EXTERNALS

inherit
	ANY undefine is_equal, copy end

insert
	GTK_RELIEF_STYLE
	GTK_POSITION_TYPE

feature {} -- External calls

	gtk_button_new: POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_button_new_with_label (label: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_button_new_with_mnemonic (label: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_button_new_from_stock (stock_id: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_button_pressed (a_button: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_released (a_button: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_clicked (a_button: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_enter (a_button: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_leave (a_button: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_relief (a_button: POINTER; a_gtkreliefstyle: INTEGER)
		require valid_style: is_valid_gtk_relief_style (a_gtkreliefstyle)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_relief (a_button: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		ensure valid_style: is_valid_gtk_relief_style (Result)
		end

	gtk_button_get_label (a_button: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_label (a_button, label: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_use_stock (a_button: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_use_stock (a_button: POINTER; use_stock: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_use_underline (a_button: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_use_underline (a_button: POINTER; use_underline: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_focus_on_click (a_button: POINTER; focus_on_click: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_focus_on_click (a_button: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_alignment (a_button: POINTER;  xalign, yalign: REAL)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_alignment (a_button, xalign, yalign: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_image (a_button, image: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_image (a_button: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

-- Since 2.10

--	gtk_button_set_image_position (handle: POINTER; a_position: INTEGER) is
--		require
--			is_valid_gtk_position_type (a_position)
--		external "C use <gtk/gtk.h>"
--		end
--
--	gtk_button_get_image_position (handle: POINTER): INTEGER is
--		external "C use <gtk/gtk.h>"
--		ensure
--			is_valid_gtk_position_type (Result)
--		end

-- Signals

-- "activate"  void        user_function      (GtkButton *widget,
--                                             gpointer   user_data)      : Run first / Action
-- "clicked"   void        user_function      (GtkButton *button,
--                                             gpointer   user_data)      : Run first / Action
-- "enter"     void        user_function      (GtkButton *button,
--                                             gpointer   user_data)      : Run first
-- "leave"     void        user_function      (GtkButton *button,
--                                             gpointer   user_data)      : Run first
-- "pressed"   void        user_function      (GtkButton *button,
--                                             gpointer   user_data)      : Run first
-- "released"  void        user_function      (GtkButton *button,
--                                             gpointer   user_data)      : Run first

end
