note
	description: "GtkToolbar -- Create bars of buttons and other widgets."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

class GTK_TOOLBAR
	-- A toolbar can contain instances of a subclass of GtkToolItem. To
	-- add a GtkToolItem to the a toolbar, use `insert_item'. To remove
	-- an item from the toolbar use GTK_CONTAINER's `remove'. To add a
	-- button to the toolbar, add an instance of GtkToolButton.
			
	-- Toolbar items can be visually grouped by adding instances of
	-- GtkSeparatorToolItem to the toolbar. If a GtkSeparatorToolItem
	-- has the "expand" property set to TRUE and the "draw" property
	-- set to FALSE the effect is to force all following items to the
	-- end of the toolbar.
	
	-- Creating a context menu for the toolbar can be done by
	-- connecting to the GtkToolbar::popup-context-menu signal.

inherit
	GTK_CONTAINER
		rename
			style as container_style
			set_style as set_container_style
		end

	-- TODO: GtkToolbar implements AtkImplementorIface.

insert
	GTK_TOOLBAR_EXTERNALS
	GTK_ORIENTATION
	GTK_TOOLBAR_STYLE

create {ANY} make, from_external_pointer

feature {} -- Creation

	make is
			-- Creates a new toolbar.
		do
			from_external_pointer (gtk_toolbar_new)
		end

feature {ANY}
	prepend (an_item: GTK_TOOL_ITEM) is
			-- Prepend `an_item' into Current toolbar to the start of
			-- the toolbar. 
		require item_not_void: an_item /= Void
		do
			gtk_toolbar_insert (handle, an_item.handle, 0)
		end

	append (an_item: GTK_TOOL_ITEM) is
			-- Append `an_item' into Current toolbar to the end of the
			-- toolbar.
		require item_not_void: an_item /= Void
		do
			gtk_toolbar_insert (handle, an_item.handle, -1)
		end

	insert_item (an_item: GTK_TOOL_ITEM; a_position: INTEGER) is
			-- Insert `an_item' into Current toolbar at `a_position'. If
			-- `a_position' is 0 `an_item' is prepended to the start of
			-- the toolbar. If 'a_position' is negative, the item is
			-- appended to the end of the toolbar.

			-- TODO: provide prepend and append (pos<0 and pos=0)
			-- features
		require
			item_not_void: an_item /= Void
			valid_index: is_valid_index(a_position)
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

	is_valid_index(an_index: INTEGER): BOOLEAN is
			-- Is `an_index' valid to access GTK_TOOLBAR's items?.
		do
			Result:=(gtk_toolbar_get_nth_item(handle, an_index).is_not_null)
		end
	
	item (an_index: INTEGER): GTK_TOOL_ITEM is
			-- then item on toolbar at `an_index'; Void if `an_index' is
			-- not valid.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_TOOL_ITEM]
		do
			Result := factory.wrapper_or_void (gtk_toolbar_get_nth_item(handle, an_index))
		end

	drop_index (an_x, an_y: INTEGER): INTEGER is
			-- the position corresponding to the indicated point
			-- (`an_x',`an_y') on toolbar. This is useful when dragging
			-- items to the toolbar: this is the position a new item
			-- should be inserted.
		do
			Result := gtk_toolbar_get_drop_index (handle, an_x,an_y)
		end

	set_drop_highlight_item (an_item: GTK_TOOL_ITEM; an_index: INTEGER) is
			-- Highlights toolbar to give an idea of what it would look
			-- like if item was added to toolbar at the position
			-- indicated by `an_index'. 
			
			-- `an_item' must not be part of any widget hierarchy. When
			-- an item is set as drop highlight item it can not added to
			-- any widget hierarchy or used as highlight item for another
			-- toolbar.
		require
			item_not_void: an_item /= Void
			item_not_part_any_hierarchy: -- TODO 
		do
			gtk_toolbar_set_drop_highlight_item (handle, an_item.handle, an_index)
		end

	disable_highlighting is
			-- Turn off highlighting during dropping.
		do
			gtk_toolbar_set_drop_highlight_item (handle, default_pointer, 0)
		end

	set_show_arrow (a_setting: BOOLEAN) is
			-- Sets whether to show an overflow menu when toolbar doesn't
			-- have room for all items on it. If TRUE, items that there
			-- are not room are available through an overflow menu.
		do
			gtk_toolbar_set_show_arrow (handle, a_setting.to_integer)
		end

	set_orientation (an_orientation: INTEGER) is
			-- Sets whether a toolbar should appear horizontally or
			-- vertically.
		require valid_orientation: is_valid_gtk_orientation (an_orientation)
		do
			gtk_toolbar_set_orientation (handle, an_orientation)
		end

	set_tooltips (a_setting: BOOLEAN) is
			-- Sets if the tooltips of a toolbar should be active or
			-- not. Set `a_setting' to False to disable the tooltips, or
			-- True to enable them.
		do
			gtk_toolbar_set_tooltips(handle, a_setting.to_integer)
		end

	does_show_arrow: BOOLEAN is
			-- Does the toolbar have an overflow menu?
		do
			Result:=(gtk_toolbar_get_show_arrow(handle).to_boolean)
		end

	orientation: INTEGER is
			-- the current orientation of the toolbar.
		do
			Result := gtk_toolbar_get_orientation (handle)
		ensure is_valid_orientation: is_valid_gtk_orientation(orientation)
		end

	style: INTEGER is
			-- the current style of toolbar
		do
			Result:=gtk_toolbar_get_style(handle)
		ensure is_valid_toolbar_style: is_valid_gtk_toolbar_style(Result)
		end

	icon_size: INTEGER is
			-- the current icon size for the icons on the toolbar.
		do
			Result := gtk_toolbar_get_icon_size (handle)
		ensure is_valid_icon_size: is_valid_gtk_icon_size (Result)
		end

	are_tooltips_enabled: BOOLEAN is
			-- Are tooltips enabled?
		do
			Result := (gtk_toolbar_get_tooltips(handle).to_boolean)
		end

	relief_style: INTEGER is
			-- The relief style of buttons on toolbar.
		do
			Result := gtk_toolbar_get_relief_style (handle)
		ensure is_valid_relief_style: is_valid_gtk_relief_style (Result)
		end

	set_style (a_style: INTEGER) is
			-- Alters the view of toolbar to display either icons only,
			-- text only, or both.
		require is_valid_relief_style: is_valid_gtk_relief_style (a_style)
		do
			gtk_toolbar_set_style (handle, a_style)
		ensure set: relief_style = a_style
		end

	unset_style is
			-- Unsets a toolbar style set with `set_style', so that user
			-- preferences will be used to determine the toolbar style.
		do
			gtk_toolbar_unset_style (handle)
		end

feature {ANY} -- Properties

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

feature {ANY} -- Signals

	-- "focus-home-or-end" gboolean user_function (GtkToolbar *toolbar,
	-- gboolean focus_home, gpointer user_data) : Run last / Action
	
	-- "move-focus" gboolean user_function (GtkToolbar *toolbar,
	-- GtkDirectionType dir, gpointer user_data) : Run last / Action
	
	-- "orientation-changed" void user_function (GtkToolbar *toolbar,
	-- GtkOrientation orientation, gpointer user_data) : Run first
	
	-- "popup-context-menu" gboolean user_function (GtkToolbar
	-- *toolbar, gint x, gint y, gint button, gpointer user_data) : Run
	-- last
	
	-- "style-changed" void user_function (GtkToolbar *toolbar,
	-- GtkToolbarStyle style, gpointer user_data) : Run first

	-- Signal Details

	--   The "focus-home-or-end" signal

	--  gboolean user_function (GtkToolbar *toolbar, gboolean
	--  focus_home, gpointer user_data) : Run last / Action

	-- A keybinding signal used internally by GTK+. This signal can't
	-- be used in application code

	--    toolbar :    the GtkToolbar which emitted the signal
	--    focus_home : TRUE if the first item should be focused
	--    user_data :  user data set when the signal handler was connected.
	--    Returns :    TRUE if the signal was handled, FALSE if not

	--   The "move-focus" signal

	--  gboolean user_function (GtkToolbar *toolbar, GtkDirectionType
	--  dir, gpointer user_data) : Run last / Action

	--    A keybinding signal used internally by GTK+. This signal can't be used in
	--    application code.

	--    toolbar :   the GtkToolbar which emitted the signal
	--    dir :       a GtkDirection
	--    user_data : user data set when the signal handler was connected.
	--    Returns :   TRUE if the signal was handled, FALSE if not

	--   The "orientation-changed" signal

	--  void user_function (GtkToolbar *toolbar, GtkOrientation
	--  orientation, gpointer user_data) : Run first

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

feature {ANY} -- size

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkToolbar)"
		end

end -- class GTK_TOOLBAR
