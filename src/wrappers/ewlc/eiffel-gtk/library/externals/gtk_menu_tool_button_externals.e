note
	description: "External calls for GTK_TOOL_MENU_BUTTON"
	copyright: "Copyright (C) 2007 $EWLC_developer, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_MENU_TOOL_BUTTON_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_menu_tool_button_new (a_icon_widget,a_label: POINTER): POINTER is
			-- GtkToolItem* gtk_menu_tool_button_new (GtkWidget
			-- *icon_widget, const gchar *label);
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_tool_button_new_from_stock (a_stock_id: POINTER): POINTER  is
			-- GtkToolItem* gtk_menu_tool_button_new_from_stock (const
			-- gchar *stock_id);
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_tool_button_set_menu (a_button, a_menu: POINTER) is
			-- void gtk_menu_tool_button_set_menu (GtkMenuToolButton
			-- *button, GtkWidget *menu);
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_tool_button_get_menu (a_button: POINTER): POINTER is
			-- GtkWidget* gtk_menu_tool_button_get_menu
			-- (GtkMenuToolButton *button);
		external "C use <gtk/gtk.h>"
		end

	gtk_menu_tool_button_set_arrow_tooltip (a_button, a_tooltips,a_tip_text, a_tip_private: POINTER) is
			-- void gtk_menu_tool_button_set_arrow_tooltip
			-- (GtkMenuToolButton *button, GtkTooltips *tooltips, const
			-- gchar *tip_text, const gchar *tip_private);
		external "C use <gtk/gtk.h>"
		end
end
