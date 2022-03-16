note
	description: "GtkAction — An action which can be triggered by a menu or toolbar item."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, GTK+ team
					
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
					

class GTK_ACTION
	-- Actions represent operations that the user can be perform, along
	-- with some information how it should be presented in the
	-- interface. Each action provides methods to create icons, menu
	-- items and toolbar items representing itself.
											
	-- As well as the callback that is called when the action gets
	-- activated, the following also gets associated with the action:

	--     *a name (not translated, for path lookup)
	--     *a label (translated, for display)
	--     *an accelerator
	--     *whether label indicates a stock id
	--     *a tooltip (optional, translated)
	--     *a toolbar label (optional, shorter than label)
	
	-- The action will also have some state information:
	
	--     *visible (shown/hidden)
	--     *sensitive (enabled/disabled)
	
	-- Apart from regular actions, there are toggle actions, which can
	-- be toggled between two states and radio actions, of which only
	-- one in a group can be in the "active" state. Other actions can
	-- be implemented as GtkAction subclasses.
	
	-- Each action can have one or more proxy menu item, toolbar button
	-- or other proxy widgets. Proxies mirror the state of the action
	-- (text label, tooltip, icon, visible, sensitive, etc), and should
	-- change when the action's state changes. When the proxy is
	-- activated, it should activate its action.

inherit G_OBJECT
	-- rename make as make_object end

insert GTK

create {ANY} make, from_external_pointer

feature {} -- Creation
	make (a_name, a_label, a_tooltip, a_stock_id: STRING)
			-- Creates a new GtkAction object. To add the action to a
			-- GtkActionGroup and set the accelerator for the action,
			-- call `GTK_ACTION_GROUP.add_action_with_accel'. See the
			-- section called “UI Definitions” for information on
			-- allowed action names.

			-- `a_name' A unique name for the action; `a_label' the label
			-- displayed in menu items and on buttons; `a_tooltip' a
			-- tooltip for the action; `a_stock_id' the stock icon to
			-- display in widgets representing the action
		require
			gtk_initialized: gtk.is_initialized
			name_not_void: a_name/=Void
			label_not_void: a_label/=Void
			tooltip_not_void: a_tooltip/=Void
			stockid_not_void: a_stock_id/=Void
		do
			from_external_pointer (gtk_action_new (a_name.to_external, a_label.to_external,
																a_tooltip.to_external, a_stock_id.to_external))
		end

feature {ANY}
	name: STRING
			-- the name of the action.
		do
			create Result.from_external_copy (gtk_action_get_name (handle))
			-- TODO: GTK+ docs says "The string belongs to GTK+ and
			-- should not be freed."  Thefore it is copied. It is not
			-- that efficient thought. it would be better to provide
			-- something like "CONSTANT_STRING"
		ensure not_void: Result/=Void
		end

	
	activate
			-- Emits the "activate" signal on the specified action, if it
			-- isn't insensitive. This gets called by the proxy widgets
			-- when they get activated.  It can also be used to manually
			-- activate an action.
		do
			gtk_action_activate (handle)
		end

	-- TODO: wrap gtk_action_create_icon ()
	
	-- GtkWidget*  gtk_action_create_icon          (GtkAction *action, GtkIconSize icon_size);
	
	-- This function is intended for use by action implementations to
	-- create icons displayed in the proxy widgets.
	
	-- action : 	the action object
	-- icon_size : 	the size of the icon that should be created.
	-- Returns : 	a widget that displays the icon for this action.


	-- gtk_action_create_menu_item ()

	-- GtkWidget*  gtk_action_create_menu_item     (GtkAction *action);
	
	-- Creates a menu item widget that proxies for the given action.

	-- action : 	the action object
	-- Returns : 	a menu item connected to the action.
	
	-- Since 2.4
	-- gtk_action_create_tool_item ()
	
	-- GtkWidget*  gtk_action_create_tool_item     (GtkAction *action);

	-- Creates a toolbar item widget that proxies for the given action.

	-- action : 	the action object
	-- Returns : 	a toolbar item connected to the action.

	-- Since 2.4
	-- gtk_action_connect_proxy ()

	-- void        gtk_action_connect_proxy        (GtkAction *action, GtkWidget *proxy);

	-- Connects a widget to an action object as a proxy. Synchronises various properties of the action with the widget (such as label text, icon, tooltip, etc), and attaches a callback so that the action gets activated when the proxy widget does.

	-- If the widget is already connected to an action, it is disconnected first.

	-- action : 	the action object
	-- proxy : 	the proxy widget

	-- Since 2.4
	-- gtk_action_disconnect_proxy ()

	-- void        gtk_action_disconnect_proxy     (GtkAction *action, GtkWidget *proxy);

	-- Disconnects a proxy widget from an action. Does not destroy the widget, however.

	-- action : 	the action object
	-- proxy : 	the proxy widget

	-- Since 2.4
	-- gtk_action_get_proxies ()

	-- GSList*     gtk_action_get_proxies          (GtkAction *action);

	-- Returns the proxy widgets for an action.

	-- action : 	the action object
	-- Returns : 	a GSList of proxy widgets. The list is owned by the action and must not be modified.

	-- Since 2.4
	-- gtk_action_connect_accelerator ()

	-- void        gtk_action_connect_accelerator  (GtkAction *action);

	-- Installs the accelerator for action if action has an accel path and group. See gtk_action_set_accel_path() and gtk_action_set_accel_group()

	-- Since multiple proxies may independently trigger the installation of the accelerator, the action counts the number of times this function has been called and doesn't remove the accelerator until gtk_action_disconnect_accelerator() has been called as many times.

	-- action : 	a GtkAction

	-- Since 2.4
	-- gtk_action_disconnect_accelerator ()

	-- void        gtk_action_disconnect_accelerator (GtkAction *action);

	-- Undoes the effect of one call to gtk_action_connect_accelerator().

	-- action : 	a GtkAction

	-- Since 2.4
	-- gtk_action_block_activate_from ()

	-- void        gtk_action_block_activate_from  (GtkAction *action, GtkWidget *proxy);

	-- Disables calls to the gtk_action_activate() function by signals on the given proxy widget. This is used to break notification loops for things like check or radio actions.

	-- This function is intended for use by action implementations.

	-- action : 	the action object
	-- proxy : 	a proxy widget

	-- Since 2.4
	-- gtk_action_unblock_activate_from ()

	-- void        gtk_action_unblock_activate_from (GtkAction *action, GtkWidget *proxy);

	-- Re-enables calls to the gtk_action_activate() function by signals on the given proxy widget. This undoes the blocking done by gtk_action_block_activate_from().

	-- This function is intended for use by action implementations.

	-- action : 	the action object
	-- proxy : 	a proxy widget

	-- Since 2.4
	-- gtk_action_get_accel_path ()

	-- const gchar* gtk_action_get_accel_path      (GtkAction *action);

	-- Returns the accel path for this action.

	-- action : 	the action object
	-- Returns : 	the accel path for this action, or NULL if none is set. The returned string is owned by GTK+ and must not be freed or modified.

	-- Since 2.6
	-- gtk_action_set_accel_path ()

	-- void        gtk_action_set_accel_path       (GtkAction *action, const gchar *accel_path);

	-- Sets the accel path for this action. All proxy widgets associated with the action will have this accel path, so that their accelerators are consistent.

	-- action : 	the action object
	-- accel_path : 	the accelerator path

	-- Since 2.4
	-- gtk_action_get_accel_closure ()

	-- GClosure*   gtk_action_get_accel_closure    (GtkAction *action);

	-- Returns the accel closure for this action.

	-- action : 	the action object
	-- Returns : 	the accel closure for this action. The returned closure is owned by GTK+ and must not be unreffed or modified.

	-- Since 2.8
	-- gtk_action_set_accel_group ()

	-- void        gtk_action_set_accel_group      (GtkAction *action, GtkAccelGroup *accel_group);

	-- Sets the GtkAccelGroup in which the accelerator for this action will be installed.

	-- action : 	the action object
	-- accel_group : 	a GtkAccelGroup or NULL

	-- Since 2.4

feature {ANY} -- Sensitivity
	is_sensitive: BOOLEAN
			-- Is the action is effectively sensitive? TRUE if the action
			-- and its associated action group are both sensitive.
		do
			Result := gtk_action_is_sensitive (handle).to_boolean
		end

	is_potentially_sensitive: BOOLEAN
			-- Returns whether the action itself is sensitive. Note that
			-- this doesn't necessarily mean effective sensitivity. See
			-- `is_sensitive' for that.
		do
			Result := gtk_action_get_sensitive (handle).to_boolean
		end

	set_potentially_sensitive
			-- Sets the ::sensitive property of the action to
			-- sensitive. Note that this doesn't necessarily mean
			-- effective sensitivity. See `is_sensitive' for that.
		do
			gtk_action_set_sensitive (handle,1)
		ensure potentially_sensitive: is_potentially_sensitive
		end

	set_potentially_insensitive
			-- Sets the ::sensitive property of the action to
			-- insensitive. Note that this doesn't necessarily mean
			-- effective sensitivity. See `is_sensitive' for that.
		do
			gtk_action_set_sensitive (handle,0)
		ensure potentially_insensitive: not is_potentially_sensitive
		end
	
feature {ANY} -- Visibility
	is_visible: BOOLEAN
			-- Is the action effectively visible? True if the action and
			-- its associated action group are both visible.
		do
			Result:=gtk_action_is_visible(handle).to_boolean
		end

	is_potentially_visible: BOOLEAN
			-- Is the action itself visible? True if the action itself is
			-- visible. Note that this doesn't necessarily mean effective
			-- visibility. See `is_sensitive' for that.
		do
			Result := gtk_action_get_visible (handle).to_boolean
		end

	set_potentially_visible
			-- Sets the ::visible property of the action to visible. Note
			-- that this doesn't necessarily mean effective
			-- visibility. See `is_visible' for that.
		do
			gtk_action_set_visible(handle,1)
		ensure potentially_visible: is_potentially_visible
		end

	set_potentially_invisible
			-- Sets the ::visible property of the action to invisible. Note
			-- that this doesn't necessarily mean effective
			-- visibility. See `is_visible' for that.
		do
			gtk_action_set_visible(handle,0)
		ensure potentially_invisible: not is_potentially_visible
		end
feature {ANY} -- Properties

--   "action-group"         GtkActionGroup        : Read / Write
--   "hide-if-empty"        gboolean              : Read / Write
--   "is-important"         gboolean              : Read / Write
--   "label"                gchararray            : Read / Write
--   "name"                 gchararray            : Read / Write / Construct Only
--   "sensitive"            gboolean              : Read / Write
--   "short-label"          gchararray            : Read / Write
--   "stock-id"             gchararray            : Read / Write
--   "tooltip"              gchararray            : Read / Write
--   "visible"              gboolean              : Read / Write
--   "visible-horizontal"   gboolean              : Read / Write
--   "visible-overflown"    gboolean              : Read / Write
--   "visible-vertical"     gboolean              : Read / Write

-- Signals

-- "activate"  void        user_function      (GtkAction *action, gpointer   user_data)      : Run first / No recursion

-- Property Details
-- The "action-group" property

--   "action-group"         GtkActionGroup        : Read / Write

-- The GtkActionGroup this GtkAction is associated with, or NULL (for internal use).
-- The "hide-if-empty" property

--   "hide-if-empty"        gboolean              : Read / Write

-- When TRUE, empty menu proxies for this action are hidden.

-- Default value: TRUE
-- The "is-important" property

--   "is-important"         gboolean              : Read / Write

-- Whether the action is considered important. When TRUE, toolitem proxies for this action show text in GTK_TOOLBAR_BOTH_HORIZ mode.

-- Default value: FALSE
-- The "label" property

--   "label"                gchararray            : Read / Write

-- The label used for menu items and buttons that activate this action.

-- Default value: NULL
-- The "name" property

--   "name"                 gchararray            : Read / Write / Construct Only

-- A unique name for the action.

-- Default value: NULL
-- The "sensitive" property

--   "sensitive"            gboolean              : Read / Write

-- Whether the action is enabled.

-- Default value: TRUE
-- The "short-label" property

--   "short-label"          gchararray            : Read / Write

-- A shorter label that may be used on toolbar buttons.

-- Default value: NULL
-- The "stock-id" property

--   "stock-id"             gchararray            : Read / Write

-- The stock icon displayed in widgets representing this action.

-- Default value: NULL
-- The "tooltip" property

--   "tooltip"              gchararray            : Read / Write

-- A tooltip for this action.

-- Default value: NULL
-- The "visible" property

--   "visible"              gboolean              : Read / Write

-- Whether the action is visible.

-- Default value: TRUE
-- The "visible-horizontal" property

--   "visible-horizontal"   gboolean              : Read / Write

-- Whether the toolbar item is visible when the toolbar is in a horizontal orientation.

-- Default value: TRUE
-- The "visible-overflown" property

--   "visible-overflown"    gboolean              : Read / Write

-- When TRUE, toolitem proxies for this action are represented in the toolbar overflow menu.

-- Default value: TRUE

-- Since 2.6
-- The "visible-vertical" property

--   "visible-vertical"     gboolean              : Read / Write

-- Whether the toolbar item is visible when the toolbar is in a vertical orientation.

-- Default value: TRUE
-- Signal Details
-- The "activate" signal

-- void        user_function                  (GtkAction *action, gpointer   user_data)      : Run first / No recursion

-- The "activate" signal is emitted when the action is activated.

-- action : 	the GtkAction
-- user_data : 	user data set when the signal handler was connected.

-- Since 2.4
-- See Also

-- GtkActionGroup, GtkUIManager

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkAction)"
		end

feature {} -- External calls
	gtk_action_new (name_str, label_str, tooltip_str, stock_id_str: POINTER): POINTER is -- GtkAction*
		external "C use <gtk/gth.h>"
		end
 
	gtk_action_get_name (action: POINTER): POINTER is -- const gchar*
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_is_sensitive (action: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_get_sensitive (action: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_set_sensitive (action: POINTER; sensitive_bool: INTEGER) is -- void
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_is_visible (action: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_get_visible (action: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_set_visible (action: POINTER; visible_bool: INTEGER)
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_activate (action: POINTER)
		external "C use <gtk/gth.h>"
		end
 
	gtk_action_create_icon (action: POINTER; gtk_icon_size: INTEGER): POINTER is -- GtkWidget*
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_create_menu_item (action: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_create_tool_item (action: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gth.h>"
		end
 
	gtk_action_connect_proxy (action, gtk_widget_proxy: POINTER)
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_disconnect_proxy (action, gtk_widget_proxy: POINTER)
		external "C use <gtk/gth.h>"
		end
 
	gtk_action_get_proxies (action: POINTER): POINTER is -- GSList*
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_connect_accelerator (action: POINTER)
		external "C use <gtk/gth.h>"
		end
 
	gtk_action_disconnect_accelerator (action: POINTER)
		external "C use <gtk/gth.h>"
		end
 
	gtk_action_block_activate_from (action, gtk_widget_proxy: POINTER)
		external "C use <gtk/gth.h>"
		end
 
	gtk_action_unblock_activate_from (action, gtk_widget_proxy: POINTER)
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_get_accel_path (action: POINTER): POINTER is -- const gchar*
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_set_accel_path (action, accel_path_str: POINTER)
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_get_accel_closure (action: POINTER): POINTER is -- GClosure*
		external "C use <gtk/gth.h>"
		end
	
	gtk_action_set_accel_group (action, accel_group: POINTER)
		external "C use <gtk/gth.h>"
		end
end -- class GTK_ACTION
