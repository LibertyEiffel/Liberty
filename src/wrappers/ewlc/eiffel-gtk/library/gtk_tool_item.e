note
	description: "GtkToolItem: the base class of widgets that can be added to GtkToolbar."
	copyright: "[
					Copyright (C) 2006 Daniel F Moisset , GTK+ team
					
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

class GTK_TOOL_ITEM
	-- GtkToolItems are widgets that can appear on a toolbar. To create
	-- a toolbar item that contain something else than a button, use
	-- `make'. Use `add' to add a child widget to the tool item
	-- (GTK_TOOL_ITEM is a GTK_CONTAINER).

	--For toolbar items that contain buttons, see the GtkToolButton,
	--GtkToggleToolButton and GtkRadioToolButton classes.  See the
	--GtkToolbar class for a description of the toolbar widget.

inherit
	GTK_BIN
	--GtkToolItem implements AtkImplementorIface.

create {ANY} make, from_external_pointer

feature {} -- Creation

	make
			-- Creates a new GtkToolItem
		do
			from_external_pointer (gtk_tool_item_new)
		end

feature {ANY}

	set_homogeneous (a_setting: BOOLEAN)
			--Sets whether tool_item is to be allocated the same size as
			--other homogeneous items. The effect is that all homogeneous
			--items will have the same width as the widest of the items.
		do
			gtk_tool_item_set_homogeneous (handle, a_setting.to_integer)
		ensure set: a_setting = is_homogeneous
		end

	is_homogeneous: BOOLEAN
			-- Is  tool item the same size as other homogeneous items?
		do
			Result:=gtk_tool_item_get_homogeneous (handle).to_boolean
		end

	set_expand (a_setting: BOOLEAN)
			--Sets whether tool item is allocated extra space when there
			--is more room on the toolbar then needed for the items. The
			--effect is that the item gets bigger when the toolbar gets
			--bigger and smaller when the toolbar gets smaller.
		do
			gtk_tool_item_set_expand(handle, a_setting.to_integer)
		ensure set: a_setting = is_expanded
		end

	is_expanded: BOOLEAN
			-- Is tool item allocated extra space? See `set_expand'.
		do
			Result:= gtk_tool_item_get_expand(handle).to_boolean
		end

	set_tooltip (a_tooltips: GTK_TOOLTIPS; a_tip_text, a_tip_private: STRING)
			--Sets the GtkTooltips object to be used for tool item, the
			--text to be displayed as tooltip on the item and the private
			--text to be used. See GTK_TOOLTIPS's `set_tip'.
			
			-- `a_tooltips': The GtkTooltips object to be used
		
			-- `a_tip_text': text to be used as tooltip text for
			-- tool_item
		
			-- `a_tip_private': text to be used as private tooltip text
		require
			tooltips_not_void: a_tooltips /= Void
			tip_text_not_void: a_tip_text /= Void
			tip_private_not_void: a_tip_private /= Void
		do
			gtk_tool_item_set_tooltip(handle, a_tooltips.handle, a_tip_text.to_external, a_tip_private.to_external)
		end

	set_use_drag_window (a_setting: BOOLEAN)
			-- Sets whether toolitem has a drag window. When `a_setting'
			-- is True the tool item can be used as a drag source through
			-- GTK_DRAG_SOURCE's `set' (TODO). When toolitem has a drag window it
			-- will intercept all events, even those that would otherwise
			-- be sent to a child of toolitem.
		do
			gtk_tool_item_set_use_drag_window(handle,a_setting.to_integer)
		end

	has_drag_window: BOOLEAN
		-- Does tool item use a drag window?
		do
			Result:=gtk_tool_item_get_use_drag_window(handle).to_boolean
		end

	set_visible_horizontal (a_setting: BOOLEAN)
			-- Sets whether toolitem is visible when the toolbar is
			-- docked horizontally.
		do
			gtk_tool_item_set_visible_horizontal (handle, a_setting.to_integer)
		end--

	is_visible_horizontal: BOOLEAN
			-- Is the toolitem visible on toolbars that are docked
			-- horizontally?
		do
			Result:=gtk_tool_item_get_visible_horizontal(handle).to_boolean
		end

	set_visible_vertical (a_setting: BOOLEAN)
			-- Sets whether toolitem is visible when the toolbar is
			-- docked vertically. Some tool items, such as text entries,
			-- are too wide to be useful on a vertically docked
			-- toolbar. If `a_setting' is False tool item will not appear
			-- on toolbars that are docked vertically.
		do
			gtk_tool_item_set_visible_vertical(handle, a_setting.to_integer)
		end

	is_visible_vertical: BOOLEAN
			-- Is tool item visible when the toolbar is docked 
			-- vertically? See `set_visible_vertical'.
		do
			Result:=gtk_tool_item_get_visible_vertical(handle).to_boolean
		end

	set_is_important (a_setting: BOOLEAN)
			-- Sets whether tool item should be considered important. The
			-- GtkToolButton class uses this property to determine
			-- whether to show or hide its label when the toolbar style
			-- is GTK_TOOLBAR_BOTH_HORIZ. The result is that only tool
			-- buttons with the "is_important" property set have labels,
			-- an effect known as "priority text"
		do
			gtk_tool_item_set_is_important  (handle, a_setting.to_integer)
		end

	is_important: BOOLEAN
			-- Is tool item considered important? See `set_is_important'.
		do
			Result:=gtk_tool_item_get_is_important (handle).to_boolean
		end


	icon_size: INTEGER
			-- the icon size used for tool item. Custom subclasses of
			-- GtkToolItem should call this function to find out what
			-- size icons they should use.
		do
			Result:=gtk_tool_item_get_icon_size(handle)
		ensure valid: is_valid_gtk_icon_size (Result)
		end

	orientation: INTEGER
			-- the orientation used for tool item. Custom subclasses of
			-- GtkToolItem should call this function to find out what
			-- size icons they should use.
		do
			Result:=gtk_tool_item_get_orientation(handle)
		ensure valid: is_valid_gtk_orientation(Result)
		end

	toolbar_style: INTEGER
			-- the toolbar style used for tool_item. Custom subclasses of
			-- GtkToolItem should call this function in the handler of
			-- the GtkToolItem::toolbar_reconfigured signal to find out
			-- in what style the toolbar is displayed and change
			-- themselves accordingly
		
			-- Possibilities are:

			-- * gtk_toolbar_both, meaning the tool item should show both an icon and a label, stacked vertically
			-- * gtk_toolbar_icons, meaning the toolbar shows only icons
			-- * gtk_toolbar_text, meaning the tool item should only show text
			--  gtk_toolbar_both_horiz, meaning the tool item should show both an icon and a label, arranged horizontally (however, note the GtkToolButton::has_text_horizontally that makes tool buttons not show labels when the toolbar style is GTK_TOOLBAR_BOTH_HORIZ.
		do
			Result:=gtk_tool_item_get_toolbar_style(handle)
		ensure valid: is_valid_gtk_toolbar_style(Result)
		end

	relief_style: INTEGER
			-- the relief style of tool item. See GTK_BUTTON's
			-- `set_relief_style'. Custom subclasses of GtkToolItem
			-- should call this function in the handler of the
			-- GtkToolItem::toolbar_reconfigured signal to find out the
			-- relief style of buttons.
		do
			Result:=gtk_tool_item_get_relief_style(handle)
		ensure valid: is_valid_gtk_relief_style(Result)
		end

	proxy_menu_item: GTK_WIDGET
			-- the GTK_MENU_ITEM that was last set by
			-- `set_proxy_menu_item', ie. the GtkMenuItem that is going
			-- to appear in the overflow menu.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_WIDGET]
		do
			Result := factory.wrapper_or_void (gtk_tool_item_retrieve_proxy_menu_item (handle))
		end

	menu_item_by_id (an_id: STRING): GTK_WIDGET
			-- The GtkMenuItem passed to `set_proxy_menu_item', if `an_id' 
			-- match. 

			-- Custom subclasses of GtkToolItem should use this function
			-- to update their menu item when the GtkToolItem
			-- changes. That the menu_item_ids must match ensures that a
			-- GtkToolItem will not inadvertently change a menu item that
			-- they did not create.

			--`an_id' : 	a string used to identify the menu item
		require id_not_void: an_id /= Void
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_WIDGET]
		do
			Result := factory.wrapper_or_void(gtk_tool_item_get_proxy_menu_item(handle, an_id.to_external))
		end

	set_proxy_menu_item (an_id: STRING; a_menu_item: GTK_WIDGET)
			-- Sets the GtkMenuItem used in the toolbar overflow
			-- menu. `an_id' is used to identify the caller of this
			-- feature and should also be used with `proxy_menu_item'.
		require
			id_not_void: an_id /= Void
			item_not_void: a_menu_item /= Void
		do
			gtk_tool_item_set_proxy_menu_item(handle,an_id.to_external,
														 a_menu_item.handle)
		ensure set: a_menu_item = menu_item_by_id(an_id)
		end

	rebuild_menu
			-- This feature signals to the toolbar that the overflow menu
			-- item for tool_item has changed. If the overflow menu is
			-- visible when this function it called, the menu will be
			-- rebuilt.  The feature must be called when the tool item
			-- changes what it will do in response to the
			-- "create_menu_proxy" signal.
		do
			gtk_tool_item_rebuild_menu (handle)
		end
	
	-- Note: "is-important", "visible-horizontal", "visible-vertical"
	-- properties are not wrapped since there are strongly-typed,
	-- specific feature calls to access and set them.

feature {ANY} -- TODO: Signals
--
--"create-menu-proxy"
--            gboolean    user_function      (GtkToolItem *toolitem,
--                                            gpointer user_data);
--"set-tooltip"
--            gboolean    user_function      (GtkToolItem *toolitem,
--                                            GtkTooltips *tooltips,
--                                            gchar *tip_text,
--                                            gchar *tip_private,
--                                            gpointer user_data);
--"toolbar-reconfigured"
--            void        user_function      (GtkToolItem *toolitem,
--                                            gpointer user_data);
--Signal Details
--The "create-menu-proxy" signal
--
--gboolean    user_function                  (GtkToolItem *toolitem,
--                                            gpointer user_data);
--
--This signal is emitted when the toolbar needs information from tool_item about whether the item should appear in the toolbar overflow menu. In response the tool item should either
--
--    * call gtk_tool_item_set_proxy_menu_item() with a NULL pointer and return TRUE to indicate that the item should not appear in the overflow menu
--    * call gtk_tool_item_set_proxy_menu_item() with a new menu item and return TRUE, or
--    * return FALSE to indicate that the signal was not handled by the item. This means that the item will not appear in the overflow menu unless a later handler installs a menu item.
--
--The toolbar may cache the result of this signal. When the tool item changes how it will respond to this signal it must call gtk_tool_item_rebuild_menu() to invalidate the cache and ensure that the toolbar rebuilds its overflow menu.
--
--toolitem : 	the object the signal was emitted on
--user_data : 	user data set when the signal handler was connected.
--Returns : 	TRUE if the signal was handled, FALSE if not
--The "set-tooltip" signal
--
--gboolean    user_function                  (GtkToolItem *toolitem,
--                                            GtkTooltips *tooltips,
--                                            gchar *tip_text,
--                                            gchar *tip_private,
--                                            gpointer user_data);
--
--This signal is emitted when the toolitem's tooltip changes. Application developers can use gtk_tool_item_set_tooltip() to set the item's tooltip.
--
--toolitem : 	the object the signal was emitted on
--tooltips : 	the GtkTooltips
--tip_text : 	the tooltip text
--tip_private : 	the tooltip private text
--user_data : 	user data set when the signal handler was connected.
--Returns : 	TRUE if the signal was handled, FALSE if not
--The "toolbar-reconfigured" signal
--
--void        user_function                  (GtkToolItem *toolitem,
--                                            gpointer user_data);
--
--This signal is emitted when some property of the toolbar that the item is a child of changes. For custom subclasses of GtkToolItem, the default handler of this signal use the functions
--
--    * gtk_toolbar_get_orientation()
--    * gtk_toolbar_get_style()
--    * gtk_toolbar_get_icon_size()
--    * gtk_toolbar_get_relief_style()
--
--to find out what the toolbar should look like and change themselves accordingly.
--
--toolitem : 	the object the signal was emitted on
--user_data : 	user data set when the signal handler was connected.
--#include <gtk/gtk.h>
--
--
feature {} -- External calls
	
	gtk_tool_item_new: POINTER
			-- GtkToolItem* gtk_tool_item_new              (void)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tool_item_set_homogeneous (a_tool_item: POINTER; homogeneous_bool: INTEGER)
			-- void gtk_tool_item_set_homogeneous (GtkToolItem
			-- *tool_item, gboolean homogeneous)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_get_homogeneous   (a_tool_item: POINTER): INTEGER
			-- gboolean gtk_tool_item_get_homogeneous (GtkToolItem
			-- *tool_item)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_set_expand (a_tool_item: POINTER; expand_bool: INTEGER)
			-- void gtk_tool_item_set_expand (GtkToolItem *tool_item,
			-- gboolean expand)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_get_expand (a_tool_item: POINTER): INTEGER
			-- gboolean gtk_tool_item_get_expand (GtkToolItem *tool_item)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_set_tooltip (a_tool_item, a_tooltips, a_tip_text, a_tip_private: POINTER)
			-- void gtk_tool_item_set_tooltip (GtkToolItem *tool_item,
			-- GtkTooltips *tooltips, const gchar *tip_text, const gchar
			-- *tip_private)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_set_use_drag_window (a_toolitem: POINTER; use_drag_window_bool: INTEGER)
			-- void gtk_tool_item_set_use_drag_window (GtkToolItem
			-- *toolitem, gboolean use_drag_window)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_get_use_drag_window (a_toolitem: POINTER): INTEGER
			-- 	gboolean    gtk_tool_item_get_use_drag_window (GtkToolItem *toolitem)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_set_visible_horizontal (a_tool_item: POINTER; a_visible_horizontal: INTEGER)
			-- void gtk_tool_item_set_visible_horizontal (GtkToolItem
			-- *toolitem, gboolean visible_horizontal)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_get_visible_horizontal (a_tool_item: POINTER): INTEGER
			-- 	gboolean    gtk_tool_item_get_visible_horizontal (GtkToolItem *toolitem)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tool_item_set_visible_vertical (a_tool_item: POINTER; a_visible_vertical: INTEGER)
			-- 	void        gtk_tool_item_set_visible_vertical (GtkToolItem *toolitem, gboolean visible_vertical)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_get_visible_vertical (a_tool_item: POINTER): INTEGER
			-- 	gboolean    gtk_tool_item_get_visible_vertical (GtkToolItem *toolitem)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_tool_item_set_is_important  (a_tool_item: POINTER; is_important_bool: INTEGER)
			-- 	void        gtk_tool_item_set_is_important  (a_tool_item: POINTER, gboolean is_important)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_get_is_important  (a_tool_item: POINTER): INTEGER
			-- 	gboolean    gtk_tool_item_get_is_important  (GtkToolItem *tool_item)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_get_icon_size     (a_tool_item: POINTER): INTEGER
			-- GtkIconSize gtk_tool_item_get_icon_size     (GtkToolItem *tool_item)
		external "C use <gtk/gtk.h>"
		ensure valid_icon_size: is_valid_gtk_icon_size(Result)
		end

	gtk_tool_item_get_orientation (a_tool_item: POINTER): INTEGER
			-- 	GtkOrientation gtk_tool_item_get_orientation (GtkToolItem *tool_item)
		external "C use <gtk/gtk.h>"
		ensure valid_orientation: is_valid_gtk_orientation(Result)
		end

	gtk_tool_item_get_toolbar_style (a_tool_item: POINTER): INTEGER
			-- GtkToolbarStyle gtk_tool_item_get_toolbar_style
			-- (GtkToolItem *tool_item)
		external "C use <gtk/gtk.h>"
		ensure valid_toolbar_style: is_valid_gtk_toolbar_style (Result)
		end

	gtk_tool_item_get_relief_style (a_tool_item: POINTER): INTEGER
			-- 	GtkReliefStyle gtk_tool_item_get_relief_style (GtkToolItem *tool_item)
		external "C use <gtk/gtk.h>"
		ensure valid_relief_style: is_valid_gtk_relief_style(Result)
		end

	gtk_tool_item_retrieve_proxy_menu_item (a_tool_item: POINTER): POINTER
			-- 	GtkWidget* gtk_tool_item_retrieve_proxy_menu_item
			-- 	(GtkToolItem *tool_item)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_get_proxy_menu_item (a_tool_item, a_menu_item_id: POINTER): POINTER
			-- GtkWidget* gtk_tool_item_get_proxy_menu_item (GtkToolItem
			-- *tool_item, const gchar *menu_item_id)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_set_proxy_menu_item (a_tool_item, a_menu_item_id, a_menu_item: POINTER)
			-- void gtk_tool_item_set_proxy_menu_item (GtkToolItem
			-- *tool_item, const gchar *menu_item_id, GtkWidget
			-- *menu_item)
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_item_rebuild_menu (a_tool_item: POINTER)
			-- void gtk_tool_item_rebuild_menu (GtkToolItem *tool_item)
		external "C use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkToolItem)"
		end

end
