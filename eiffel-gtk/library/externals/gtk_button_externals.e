class GTK_BUTTON_EXTERNALS
inherit
	GTK_RELIEF_STYLE

feature {NONE} -- External calls

	gtk_button_new: POINTER  is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_new_with_label (label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_new_with_mnemonic (label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_new_from_stock (stock_id: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_pressed (a_button: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_released (a_button: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_clicked (a_button: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_enter (a_button: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_leave (a_button: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_relief (a_button: POINTER; a_gtkreliefstyle: INTEGER) is
		require valid_style: is_valid_gtk_relief_style (a_gtkreliefstyle)
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_relief (a_button: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		ensure valid_style: is_valid_gtk_relief_style (Result)
		end

	gtk_button_get_label (a_button: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_label (a_button, label: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_use_stock (a_button: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_use_stock (a_button: POINTER; use_stock: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_use_underline (a_button: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_use_underline (a_button: POINTER; use_underline: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_focus_on_click (a_button: POINTER; focus_on_click: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_focus_on_click (a_button: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_alignment (a_button: POINTER;  xalign, yalign: REAL) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_alignment (a_button, xalign, yalign: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_set_image (a_button, image: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_button_get_image (a_button: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end


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
