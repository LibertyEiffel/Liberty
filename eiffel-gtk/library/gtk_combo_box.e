indexing
	description: "GtkComboBox -- A widget used to choose from a list of items."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_COMBO_BOX
inherit
	GTK_BIN

	-- GtkComboBox implements AtkImplementorIface, GtkCellEditable and
	-- GtkCellLayout interfaces.
	
creation make

feature -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkComboBox)"
		end

feature {NONE} -- Creation


feature -- Properties

	--   "active"               gint                  : Read / Write
	--   "add-tearoffs"         gboolean              : Read / Write
	--   "column-span-column"   gint                  : Read / Write
	--   "focus-on-click"       gboolean              : Read / Write
	--   "has-frame"            gboolean              : Read / Write
	--   "model"                GtkTreeModel          : Read / Write
	--   "row-span-column"      gint                  : Read / Write
	--   "wrap-width"           gint                  : Read / Write

	-- Style Properties

	--   "appears-as-list"      gboolean              : Read

	-- Signals

	-- "changed"   void        user_function      (GtkComboBox *widget,
	--                                             gpointer     user_data)      : Run last

	-- Description

	-- A GtkComboBox is a widget that allows the user to choose from a list of valid choices. The GtkComboBox displays the selected choice. When activated, the GtkComboBox displays a popup which allows the user to make a new choice. The style in which the selected value is displayed, and the style of the popup is determined by the current theme. It may be similar to a GtkOptionMenu, or similar to a Windows-style combo box.

	-- Unlike its predecessors GtkCombo and GtkOptionMenu, the GtkComboBox uses the model-view pattern; the list of valid choices is specified in the form of a tree model, and the display of the choices can be adapted to the data in the model by using cell renderers, as you would in a tree view. This is possible since GtkComboBox implements the GtkCellLayout interface. The tree model holding the valid choices is not restricted to a flat list, it can be a real tree, and the popup will reflect the tree structure.

	-- In addition to the model-view API, GtkComboBox offers a simple API which is suitable for text-only combo boxes, and hides the complexity of managing the data in a model. It consists of the functions gtk_combo_box_new_text(), gtk_combo_box_append_text(), gtk_combo_box_insert_text(), gtk_combo_box_prepend_text(), gtk_combo_box_remove_text() and gtk_combo_box_get_active_text().
	-- Details
	-- 

	-- typedef struct _GtkComboBox GtkComboBox;

	-- gtk_combo_box_new ()

	-- GtkWidget*  gtk_combo_box_new               (void);

	-- Creates a new empty GtkComboBox.

	-- Returns : 	A new GtkComboBox.

	-- Since 2.4
	-- gtk_combo_box_new_with_model ()

	-- GtkWidget*  gtk_combo_box_new_with_model    (GtkTreeModel *model);

	-- Creates a new GtkComboBox with the model initialized to model.

	-- model : 	A GtkTreeModel.
	-- Returns : 	A new GtkComboBox.

	-- Since 2.4
	-- gtk_combo_box_get_wrap_width ()

	-- gint        gtk_combo_box_get_wrap_width    (GtkComboBox *combo_box);

	-- Returns the wrap width which is used to determine the number of columns for the popup menu. If the wrap width is larger than 1, the combo box is in table mode.

	-- combo_box : 	A GtkComboBox.
	-- Returns : 	the wrap width.

	-- Since 2.6
	-- gtk_combo_box_set_wrap_width ()

	-- void        gtk_combo_box_set_wrap_width    (GtkComboBox *combo_box,
	--                                              gint width);

	-- Sets the wrap width of combo_box to be width. The wrap width is basically the preferred number of columns when you want the popup to be layed out in a table.

	-- combo_box : 	A GtkComboBox.
	-- width : 	Preferred number of columns.

	-- Since 2.4
	-- gtk_combo_box_get_row_span_column ()

	-- gint        gtk_combo_box_get_row_span_column
	--                                             (GtkComboBox *combo_box);

	-- Returns the column with row span information for combo_box.

	-- combo_box : 	A GtkComboBox.
	-- Returns : 	the row span column.

	-- Since 2.6
	-- gtk_combo_box_set_row_span_column ()

	-- void        gtk_combo_box_set_row_span_column
	--                                             (GtkComboBox *combo_box,
	--                                              gint row_span);

	-- Sets the column with row span information for combo_box to be row_span. The row span column contains integers which indicate how many rows an item should span.

	-- combo_box : 	A GtkComboBox.
	-- row_span : 	A column in the model passed during construction.

	-- Since 2.4
	-- gtk_combo_box_get_column_span_column ()

	-- gint        gtk_combo_box_get_column_span_column
	--                                             (GtkComboBox *combo_box);

	-- Returns the column with column span information for combo_box.

	-- combo_box : 	A GtkComboBox.
	-- Returns : 	the column span column.

	-- Since 2.6
	-- gtk_combo_box_set_column_span_column ()

	-- void        gtk_combo_box_set_column_span_column
	--                                             (GtkComboBox *combo_box,
	--                                              gint column_span);

	-- Sets the column with column span information for combo_box to be column_span. The column span column contains integers which indicate how many columns an item should span.

	-- combo_box : 	A GtkComboBox.
	-- column_span : 	A column in the model passed during construction.

	-- Since 2.4
	-- gtk_combo_box_get_active ()

	-- gint        gtk_combo_box_get_active        (GtkComboBox *combo_box);

	-- Returns the index of the currently active item, or -1 if there's no active item. If the model is a non-flat treemodel, and the active item is not an immediate child of the root of the tree, this function returns gtk_tree_path_get_indices (path)[0], where path is the GtkTreePath of the active item.

	-- combo_box : 	A GtkComboBox.
	-- Returns : 	An integer which is the index of the currently active item, or -1 if there's no active item.

	-- Since 2.4
	-- gtk_combo_box_set_active ()

	-- void        gtk_combo_box_set_active        (GtkComboBox *combo_box,
	--                                              gint index_);

	-- Sets the active item of combo_box to be the item at index.

	-- combo_box : 	A GtkComboBox.
	-- index_ : 	An index in the model passed during construction, or -1 to have no active item.

	-- Since 2.4
	-- gtk_combo_box_get_active_iter ()

	-- gboolean    gtk_combo_box_get_active_iter   (GtkComboBox *combo_box,
	--                                              GtkTreeIter *iter);

	-- Sets iter to point to the current active item, if it exists.

	-- combo_box : 	A GtkComboBox
	-- iter : 	The uninitialized GtkTreeIter.
	-- Returns : 	TRUE, if iter was set

	-- Since 2.4
	-- gtk_combo_box_set_active_iter ()

	-- void        gtk_combo_box_set_active_iter   (GtkComboBox *combo_box,
	--                                              GtkTreeIter *iter);

	-- Sets the current active item to be the one referenced by iter. iter must correspond to a path of depth one.

	-- combo_box : 	A GtkComboBox
	-- iter : 	The GtkTreeIter.

	-- Since 2.4
	-- gtk_combo_box_get_model ()

	-- GtkTreeModel* gtk_combo_box_get_model       (GtkComboBox *combo_box);

	-- Returns the GtkTreeModel which is acting as data source for combo_box.

	-- combo_box : 	A GtkComboBox.
	-- Returns : 	A GtkTreeModel which was passed during construction.

	-- Since 2.4
	-- gtk_combo_box_set_model ()

	-- void        gtk_combo_box_set_model         (GtkComboBox *combo_box,
	--                                              GtkTreeModel *model);

	-- Sets the model used by combo_box to be model. Will unset a previously set model (if applicable). If model is NULL, then it will unset the model.

	-- Note that this function does not clear the cell renderers, you have to call gtk_combo_box_cell_layout_clear() yourself if you need to set up different cell renderers for the new model.

	-- combo_box : 	A GtkComboBox.
	-- model : 	A GtkTreeModel.

	-- Since 2.4
	-- gtk_combo_box_new_text ()

	-- GtkWidget*  gtk_combo_box_new_text          (void);

	-- Convenience function which constructs a new text combo box, which is a GtkComboBox just displaying strings. If you use this function to create a text combo box, you should only manipulate its data source with the following convenience functions: gtk_combo_box_append_text(), gtk_combo_box_insert_text(), gtk_combo_box_prepend_text() and gtk_combo_box_remove_text().

	-- Returns : 	A new text combo box.

	-- Since 2.4
	-- gtk_combo_box_append_text ()

	-- void        gtk_combo_box_append_text       (GtkComboBox *combo_box,
	--                                              const gchar *text);

	-- Appends string to the list of strings stored in combo_box. Note that you can only use this function with combo boxes constructed with gtk_combo_box_new_text().

	-- combo_box : 	A GtkComboBox constructed using gtk_combo_box_new_text().
	-- text : 	A string.

	-- Since 2.4
	-- gtk_combo_box_insert_text ()

	-- void        gtk_combo_box_insert_text       (GtkComboBox *combo_box,
	--                                              gint position,
	--                                              const gchar *text);

	-- Inserts string at position in the list of strings stored in combo_box. Note that you can only use this function with combo boxes constructed with gtk_combo_box_new_text().

	-- combo_box : 	A GtkComboBox constructed using gtk_combo_box_new_text().
	-- position : 	An index to insert text.
	-- text : 	A string.

	-- Since 2.4
	-- gtk_combo_box_prepend_text ()

	-- void        gtk_combo_box_prepend_text      (GtkComboBox *combo_box,
	--                                              const gchar *text);

	-- Prepends string to the list of strings stored in combo_box. Note that you can only use this function with combo boxes constructed with gtk_combo_box_new_text().

	-- combo_box : 	A GtkComboBox constructed with gtk_combo_box_new_text().
	-- text : 	A string.

	-- Since 2.4
	-- gtk_combo_box_remove_text ()

	-- void        gtk_combo_box_remove_text       (GtkComboBox *combo_box,
	--                                              gint position);

	-- Removes the string at position from combo_box. Note that you can only use this function with combo boxes constructed with gtk_combo_box_new_text().

	-- combo_box : 	A GtkComboBox constructed with gtk_combo_box_new_text().
	-- position : 	Index of the item to remove.

	-- Since 2.4
	-- gtk_combo_box_get_active_text ()

	-- gchar*      gtk_combo_box_get_active_text   (GtkComboBox *combo_box);

	-- Returns the currently active string in combo_box or NULL if none is selected. Note that you can only use this function with combo boxes constructed with gtk_combo_box_new_text() and with GtkComboBoxEntrys.

	-- combo_box : 	A GtkComboBox constructed with gtk_combo_box_new_text().
	-- Returns : 	a newly allocated string containing the currently active text.

	-- Since 2.6
	-- gtk_combo_box_popup ()

	-- void        gtk_combo_box_popup             (GtkComboBox *combo_box);

	-- Pops up the menu or dropdown list of combo_box.

	-- This function is mostly intended for use by accessibility technologies; applications should have little use for it.

	-- combo_box : 	a GtkComboBox

	-- Since 2.4
	-- gtk_combo_box_popdown ()

	-- void        gtk_combo_box_popdown           (GtkComboBox *combo_box);

	-- Hides the menu or dropdown list of combo_box.

	-- This function is mostly intended for use by accessibility technologies; applications should have little use for it.

	-- combo_box : 	a GtkComboBox

	-- Since 2.4
	-- gtk_combo_box_get_popup_accessible ()

	-- AtkObject*  gtk_combo_box_get_popup_accessible
	--                                             (GtkComboBox *combo_box);

	-- Gets the accessible object corresponding to the combo box's popup.

	-- This function is mostly intended for use by accessibility technologies; applications should have little use for it.

	-- combo_box : 	a GtkComboBox
	-- Returns : 	the accessible object corresponding to the combo box's popup.

	-- Since 2.6
	-- gtk_combo_box_get_row_separator_func ()

	-- GtkTreeViewRowSeparatorFunc gtk_combo_box_get_row_separator_func
	--                                             (GtkComboBox *combo_box);

	-- Returns the current row separator function.

	-- combo_box : 	a GtkComboBox
	-- Returns : 	the current row separator function.

	-- Since 2.6
	-- gtk_combo_box_set_row_separator_func ()

	-- void        gtk_combo_box_set_row_separator_func
	--                                             (GtkComboBox *combo_box,
	--                                              GtkTreeViewRowSeparatorFunc func,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);

	-- Sets the row separator function, which is used to determine whether a row should be drawn as a separator. If the row separator function is NULL, no separators are drawn. This is the default value.

	-- combo_box : 	a GtkComboBox
	-- func : 	a GtkTreeViewRowSeparatorFunc
	-- data : 	user data to pass to func, or NULL
	-- destroy : 	destroy notifier for data, or NULL

	-- Since 2.6
	-- gtk_combo_box_set_add_tearoffs ()

	-- void        gtk_combo_box_set_add_tearoffs  (GtkComboBox *combo_box,
	--                                              gboolean add_tearoffs);

	-- Sets whether the popup menu should have a tearoff menu item.

	-- combo_box : 	a GtkComboBox
	-- add_tearoffs : 	TRUE to add tearoff menu items

	-- Since 2.6
	-- gtk_combo_box_get_add_tearoffs ()

	-- gboolean    gtk_combo_box_get_add_tearoffs  (GtkComboBox *combo_box);

	-- Gets the current value of the :add-tearoffs property.

	-- combo_box : 	a GtkComboBox
	-- Returns : 	the current value of the :add-tearoffs property.
	-- gtk_combo_box_set_focus_on_click ()

	-- void        gtk_combo_box_set_focus_on_click
	--                                             (GtkComboBox *combo,
	--                                              gboolean focus_on_click);

	-- Sets whether the combo box will grab focus when it is clicked with the mouse. Making mouse clicks not grab focus is useful in places like toolbars where you don't want the keyboard focus removed from the main area of the application.

	-- combo : 	a GtkComboBox
	-- focus_on_click : 	whether the combo box grabs focus when clicked with the mouse

	-- Since 2.6
	-- gtk_combo_box_get_focus_on_click ()

	-- gboolean    gtk_combo_box_get_focus_on_click
	--                                             (GtkComboBox *combo);

	-- Returns whether the combo box grabs focus when it is clicked with the mouse. See gtk_combo_box_set_focus_on_click().

	-- combo : 	a GtkComboBox
	-- Returns : 	TRUE if the combo box grabs focus when it is clicked with the mouse.

	-- Since 2.6
	-- Property Details
	-- The "active" property

	--   "active"               gint                  : Read / Write

	-- The item which is currently active. If the model is a non-flat treemodel, and the active item is not an immediate child of the root of the tree, this property has the value gtk_tree_path_get_indices (path)[0], where path is the GtkTreePath of the active item.

	-- Allowed values: >= -1

	-- Default value: -1

	-- Since 2.4
	-- The "add-tearoffs" property

	--   "add-tearoffs"         gboolean              : Read / Write

	-- The add-tearoffs property controls whether generated menus have tearoff menu items.

	-- Note that this only affects menu style combo boxes.

	-- Default value: FALSE

	-- Since 2.6
	-- The "column-span-column" property

	--   "column-span-column"   gint                  : Read / Write

	-- If this is set to a non-negative value, it must be the index of a column of type G_TYPE_INT in the model.

	-- The values of that column are used to determine how many columns a value in the list will span.

	-- Allowed values: >= -1

	-- Default value: -1

	-- Since 2.4
	-- The "focus-on-click" property

	--   "focus-on-click"       gboolean              : Read / Write

	-- Whether the combo box grabs focus when it is clicked with the mouse.

	-- Default value: TRUE
	-- The "has-frame" property

	--   "has-frame"            gboolean              : Read / Write

	-- The has-frame property controls whether a frame is drawn around the entry.

	-- Default value: TRUE

	-- Since 2.6
	-- The "model" property

	--   "model"                GtkTreeModel          : Read / Write

	-- The model from which the combo box takes the values shown in the list.

	-- Since 2.4
	-- The "row-span-column" property

	--   "row-span-column"      gint                  : Read / Write

	-- If this is set to a non-negative value, it must be the index of a column of type G_TYPE_INT in the model.

	-- The values of that column are used to determine how many rows a value in the list will span. Therefore, the values in the model column pointed to by this property must be greater than zero and not larger than wrap-width.

	-- Allowed values: >= -1

	-- Default value: -1

	-- Since 2.4
	-- The "wrap-width" property

	--   "wrap-width"           gint                  : Read / Write

	-- If wrap-width is set to a positive value, the list will be displayed in multiple columns, the number of columns is determined by wrap-width.

	-- Allowed values: >= 0

	-- Default value: 0

	-- Since 2.4
	-- Style Property Details
	-- The "appears-as-list" style property

	--   "appears-as-list"      gboolean              : Read

	-- Whether dropdowns should look like lists rather than menus.

	-- Default value: FALSE
	-- Signal Details
	-- The "changed" signal

	-- void        user_function                  (GtkComboBox *widget,
	--                                             gpointer     user_data)      : Run last

	-- The changed signal is emitted when the active item is changed. The can be due to the user selecting a different item from the list, or due to a call to gtk_combo_box_set_active_iter(). It will also be emitted while typing into a GtkComboBoxEntry, as well as when selecting an item from the GtkComboBoxEntry's list.

	-- widget : 	the object which received the signal
	-- user_data : 	user data set when the signal handler was connected.

	-- Since 2.4
	-- See Also

	-- GtkComboBoxEntry, GtkTreeModel, GtkCellRenderer

feature {} -- External calls
	gtk_combo_box_new: POINTER is -- 	GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_new_with_model (a_model: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_wrap_width (a_combo_box: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_wrap_width (a_combo_box: POINTER; a_width: INTEGER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_row_span_column (a_combo_box: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_row_span_column (a_combo_box: POINTER; a_row_span: INTEGER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_column_span_column (a_combo_box: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_column_span_column (a_combo_box: POINTER; a_column_span: INTEGER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_active (a_combo_box: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_active (a_combo_box: POINTER; an_index: INTEGER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_active_iter (a_combo_box: POINTER; a_gtktreeiter: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_active_iter (a_combo_box: POINTER; a_gtktreeiter: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_model (a_combo_box: POINTER): POINTER is -- GtkTreeModel*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_model (a_combo_box: POINTER; a_model: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_new_text is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_append_text (a_combo_box: POINTER; a_text: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_insert_text (a_combo_box: POINTER; a_position: INTEGER; a_text: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_prepend_text (a_combo_box: POINTER; a_text: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_remove_text (a_combo_box: POINTER; a_position: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_active_text (a_combo_box: POINTER): POINTER is --	gchar*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_popup (a_combo_box: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_popdown (a_combo_box: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_popup_accessible (a_combo_box: POINTER): POINTER is -- AtkObject*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_row_separator_func (a_combo_box: POINTER): POINTER is -- GtkTreeViewRowSeparatorFunc
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_row_separator_func (a_combo_box: POINTER; a_gtktreeviewrowseparatorfunc: POINTER; some_data; a_gtkdestroynotify: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_add_tearoffs (a_combo_box: POINTER, gboolean add_tearoffs) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_add_tearoffs (a_combo_box: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_set_focus_on_click (a_combo_box: POINTER; gboolean focus_on_click) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_combo_box_get_focus_on_click (a_combo_box: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end
end
