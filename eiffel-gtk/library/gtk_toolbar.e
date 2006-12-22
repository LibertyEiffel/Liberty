indexing
	description: "GtkToolbar -- Create bars of buttons and other widgets."
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

			-- Description: a toolbar is created with a call to
			-- gtk_toolbar_new().

			-- A toolbar can contain instances of a subclass of
			-- GtkToolItem. To add a GtkToolItem to the a toolbar, use
			-- gtk_toolbar_insert(). To remove an item from the toolbar
			-- use gtk_container_remove(). To add a button to the
			-- toolbar, add an instance of GtkToolButton.
			
			-- Toolbar items can be visually grouped by adding instances
			-- of GtkSeparatorToolItem to the toolbar. If a
			-- GtkSeparatorToolItem has the "expand" property set to TRUE
			-- and the "draw" property set to FALSE the effect is to
			-- force all following items to the end of the toolbar.
			
			-- Creating a context menu for the toolbar can be done by
			-- connecting to the GtkToolbar::popup-context-menu signal.

class GTK_TOOLBAR

inherit GTK_CONTAINER

	-- TODO: GtkToolbar implements AtkImplementorIface.

creation make, from_external_pointer

feature {} -- Creation
	make is
			-- Creates a new toolbar.
		do
			from_external_pointer (gtk_toolbar_new)
		end

feature 
	
	insert_item (an_item: GTK_TOOL_ITEM; a_position: INTEGER) is
			-- Insert `an_item' into Current toolbar at `a_position'. If
			-- `a_position' is 0 `an_item' is prepended to the start of
			-- the toolbar. If 'a_position' is negative, the item is
			-- appended to the end of the toolbar.

			-- TODO: provide prepend and append (pos<0 and pos=0)
			-- features
		require 
			item_not_void: an_item /= Void
		do
			gtk_toolbar_insert (handle, an_item.handle, a_position)
		end

	index_of (an_item: GTK_TOOL_ITEM): INTEGER is
			-- the position of `an_item' on the toolbar, starting from
			-- 0. It is an error if item is not a child of the toolbar.
		require 
			item_not_void: an_item /= Void
			valid_item: -- TODO: an_item must be a child of Current toolbar
		do
			Result := gtk_toolbar_get_item_index(handle,an_item.handle)
		end

	count: INTEGER is
			-- the number of items on the toolbar.

			-- Note: C name of this feature is gtk_toolbar_get_n_items.
		do
			Result := gtk_toolbar_get_n_items(handle)
		end
	
	item (an_index: INTEGER): GTK_TOOL_ITEM is
			-- then item on toolbar at `an_index'; Void if `an_index' is
			-- not valid.
		require
			valid_index: -- TODO:
		local ptr: POINTER
		do
			ptr:=gtk_toolbar_get_nth_item(handle, an_index)
		end

	--   gtk_toolbar_get_drop_index ()

	--  gint        gtk_toolbar_get_drop_index      (GtkToolbar *toolbar,
	--                                               gint x,
	--                                               gint y);

	--    Returns the position corresponding to the indicated point on toolbar. This
	--    is useful when dragging items to the toolbar: this function returns the
	--    position a new item should be inserted.

	--    x and y are in toolbar coordinates.

	--    toolbar : a GtkToolbar
	--    x :       x coordinate of a point on the toolbar
	--    y :       y coordinate of a point on the toolbar
	--    Returns : The position corresponding to the point (x, y) on the toolbar.

	--    Since 2.4

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_set_drop_highlight_item ()

	--  void        gtk_toolbar_set_drop_highlight_item
	--                                              (GtkToolbar *toolbar,
	--                                               GtkToolItem *tool_item,
	--                                               gint index_);

	--    Highlights toolbar to give an idea of what it would look like if item was
	--    added to toolbar at the position indicated by index_. If item is NULL,
	--    highlighting is turned off. In that case index_ is ignored.

	--    The tool_item passed to this function must not be part of any widget
	--    hierarchy. When an item is set as drop highlight item it can not added to
	--    any widget hierarchy or used as highlight item for another toolbar.

	--    toolbar :   a GtkToolbar
	--    tool_item : a GtkToolItem, or NULL to turn of highlighting
	--    index_ :    a position on toolbar

	--    Since 2.4

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_set_show_arrow ()

	--  void        gtk_toolbar_set_show_arrow      (GtkToolbar *toolbar,
	--                                               gboolean show_arrow);

	--    Sets whether to show an overflow menu when toolbar doesn't have room for
	--    all items on it. If TRUE, items that there are not room are available
	--    through an overflow menu.

	--    toolbar :    a GtkToolbar
	--    show_arrow : Whether to show an overflow menu

	--    Since 2.4

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_set_orientation ()

	--  void        gtk_toolbar_set_orientation     (GtkToolbar *toolbar,
	--                                               GtkOrientation orientation);

	--    Sets whether a toolbar should appear horizontally or vertically.

	--    toolbar :     a GtkToolbar.
	--    orientation : a new GtkOrientation.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_set_tooltips ()

	--  void        gtk_toolbar_set_tooltips        (GtkToolbar *toolbar,
	--                                               gboolean enable);

	--    Sets if the tooltips of a toolbar should be active or not.

	--    toolbar : a GtkToolbar.
	--    enable :  set to FALSE to disable the tooltips, or TRUE to enable them.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_unset_icon_size ()

	--  void        gtk_toolbar_unset_icon_size     (GtkToolbar *toolbar);

	--   Warning

	--    gtk_toolbar_unset_icon_size is deprecated and should not be used in
	--    newly-written code.

	--    Unsets toolbar icon size set with gtk_toolbar_set_icon_size(), so that
	--    user preferences will be used to determine the icon size.

	--    toolbar : a GtkToolbar

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_get_show_arrow ()

	--  gboolean    gtk_toolbar_get_show_arrow      (GtkToolbar *toolbar);

	--    Returns whether the toolbar has an overflow menu. See
	--    gtk_toolbar_set_show_arrow().

	--    toolbar : a GtkToolbar
	--    Returns : TRUE if the toolbar has an overflow menu.

	--    Since 2.4

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_get_orientation ()

	--  GtkOrientation gtk_toolbar_get_orientation  (GtkToolbar *toolbar);

	--    Retrieves the current orientation of the toolbar. See
	--    gtk_toolbar_set_orientation().

	--    toolbar : a GtkToolbar
	--    Returns : the orientation

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_get_style ()

	--  GtkToolbarStyle gtk_toolbar_get_style       (GtkToolbar *toolbar);

	--    Retrieves whether the toolbar has text, icons, or both . See
	--    gtk_toolbar_set_style().

	--    toolbar : a GtkToolbar
	--    Returns : the current style of toolbar

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_get_icon_size ()

	--  GtkIconSize gtk_toolbar_get_icon_size       (GtkToolbar *toolbar);

	--    Retrieves the icon size for the toolbar. See gtk_toolbar_set_icon_size().

	--    toolbar : a GtkToolbar
	--    Returns : the current icon size for the icons on the toolbar.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_get_tooltips ()

	--  gboolean    gtk_toolbar_get_tooltips        (GtkToolbar *toolbar);

	--    Retrieves whether tooltips are enabled. See gtk_toolbar_set_tooltips().

	--    toolbar : a GtkToolbar
	--    Returns : TRUE if tooltips are enabled

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_get_relief_style ()

	--  GtkReliefStyle gtk_toolbar_get_relief_style (GtkToolbar *toolbar);

	--    Returns the relief style of buttons on toolbar. See
	--    gtk_button_set_relief().

	--    toolbar : a GtkToolbar
	--    Returns : The relief style of buttons on toolbar.

	--    Since 2.4

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_append_item ()

	--  GtkWidget*  gtk_toolbar_append_item         (GtkToolbar *toolbar,
	--                                               const char *text,
	--                                               const char *tooltip_text,
	--                                               const char *tooltip_private_text,
	--                                               GtkWidget *icon,
	--                                               GtkSignalFunc callback,
	--                                               gpointer user_data);

	--   Warning

	--    gtk_toolbar_append_item is deprecated and should not be used in
	--    newly-written code.

	--    Inserts a new item into the toolbar. You must specify the position in the
	--    toolbar where it will be inserted.

	--    callback must be a pointer to a function taking a GtkWidget and a gpointer
	--    as arguments. Use the GTK_SIGNAL_FUNC() to cast the function to
	--    GtkSignalFunc.

	--    toolbar :              a GtkToolbar.
	--    text :                 give your toolbar button a label.
	--    tooltip_text :         a string that appears when the user holds the mouse
	--                           over this item.
	--    tooltip_private_text : use with GtkTipsQuery.
	--    icon :                 a GtkWidget that should be used as the button's
	--                           icon.
	--    callback :             the function to be executed when the button is
	--                           pressed.
	--    user_data :            a pointer to any data you wish to be passed to the
	--                           callback.
	--    Returns :              the new toolbar item as a GtkWidget.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_prepend_item ()

	--  GtkWidget*  gtk_toolbar_prepend_item        (GtkToolbar *toolbar,
	--                                               const char *text,
	--                                               const char *tooltip_text,
	--                                               const char *tooltip_private_text,
	--                                               GtkWidget *icon,
	--                                               GtkSignalFunc callback,
	--                                               gpointer user_data);

	--   Warning

	--    gtk_toolbar_prepend_item is deprecated and should not be used in
	--    newly-written code.

	--    Adds a new button to the beginning (top or left edges) of the given
	--    toolbar.

	--    callback must be a pointer to a function taking a GtkWidget and a gpointer
	--    as arguments. Use the GTK_SIGNAL_FUNC() to cast the function to
	--    GtkSignalFunc.

	--    toolbar :              a GtkToolbar.
	--    text :                 give your toolbar button a label.
	--    tooltip_text :         a string that appears when the user holds the mouse
	--                           over this item.
	--    tooltip_private_text : use with GtkTipsQuery.
	--    icon :                 a GtkWidget that should be used as the button's
	--                           icon.
	--    callback :             the function to be executed when the button is
	--                           pressed.
	--    user_data :            a pointer to any data you wish to be passed to the
	--                           callback.
	--    Returns :              the new toolbar item as a GtkWidget.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_insert_item ()

	--  GtkWidget*  gtk_toolbar_insert_item         (GtkToolbar *toolbar,
	--                                               const char *text,
	--                                               const char *tooltip_text,
	--                                               const char *tooltip_private_text,
	--                                               GtkWidget *icon,
	--                                               GtkSignalFunc callback,
	--                                               gpointer user_data,
	--                                               gint position);

	--   Warning

	--    gtk_toolbar_insert_item is deprecated and should not be used in
	--    newly-written code.

	--    Inserts a new item into the toolbar. You must specify the position in the
	--    toolbar where it will be inserted.

	--    callback must be a pointer to a function taking a GtkWidget and a gpointer
	--    as arguments. Use the GTK_SIGNAL_FUNC() to cast the function to
	--    GtkSignalFunc.

	--    toolbar :              a GtkToolbar.
	--    text :                 give your toolbar button a label.
	--    tooltip_text :         a string that appears when the user holds the mouse
	--                           over this item.
	--    tooltip_private_text : use with GtkTipsQuery.
	--    icon :                 a GtkWidget that should be used as the button's
	--                           icon.
	--    callback :             the function to be executed when the button is
	--                           pressed.
	--    user_data :            a pointer to any data you wish to be passed to the
	--                           callback.
	--    position :             the number of widgets to insert this item after.
	--    Returns :              the new toolbar item as a GtkWidget.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_append_space ()

	--  void        gtk_toolbar_append_space        (GtkToolbar *toolbar);

	--   Warning

	--    gtk_toolbar_append_space is deprecated and should not be used in
	--    newly-written code.

	--    Adds a new space to the end of the toolbar.

	--    toolbar : a GtkToolbar.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_prepend_space ()

	--  void        gtk_toolbar_prepend_space       (GtkToolbar *toolbar);

	--   Warning

	--    gtk_toolbar_prepend_space is deprecated and should not be used in
	--    newly-written code.

	--    Adds a new space to the beginning of the toolbar.

	--    toolbar : a GtkToolbar.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_insert_space ()

	--  void        gtk_toolbar_insert_space        (GtkToolbar *toolbar,
	--                                               gint position);

	--   Warning

	--    gtk_toolbar_insert_space is deprecated and should not be used in
	--    newly-written code.

	--    Inserts a new space in the toolbar at the specified position.

	--    toolbar :  a GtkToolbar
	--    position : the number of widgets after which a space should be inserted.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_append_element ()

	--  GtkWidget*  gtk_toolbar_append_element      (GtkToolbar *toolbar,
	--                                               GtkToolbarChildType type,
	--                                               GtkWidget *widget,
	--                                               const char *text,
	--                                               const char *tooltip_text,
	--                                               const char *tooltip_private_text,
	--                                               GtkWidget *icon,
	--                                               GtkSignalFunc callback,
	--                                               gpointer user_data);

	--   Warning

	--    gtk_toolbar_append_element is deprecated and should not be used in
	--    newly-written code.

	--    Adds a new element to the end of a toolbar.

	--    If type == GTK_TOOLBAR_CHILD_WIDGET, widget is used as the new element. If
	--    type == GTK_TOOLBAR_CHILD_RADIOBUTTON, widget is used to determine the
	--    radio group for the new element. In all other cases, widget must be NULL.

	--    callback must be a pointer to a function taking a GtkWidget and a gpointer
	--    as arguments. Use the GTK_SIGNAL_FUNC() to cast the function to
	--    GtkSignalFunc.

	--    toolbar :              a GtkToolbar.
	--    type :                 a value of type GtkToolbarChildType that determines
	--                           what widget will be.
	--    widget :               a GtkWidget, or NULL.
	--    text :                 the element's label.
	--    tooltip_text :         the element's tooltip.
	--    tooltip_private_text : used for context-sensitive help about this toolbar
	--                           element.
	--    icon :                 a GtkWidget that provides pictorial representation
	--                           of the element's function.
	--    callback :             the function to be executed when the button is
	--                           pressed.
	--    user_data :            any data you wish to pass to the callback.
	--    Returns :              the new toolbar element as a GtkWidget.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_prepend_element ()

	--  GtkWidget*  gtk_toolbar_prepend_element     (GtkToolbar *toolbar,
	--                                               GtkToolbarChildType type,
	--                                               GtkWidget *widget,
	--                                               const char *text,
	--                                               const char *tooltip_text,
	--                                               const char *tooltip_private_text,
	--                                               GtkWidget *icon,
	--                                               GtkSignalFunc callback,
	--                                               gpointer user_data);

	--   Warning

	--    gtk_toolbar_prepend_element is deprecated and should not be used in
	--    newly-written code.

	--    Adds a new element to the beginning of a toolbar.

	--    If type == GTK_TOOLBAR_CHILD_WIDGET, widget is used as the new element. If
	--    type == GTK_TOOLBAR_CHILD_RADIOBUTTON, widget is used to determine the
	--    radio group for the new element. In all other cases, widget must be NULL.

	--    callback must be a pointer to a function taking a GtkWidget and a gpointer
	--    as arguments. Use the GTK_SIGNAL_FUNC() to cast the function to
	--    GtkSignalFunc.

	--    toolbar :              a GtkToolbar.
	--    type :                 a value of type GtkToolbarChildType that determines
	--                           what widget will be.
	--    widget :               a GtkWidget, or NULL
	--    text :                 the element's label.
	--    tooltip_text :         the element's tooltip.
	--    tooltip_private_text : used for context-sensitive help about this toolbar
	--                           element.
	--    icon :                 a GtkWidget that provides pictorial representation
	--                           of the element's function.
	--    callback :             the function to be executed when the button is
	--                           pressed.
	--    user_data :            any data you wish to pass to the callback.
	--    Returns :              the new toolbar element as a GtkWidget.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_insert_element ()

	--  GtkWidget*  gtk_toolbar_insert_element      (GtkToolbar *toolbar,
	--                                               GtkToolbarChildType type,
	--                                               GtkWidget *widget,
	--                                               const char *text,
	--                                               const char *tooltip_text,
	--                                               const char *tooltip_private_text,
	--                                               GtkWidget *icon,
	--                                               GtkSignalFunc callback,
	--                                               gpointer user_data,
	--                                               gint position);

	--   Warning

	--    gtk_toolbar_insert_element is deprecated and should not be used in
	--    newly-written code.

	--    Inserts a new element in the toolbar at the given position.

	--    If type == GTK_TOOLBAR_CHILD_WIDGET, widget is used as the new element. If
	--    type == GTK_TOOLBAR_CHILD_RADIOBUTTON, widget is used to determine the
	--    radio group for the new element. In all other cases, widget must be NULL.

	--    callback must be a pointer to a function taking a GtkWidget and a gpointer
	--    as arguments. Use the GTK_SIGNAL_FUNC() to cast the function to
	--    GtkSignalFunc.

	--    toolbar :              a GtkToolbar.
	--    type :                 a value of type GtkToolbarChildType that determines
	--                           what widget will be.
	--    widget :               a GtkWidget, or NULL.
	--    text :                 the element's label.
	--    tooltip_text :         the element's tooltip.
	--    tooltip_private_text : used for context-sensitive help about this toolbar
	--                           element.
	--    icon :                 a GtkWidget that provides pictorial representation
	--                           of the element's function.
	--    callback :             the function to be executed when the button is
	--                           pressed.
	--    user_data :            any data you wish to pass to the callback.
	--    position :             the number of widgets to insert this element after.
	--    Returns :              the new toolbar element as a GtkWidget.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_append_widget ()

	--  void        gtk_toolbar_append_widget       (GtkToolbar *toolbar,
	--                                               GtkWidget *widget,
	--                                               const char *tooltip_text,
	--                                               const char *tooltip_private_text);

	--   Warning

	--    gtk_toolbar_append_widget is deprecated and should not be used in
	--    newly-written code.

	--    Adds a widget to the end of the given toolbar.

	--    toolbar :              a GtkToolbar.
	--    widget :               a GtkWidget to add to the toolbar.
	--    tooltip_text :         the element's tooltip.
	--    tooltip_private_text : used for context-sensitive help about this toolbar
	--                           element.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_prepend_widget ()

	--  void        gtk_toolbar_prepend_widget      (GtkToolbar *toolbar,
	--                                               GtkWidget *widget,
	--                                               const char *tooltip_text,
	--                                               const char *tooltip_private_text);

	--   Warning

	--    gtk_toolbar_prepend_widget is deprecated and should not be used in
	--    newly-written code.

	--    Adds a widget to the beginning of the given toolbar.

	--    toolbar :              a GtkToolbar.
	--    widget :               a GtkWidget to add to the toolbar.
	--    tooltip_text :         the element's tooltip.
	--    tooltip_private_text : used for context-sensitive help about this toolbar
	--                           element.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_insert_widget ()

	--  void        gtk_toolbar_insert_widget       (GtkToolbar *toolbar,
	--                                               GtkWidget *widget,
	--                                               const char *tooltip_text,
	--                                               const char *tooltip_private_text,
	--                                               gint position);

	--   Warning

	--    gtk_toolbar_insert_widget is deprecated and should not be used in
	--    newly-written code.

	--    Inserts a widget in the toolbar at the given position.

	--    toolbar :              a GtkToolbar.
	--    widget :               a GtkWidget to add to the toolbar.
	--    tooltip_text :         the element's tooltip.
	--    tooltip_private_text : used for context-sensitive help about this toolbar
	--                           element.
	--    position :             the number of widgets to insert this widget after.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_set_style ()

	--  void        gtk_toolbar_set_style           (GtkToolbar *toolbar,
	--                                               GtkToolbarStyle style);

	--    Alters the view of toolbar to display either icons only, text only, or
	--    both.

	--    toolbar : a GtkToolbar.
	--    style :   the new style for toolbar.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_insert_stock ()

	--  GtkWidget*  gtk_toolbar_insert_stock        (GtkToolbar *toolbar,
	--                                               const gchar *stock_id,
	--                                               const char *tooltip_text,
	--                                               const char *tooltip_private_text,
	--                                               GtkSignalFunc callback,
	--                                               gpointer user_data,
	--                                               gint position);

	--   Warning

	--    gtk_toolbar_insert_stock is deprecated and should not be used in
	--    newly-written code.

	--    Inserts a stock item at the specified position of the toolbar. If stock_id
	--    is not a known stock item ID, it's inserted verbatim, except that
	--    underscores used to mark mnemonics are removed.

	--    callback must be a pointer to a function taking a GtkWidget and a gpointer
	--    as arguments. Use the GTK_SIGNAL_FUNC() to cast the function to
	--    GtkSignalFunc.

	--    toolbar :              A GtkToolbar
	--    stock_id :             The id of the stock item you want to insert
	--    tooltip_text :         The text in the tooltip of the toolbar button
	--    tooltip_private_text : The private text of the tooltip
	--    callback :             The callback called when the toolbar button is
	--                           clicked.
	--    user_data :            user data passed to callback
	--    position :             The position the button shall be inserted at. -1
	--                           means at the end.
	--    Returns :              the inserted widget

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_set_icon_size ()

	--  void        gtk_toolbar_set_icon_size       (GtkToolbar *toolbar,
	--                                               GtkIconSize icon_size);

	--   Warning

	--    gtk_toolbar_set_icon_size is deprecated and should not be used in
	--    newly-written code.

	--    This function sets the size of stock icons in the toolbar. You can call it
	--    both before you add the icons and after they've been added. The size you
	--    set will override user preferences for the default icon size.

	--    This should only be used for special-purpose toolbars, normal application
	--    toolbars should respect the user preferences for the size of icons.

	--    toolbar :   A GtkToolbar
	--    icon_size : The GtkIconSize that stock icons in the toolbar shall have.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_remove_space ()

	--  void        gtk_toolbar_remove_space        (GtkToolbar *toolbar,
	--                                               gint position);

	--   Warning

	--    gtk_toolbar_remove_space is deprecated and should not be used in
	--    newly-written code.

	--    Removes a space from the specified position.

	--    toolbar :  a GtkToolbar.
	--    position : the index of the space to remove.

	--    --------------------------------------------------------------------------

	--   gtk_toolbar_unset_style ()

	--  void        gtk_toolbar_unset_style         (GtkToolbar *toolbar);

	--    Unsets a toolbar style set with gtk_toolbar_set_style(), so that user
	--    preferences will be used to determine the toolbar style.

	--    toolbar : a GtkToolbar




	-- Properties


	--    "icon-size"            GtkIconSize           : Read / Write
	--    "icon-size-set"        gboolean              : Read / Write
	--    "orientation"          GtkOrientation        : Read / Write
	--    "show-arrow"           gboolean              : Read / Write
	--    "toolbar-style"        GtkToolbarStyle       : Read / Write
	--    "tooltips"             gboolean              : Read / Write

	-- Child Properties


	--    "expand"               gboolean              : Read / Write
	--    "homogeneous"          gboolean              : Read / Write

	-- Style Properties


	--    "button-relief"        GtkReliefStyle        : Read
	--    "internal-padding"     gint                  : Read
	--    "max-child-expand"     gint                  : Read
	--    "shadow-type"          GtkShadowType         : Read
	--    "space-size"           gint                  : Read
	--    "space-style"          GtkToolbarSpaceStyle  : Read

	-- Property Details

	--   The "icon-size" property

	--    "icon-size"            GtkIconSize           : Read / Write

	--    The size of the icons in a toolbar is normally determined by the
	--    toolbar-icon-size setting. When this property is set, it overrides the
	--    setting.

	--    This should only be used for special-purpose toolbars, normal application
	--    toolbars should respect the user preferences for the size of icons.

	--    Default value: GTK_ICON_SIZE_LARGE_TOOLBAR

	--    Since 2.10

	--    --------------------------------------------------------------------------

	--   The "icon-size-set" property

	--    "icon-size-set"        gboolean              : Read / Write

	--    Is TRUE if the icon-size property has been set.

	--    Default value: FALSE

	--    Since 2.10

	--    --------------------------------------------------------------------------

	--   The "orientation" property

	--    "orientation"          GtkOrientation        : Read / Write

	--    The orientation of the toolbar.

	--    Default value: GTK_ORIENTATION_HORIZONTAL

	--    --------------------------------------------------------------------------

	--   The "show-arrow" property

	--    "show-arrow"           gboolean              : Read / Write

	--    If an arrow should be shown if the toolbar doesn't fit.

	--    Default value: TRUE

	--    --------------------------------------------------------------------------

	--   The "toolbar-style" property

	--    "toolbar-style"        GtkToolbarStyle       : Read / Write

	--    How to draw the toolbar.

	--    Default value: GTK_TOOLBAR_ICONS

	--    --------------------------------------------------------------------------

	--   The "tooltips" property

	--    "tooltips"             gboolean              : Read / Write

	--    If the tooltips of the toolbar should be active or not.

	--    Default value: TRUE

	--    Since 2.8

	-- Child Property Details

	--   The "expand" child property

	--    "expand"               gboolean              : Read / Write

	--    Whether the item should receive extra space when the toolbar grows.

	--    Default value: TRUE

	--    --------------------------------------------------------------------------

	--   The "homogeneous" child property

	--    "homogeneous"          gboolean              : Read / Write

	--    Whether the item should be the same size as other homogeneous items.

	--    Default value: TRUE

	-- Style Property Details

	--   The "button-relief" style property

	--    "button-relief"        GtkReliefStyle        : Read

	--    Type of bevel around toolbar buttons.

	--    Default value: GTK_RELIEF_NONE

	--    --------------------------------------------------------------------------

	--   The "internal-padding" style property

	--    "internal-padding"     gint                  : Read

	--    Amount of border space between the toolbar shadow and the buttons.

	--    Allowed values: >= 0

	--    Default value: 0

	--    --------------------------------------------------------------------------

	--   The "max-child-expand" style property

	--    "max-child-expand"     gint                  : Read

	--    Maximum amount of space an expandable item will be given.

	--    Allowed values: >= 0

	--    Default value: 2147483647

	--    --------------------------------------------------------------------------

	--   The "shadow-type" style property

	--    "shadow-type"          GtkShadowType         : Read

	--    Style of bevel around the toolbar.

	--    Default value: GTK_SHADOW_OUT

	--    --------------------------------------------------------------------------

	--   The "space-size" style property

	--    "space-size"           gint                  : Read

	--    Size of spacers.

	--    Allowed values: >= 0

	--    Default value: 12

	--    --------------------------------------------------------------------------

	--   The "space-style" style property

	--    "space-style"          GtkToolbarSpaceStyle  : Read

	--    Whether spacers are vertical lines or just blank.

	--    Default value: GTK_TOOLBAR_SPACE_LINE

	-- Signals

	--  "focus-home-or-end"
	--              gboolean    user_function      (GtkToolbar *toolbar,
	--                                              gboolean    focus_home,
	--                                              gpointer    user_data)       : Run last / Action
	--  "move-focus"
	--              gboolean    user_function      (GtkToolbar      *toolbar,
	--                                              GtkDirectionType dir,
	--                                              gpointer         user_data)      : Run last / Action
	--  "orientation-changed"
	--              void        user_function      (GtkToolbar    *toolbar,
	--                                              GtkOrientation orientation,
	--                                              gpointer       user_data)        : Run first
	--  "popup-context-menu"
	--              gboolean    user_function      (GtkToolbar *toolbar,
	--                                              gint        x,
	--                                              gint        y,
	--                                              gint        button,
	--                                              gpointer    user_data)      : Run last
	--  "style-changed"
	--              void        user_function      (GtkToolbar     *toolbar,
	--                                              GtkToolbarStyle style,
	--                                              gpointer        user_data)      : Run first

	-- Signal Details

	--   The "focus-home-or-end" signal

	--  gboolean    user_function                  (GtkToolbar *toolbar,
	--                                              gboolean    focus_home,
	--                                              gpointer    user_data)       : Run last / Action

	--    A keybinding signal used internally by GTK+. This signal can't be used in
	--    application code

	--    toolbar :    the GtkToolbar which emitted the signal
	--    focus_home : TRUE if the first item should be focused
	--    user_data :  user data set when the signal handler was connected.
	--    Returns :    TRUE if the signal was handled, FALSE if not

	--    --------------------------------------------------------------------------

	--   The "move-focus" signal

	--  gboolean    user_function                  (GtkToolbar      *toolbar,
	--                                              GtkDirectionType dir,
	--                                              gpointer         user_data)      : Run last / Action

	--    A keybinding signal used internally by GTK+. This signal can't be used in
	--    application code.

	--    toolbar :   the GtkToolbar which emitted the signal
	--    dir :       a GtkDirection
	--    user_data : user data set when the signal handler was connected.
	--    Returns :   TRUE if the signal was handled, FALSE if not

	--    --------------------------------------------------------------------------

	--   The "orientation-changed" signal

	--  void        user_function                  (GtkToolbar    *toolbar,
	--                                              GtkOrientation orientation,
	--                                              gpointer       user_data)        : Run first

	--    Emitted when the orientation of the toolbar changes.

	--    toolbar :     the object which emitted the signal
	--    orientation : the new GtkOrientation of the toolbar
	--    user_data :   user data set when the signal handler was connected.

	--    --------------------------------------------------------------------------

	--   The "popup-context-menu" signal

	--  gboolean    user_function                  (GtkToolbar *toolbar,
	--                                              gint        x,
	--                                              gint        y,
	--                                              gint        button,
	--                                              gpointer    user_data)      : Run last

	--    Emitted when the user right-clicks the toolbar or uses the keybinding to
	--    display a popup menu.

	--    Application developers should handle this signal if they want to display a
	--    context menu on the toolbar. The context-menu should appear at the
	--    coordinates given by x and y. The mouse button number is given by the
	--    button parameter. If the menu was popped up using the keybaord, button is
	--    -1.

	--    toolbar :   the GtkToolbar which emitted the signal
	--    x :         the x coordinate of the point where the menu should appear
	--    y :         the y coordinate of the point where the menu should appear
	--    button :    the mouse button the user pressed, or -1
	--    user_data : user data set when the signal handler was connected.
	--    Returns :   return TRUE if the signal was handled, FALSE if not

	--    --------------------------------------------------------------------------

	--   The "style-changed" signal

	--  void        user_function                  (GtkToolbar     *toolbar,
	--                                              GtkToolbarStyle style,
	--                                              gpointer        user_data)      : Run first

	--    Emitted when the style of the toolbar changes.

	--    toolbar :   The GtkToolbar which emitted the signal
	--    style :     the new GtkToolbarStyle of the toolbar
	--    user_data : user data set when the signal handler was connected.

feature -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkToolbar)"
		end

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
end -- class GTK_TOOLBAR
