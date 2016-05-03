note
	description: "External calls for GTK_TOOLBAR"
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TOOLBAR_EXTERNALS

inherit ANY undefine is_equal, copy end

insert
	GTK_ICON_SIZE

feature {} -- External calls
	-- TODO: wrap GtkToolbar struct
	
	--  typedef struct {
	--    gint             num_children;
	--    GList           *children;
	--    GtkOrientation   orientation;
	--    GtkToolbarStyle  style;
	--    GtkIconSize      icon_size;
	
	--    GtkTooltips     *tooltips;
	--  } GtkToolbar;
	
	-- The GtkToolbar struct only contains private data and should only
	-- be accessed through the function described below.

	-- TODO: wrap  enum GtkToolbarSpaceStyle

	--  typedef enum
	--  {
	--    GTK_TOOLBAR_SPACE_EMPTY,
	--    GTK_TOOLBAR_SPACE_LINE
	--  } GtkToolbarSpaceStyle;

	gtk_toolbar_new: POINTER is
			-- GtkWidget* gtk_toolbar_new (void);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_insert (a_toolbar, a_item: POINTER; a_pos: INTEGER) is
			-- void gtk_toolbar_insert (GtkToolbar *toolbar, GtkToolItem
			-- *item, gint pos);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_get_item_index (a_toolbar, a_item: POINTER): INTEGER is
			-- gint gtk_toolbar_get_item_index (GtkToolbar *toolbar, GtkToolItem *item);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_get_n_items (a_toolbar: POINTER): INTEGER is
			-- gint gtk_toolbar_get_n_items (GtkToolbar *toolbar);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_get_nth_item (a_toolbar: POINTER; an_n: INTEGER): POINTER is
			-- GtkToolItem* gtk_toolbar_get_nth_item (GtkToolbar *toolbar, gint n);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_get_drop_index (a_toolbar: POINTER; an_x, an_y: INTEGER): INTEGER is
			-- gint gtk_toolbar_get_drop_index (GtkToolbar *toolbar, gint x, gint y);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_set_drop_highlight_item (a_toolbar, a_tool_item: POINTER; an_index: INTEGER) is
			-- void gtk_toolbar_set_drop_highlight_item (GtkToolbar
			-- *toolbar, GtkToolItem *tool_item, gint index_);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_set_show_arrow (a_toolbar: POINTER; show_arrow_bool: INTEGER) is
			-- void gtk_toolbar_set_show_arrow (GtkToolbar *toolbar, gboolean show_arrow);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_set_orientation (a_toolbar: POINTER; an_orientation: INTEGER) is
			-- void gtk_toolbar_set_orientation (GtkToolbar *toolbar, GtkOrientation orientation);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_set_tooltips (a_toolbar: POINTER; enable_bool: INTEGER) is
			-- void gtk_toolbar_set_tooltips (GtkToolbar *toolbar, gboolean enable);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_unset_icon_size (a_toolbar: POINTER) is
			-- void gtk_toolbar_unset_icon_size (GtkToolbar *toolbar);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_get_show_arrow (a_toolbar: POINTER): INTEGER is
			-- gboolean gtk_toolbar_get_show_arrow (GtkToolbar *toolbar);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_get_orientation (a_toolbar: POINTER): INTEGER is
			-- GtkOrientation gtk_toolbar_get_orientation (GtkToolbar *toolbar);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_get_style (a_toolbar: POINTER): INTEGER is
			-- GtkToolbarStyle gtk_toolbar_get_style (GtkToolbar *toolbar);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_get_icon_size (a_toolbar: POINTER): INTEGER is
			-- GtkIconSize gtk_toolbar_get_icon_size (GtkToolbar *toolbar);
		external "C use <gtk/gtk.h>"
		ensure is_valid_icon_size: is_valid_gtk_icon_size (Result)
		end

	gtk_toolbar_get_tooltips (a_toolbar: POINTER): INTEGER is
			-- gboolean gtk_toolbar_get_tooltips (GtkToolbar *toolbar);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_get_relief_style (a_toolbar: POINTER): INTEGER is
			-- GtkReliefStyle gtk_toolbar_get_relief_style (GtkToolbar *toolbar);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_append_item (a_toolbar, a_text, a_tooltip_text, a_tooltip_private_text, a_icon, a_callback, some_user_data: POINTER): POINTER is
			-- GtkWidget* gtk_toolbar_append_item (GtkToolbar *toolbar,
			-- const char *text, const char *tooltip_text, const char
			-- *tooltip_private_text, GtkWidget *icon, GtkSignalFunc
			-- callback, gpointer user_data);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_prepend_item (a_toolbar, a_text, a_tooltip_text, a_tooltip_private_text, an_icon: POINTER; a_callback, some_user_data: POINTER): POINTER is
			-- GtkWidget* gtk_toolbar_prepend_item (GtkToolbar *toolbar,
			-- const char *text, const char *tooltip_text, const char
			-- *tooltip_private_text, GtkWidget *icon, GtkSignalFunc
			-- callback, gpointer user_data);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_insert_item (a_toolbar, a_text, a_tooltip_text, a_tooltip_private_text, a_icon, a_callback, some_user_data, a_position: INTEGER): POINTER is
			-- GtkWidget* gtk_toolbar_insert_item (GtkToolbar *toolbar,
			-- const char *text, const char *tooltip_text, const char
			-- *tooltip_private_text, GtkWidget *icon, GtkSignalFunc
			-- callback, gpointer user_data, gint position);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_append_space (a_toolbar: POINTER) is
			-- void gtk_toolbar_append_space (GtkToolbar *toolbar);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_prepend_space (a_toolbar: POINTER) is
			-- void gtk_toolbar_prepend_space (GtkToolbar *toolbar);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_insert_space (a_toolbar: POINTER; a_position: INTEGER) is
			-- void gtk_toolbar_insert_space (GtkToolbar *toolbar, gint
			-- position);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_append_element (a_toolbar: POINTER; a_child_type: INTEGER; a_widget, a_text, a_tooltip_text, a_tooltip_private_text, a_icon, a_callback, some_user_data: POINTER): POINTER is
			-- GtkWidget* gtk_toolbar_append_element (GtkToolbar
			-- *toolbar, GtkToolbarChildType type, GtkWidget *widget,
			-- const char *text, const char *tooltip_text, const char
			-- *tooltip_private_text, GtkWidget *icon, GtkSignalFunc
			-- callback, gpointer user_data);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_prepend_element (a_toolbar: POINTER; a_child_type: INTEGER; a_widget, a_text, a_tooltip_text, a_tooltip_private_text, a_icon, a_callback, some_user_data: POINTER): POINTER is
			-- GtkWidget* gtk_toolbar_prepend_element (GtkToolbar
			-- *toolbar, GtkToolbarChildType type, GtkWidget *widget,
			-- const char *text, const char *tooltip_text, const char
			-- *tooltip_private_text, GtkWidget *icon, GtkSignalFunc
			-- callback, gpointer user_data);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_insert_element (a_toolbar: POINTER; a_child_type: INTEGER; a_widget, a_text, a_tooltip_text, a_tooltip_private_text, a_icon, a_callback, some_user_data: POINTER; a_position: INTEGER): POINTER is
			-- GtkWidget* gtk_toolbar_insert_element (GtkToolbar
			-- *toolbar, GtkToolbarChildType type, GtkWidget *widget,
			-- const char *text, const char *tooltip_text, const char
			-- *tooltip_private_text, GtkWidget *icon, GtkSignalFunc
			-- callback, gpointer user_data, gint position);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_append_widget (a_toolbar, a_widget, a_tooltip_text, a_tooltip_private_text: POINTER) is
			-- void gtk_toolbar_append_widget (GtkToolbar *toolbar,
			-- GtkWidget *widget, const char *tooltip_text, const char
			-- *tooltip_private_text);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_prepend_widget (a_toolbar, a_widget, a_tooltip_text, a_tooltip_private_text: POINTER) is
			-- void gtk_toolbar_prepend_widget (GtkToolbar *toolbar,
			-- GtkWidget *widget, const char *tooltip_text, const char
			-- *tooltip_private_text);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_insert_widget (a_toolbar, a_widget, a_tooltip_text, a_tooltip_private_text: POINTER; a_position: INTEGER) is
			-- void gtk_toolbar_insert_widget (GtkToolbar *toolbar,
			-- GtkWidget *widget, const char *tooltip_text, const char
			-- *tooltip_private_text, gint position);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_set_style (a_toolbar: POINTER; a_style: INTEGER) is
			-- void gtk_toolbar_set_style (GtkToolbar *toolbar,
			-- GtkToolbarStyle style);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_insert_stock (a_toolbar, a_stock_id, a_tooltip_text, a_tooltip_private_text, a_callback, some_user_data: POINTER; a_position: INTEGER): POINTER is
			-- GtkWidget* gtk_toolbar_insert_stock (GtkToolbar *toolbar,
			-- const gchar *stock_id, const char *tooltip_text, const
			-- char *tooltip_private_text, GtkSignalFunc callback,
			-- gpointer user_data, gint position);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_set_icon_size (a_toolbar: POINTER; an_icon_size: INTEGER) is
			-- void gtk_toolbar_set_icon_size (GtkToolbar *toolbar,
			-- GtkIconSize icon_size);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_remove_space (a_toolbar: POINTER; a_position: INTEGER) is
			-- void gtk_toolbar_remove_space (GtkToolbar *toolbar, gint
			-- position);
		external "C use <gtk/gtk.h>"
		end

	gtk_toolbar_unset_style (a_toolbar: POINTER) is
			-- void gtk_toolbar_unset_style (GtkToolbar *toolbar);
		external "C use <gtk/gtk.h>"
		end

end -- class GTK_TOOLBAR_EXTERNALS
