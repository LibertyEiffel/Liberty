note
	description: "GtkContainer -- Base class for widgets which contain other widgets"
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
			-- TODO: add long description from GTK docs
							 
deferred class GTK_CONTAINER

inherit GTK_WIDGET
	-- Implemented Interfaces: GtkContainer implements
	-- AtkImplementorIface.

insert GTK_CONTAINER_EXTERNALS

feature {ANY}
	add (a_widget: GTK_WIDGET) is
			-- Adds widget to container. Typically used for simple
			-- containers such as GtkWindow, GtkFrame, or GtkButton; for
			-- more complicated layout containers such as GtkBox or
			-- GtkTable, this function will pick default packing
			-- parameters that may not be correct. So consider functions
			-- such as gtk_box_pack_start() and gtk_table_attach() as an
			-- alternative to gtk_container_add() in those cases. A
			-- widget may be added to only one container at a time; you
			-- can't place the same widget inside two different
			-- containers.
		require valid_widget: a_widget /= Void
		do
			gtk_container_add (handle, a_widget.handle)
		end

	remove (a_widget: GTK_WIDGET) is
			-- Removes widget from container. widget must be inside
			-- container. Note that container will own a reference to
			-- widget, and that this may be the last reference held; so
			-- removing a widget from its container can destroy that
			-- widget. If you want to use widget again, you need to add a
			-- reference to it while it's not inside a container, using
			-- g_object_ref(). If you don't want to use widget again it's
			-- usually more efficient to simply destroy it directly using
			-- gtk_widget_destroy() since this will remove it from the
			-- container and help break any circular reference count
			-- cycles.
		require
			valid_widget: a_widget /= Void
			widget_contained: True -- TODO: has (a_widget)
		do
			gtk_container_remove (handle, a_widget.handle)
		end


	-- TODO: (since it's variadic) gtk_container_add_with_properties ()

	-- void gtk_container_add_with_properties (GtkContainer *container,
	-- GtkWidget *widget, const gchar *first_prop_name, ...);

	-- Adds widget to container, setting child properties at the same
	-- time. See gtk_container_add() and gtk_container_child_set() for
	-- more details.

	-- container : 	a GtkContainer
	-- widget : 	a widget to be placed inside container
	-- first_prop_name : 	the name of the first child property to set
	-- ... : 	a NULL-terminated list of property names and values, starting with first_prop_name.

	resize_mode: INTEGER is
			-- the resize mode for the container. See set_resize_mode.
		do
			Result:= gtk_container_get_resize_mode (handle)
		end

	is_resize_parent: BOOLEAN is
			--  Is resize request passed to the parent?
		do
			Result := (resize_mode = gtk_resize_parent)
		end

	is_resize_queue: BOOLEAN is
			-- Is resizes on this widget queued?
		do
			Result := (resize_mode = gtk_resize_queue)
		end

	set_resize_mode (a_mode: INTEGER) is
			-- Sets the resize mode for the container.  The resize mode
			-- of a container determines whether a resize request will be
			-- passed to the container's parent or queued for later
			-- execution.
		require valid_mode: is_valid_gtk_resize_mode (a_mode)
		do
			gtk_container_set_resize_mode (handle, a_mode)
		end

	check_resize is
			-- TODO: undocumented in GTK+ documentation
		do
			gtk_container_check_resize (handle)
		end

	set_border_width (a_width: INTEGER) is
		require
			a_width.in_range(0, 65535)
		do
			gtk_container_set_border_width (handle, a_width)
		ensure
			border_width = a_width
		end

	border_width: INTEGER is
		do
			Result := gtk_container_get_border_width (handle)
		end

	
	-- TODO: wrap gtk_container_foreach ()

	-- void gtk_container_foreach (GtkContainer *container, GtkCallback
	-- callback, gpointer callback_data);

	-- Invokes callback on each non-internal child of container. See
	-- gtk_container_forall() for details on what constitutes an
	-- "internal" child. Most applications should use
	-- gtk_container_foreach(), rather than gtk_container_forall().

	-- container : 	a GtkContainer
	-- callback : 	a callback
	-- callback_data : 	callback user data


	children: G_LIST [GTK_WIDGET] is
				 -- container's non-internal children. See `forall' for
				 -- details on what constitutes an "internal" child.
		local ptr: POINTER
		do
			ptr:=gtk_container_get_children(handle)
			create {G_OBJECT_LIST[GTK_WIDGET]} Result.from_external_pointer (ptr)
		ensure result_not_void: Result/=Void
		end

	set_reallocate_redraws is
			-- Sets the reallocate_redraws flag of the container to the
			-- given value.  Containers requesting reallocation redraws
			-- get automatically redrawn if any of their children changed
			-- allocation.
		do
			gtk_container_set_reallocate_redraws (handle,1)
		end

	unset_reallocate_redraws is
			-- Opposite of `set_reallocate_redraws'
		do
			gtk_container_set_reallocate_redraws (handle,0)
		end

	set_focus_child (a_child: GTK_WIDGET) is
		do
			gtk_container_set_focus_child (handle,a_child.handle)
		end

	
-- gtk_container_get_focus_vadjustment ()

-- GtkAdjustment* gtk_container_get_focus_vadjustment
--                                             (GtkContainer *container);

-- Retrieves the vertical focus adjustment for the container. See gtk_container_set_focus_vadjustment().

-- container : 	a GtkContainer
-- Returns : 	the vertical focus adjustment, or NULL if none has been set.
-- gtk_container_set_focus_vadjustment ()

-- void        gtk_container_set_focus_vadjustment
--                                             (GtkContainer *container,
--                                              GtkAdjustment *adjustment);

-- Hooks up an adjustment to focus handling in a container, so when a child of the container is focused, the adjustment is scrolled to show that widget. This function sets the vertical alignment. See gtk_scrolled_window_get_vadjustment() for a typical way of obtaining the adjustment and gtk_container_set_focus_hadjustment() for setting the horizontal adjustment.

-- The adjustments have to be in pixel units and in the same coordinate system as the allocation for immediate children of the container.

-- container : 	a GtkContainer
-- adjustment : 	an adjustment which should be adjusted when the focus is moved among the descendents of container
-- gtk_container_get_focus_hadjustment ()

-- GtkAdjustment* gtk_container_get_focus_hadjustment
--                                             (GtkContainer *container);

-- Retrieves the horizontal focus adjustment for the container. See gtk_container_set_focus_hadjustment().

-- container : 	a GtkContainer
-- Returns : 	the horizontal focus adjustment, or NULL if none has been set.
-- gtk_container_set_focus_hadjustment ()

-- void        gtk_container_set_focus_hadjustment
--                                             (GtkContainer *container,
--                                              GtkAdjustment *adjustment);

-- Hooks up an adjustment to focus handling in a container, so when a child of the container is focused, the adjustment is scrolled to show that widget. This function sets the horizontal alignment. See gtk_scrolled_window_get_hadjustment() for a typical way of obtaining the adjustment and gtk_container_set_focus_vadjustment() for setting the vertical adjustment.

-- The adjustments have to be in pixel units and in the same coordinate system as the allocation for immediate children of the container.

-- container : 	a GtkContainer
-- adjustment : 	an adjustment which should be adjusted when the focus is moved among the descendents of container
-- gtk_container_resize_children ()

-- void        gtk_container_resize_children   (GtkContainer *container);

-- container : 	
-- gtk_container_child_type ()

-- GType       gtk_container_child_type        (GtkContainer *container);

-- Returns the type of the children supported by the container.

-- Note that this may return G_TYPE_NONE to indicate that no more children can be added, e.g. for a GtkPaned which already has two children.

-- container : 	a GtkContainer.
	-- Returns : 	a GType.


	-- Made external calls till here, the rest is TODO: Paolo 2005-12-31


	
-- gtk_container_child_get ()

-- void        gtk_container_child_get         (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *first_prop_name,
--                                              ...);

-- Gets the values of one or more child properties for child and container.

-- container : 	a GtkContainer
-- child : 	a widget which is a child of container
-- first_prop_name : 	the name of the first property to get
-- ... : 	a NULL-terminated list of property names and GValue*, starting with first_prop_name.
-- gtk_container_child_set ()

-- void        gtk_container_child_set         (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *first_prop_name,
--                                              ...);

-- Sets one or more child properties for child and container.

-- container : 	a GtkContainer
-- child : 	a widget which is a child of container
-- first_prop_name : 	the name of the first property to set
-- ... : 	a NULL-terminated list of property names and values, starting with first_prop_name.
-- gtk_container_child_get_property ()

-- void        gtk_container_child_get_property
--                                             (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *property_name,
--                                              GValue *value);

-- Gets the value of a child property for child and container.

-- container : 	a GtkContainer
-- child : 	a widget which is a child of container
-- property_name : 	the name of the property to get
-- value : 	a location to return the value
-- gtk_container_child_set_property ()

-- void        gtk_container_child_set_property
--                                             (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *property_name,
--                                              const GValue *value);

-- Sets a child property for child and container.

-- container : 	a GtkContainer
-- child : 	a widget which is a child of container
-- property_name : 	the name of the property to set
-- value : 	the value to set the property to
-- gtk_container_child_get_valist ()

-- void        gtk_container_child_get_valist  (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *first_property_name,
--                                              va_list var_args);

-- Gets the values of one or more child properties for child and container.

-- container : 	a GtkContainer
-- child : 	a widget which is a child of container
-- first_property_name : 	the name of the first property to get
-- var_args : 	a NULL-terminated list of property names and GValue*, starting with first_prop_name.
-- gtk_container_child_set_valist ()

-- void        gtk_container_child_set_valist  (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *first_property_name,
--                                              va_list var_args);

-- Sets one or more child properties for child and container.

-- container : 	a GtkContainer
-- child : 	a widget which is a child of container
-- first_property_name : 	the name of the first property to set
-- var_args : 	a NULL-terminated list of property names and values, starting with first_prop_name.
-- gtk_container_forall ()

-- void        gtk_container_forall            (GtkContainer *container,
--                                              GtkCallback callback,
--                                              gpointer callback_data);

-- Invokes callback on each child of container, including children that are considered "internal" (implementation details of the container). "Internal" children generally weren't added by the user of the container, but were added by the container implementation itself. Most applications should use gtk_container_foreach(), rather than gtk_container_forall().

-- container : 	a GtkContainer
-- callback : 	a callback
-- callback_data : 	callback user data
-- gtk_container_get_border_width ()

-- guint       gtk_container_get_border_width  (GtkContainer *container);

-- Retrieves the border width of the container. See gtk_container_set_border_width().

-- container : 	a GtkContainer
-- Returns : 	the current border width
-- gtk_container_set_border_width ()

-- void        gtk_container_set_border_width  (GtkContainer *container,
--                                              guint border_width);

-- Sets the border width of the container.

-- The border width of a container is the amount of space to leave around the outside of the container. The only exception to this is GtkWindow; because toplevel windows can't leave space outside, they leave the space inside. The border is added on all sides of the container. To add space to only one side, one approach is to create a GtkAlignment widget, call gtk_widget_set_usize() to give it a size, and place it on the side of the container as a spacer.

-- container : 	a GtkContainer
-- border_width : 	amount of blank space to leave outside the container. Valid values are in the range 0-65535 pixels.
-- gtk_container_propagate_expose ()

-- void        gtk_container_propagate_expose  (GtkContainer *container,
--                                              GtkWidget *child,
--                                              GdkEventExpose *event);

-- When a container receives an expose event, it must send synthetic expose events to all children that don't have their own GdkWindows. This function provides a convenient way of doing this. A container, when it receives an expose event, calls gtk_container_propagate_expose() once for each child, passing in the event the container received.

-- gtk_container_propagate_expose() takes care of deciding whether an expose event needs to be sent to the child, intersecting the event's area with the child area, and sending the event.

-- In most cases, a container can simply either simply inherit the ::expose implementation from GtkContainer, or, do some drawing and then chain to the ::expose implementation from GtkContainer.

-- container : 	a GtkContainer
-- child : 	a child of container
-- event : 	a expose event sent to container
-- gtk_container_get_focus_chain ()

-- gboolean    gtk_container_get_focus_chain   (GtkContainer *container,
--                                              GList **focusable_widgets);

-- Retrieves the focus chain of the container, if one has been set explicitly. If no focus chain has been explicitly set, GTK+ computes the focus chain based on the positions of the children. In that case, GTK+ stores NULL in focusable_widgets and returns FALSE.

-- container : 	a GtkContainer
-- focusable_widgets : 	location to store the focus chain of the container, or NULL. You should free this list using g_list_free() when you are done with it, however no additional reference count is added to the individual widgets in the focus chain.
-- Returns : 	TRUE if the focus chain of the container has been set explicitly.
-- gtk_container_set_focus_chain ()

-- void        gtk_container_set_focus_chain   (GtkContainer *container,
--                                              GList *focusable_widgets);

-- Sets a focus chain, overriding the one computed automatically by GTK+.

-- In principle each widget in the chain should be a descendant of the container, but this is not enforced by this method, since it's allowed to set the focus chain before you pack the widgets, or have a widget in the chain that isn't always packed. The necessary checks are done when the focus chain is actually traversed.

-- container : 	a GtkContainer.
-- focusable_widgets : 	the new focus chain.
-- gtk_container_unset_focus_chain ()

-- void        gtk_container_unset_focus_chain (GtkContainer *container);

-- Removes a focus chain explicitly set with gtk_container_set_focus_chain().

-- container : 	a GtkContainer.
-- gtk_container_class_find_child_property ()

-- GParamSpec* gtk_container_class_find_child_property
--                                             (GObjectClass *cclass,
--                                              const gchar *property_name);

-- Finds a child property of a container class by name.

-- cclass : 	a GtkContainerClass
-- property_name : 	the name of the child property to find
-- Returns : 	the GParamSpec of the child property or NULL if class has no child property with that name.
-- gtk_container_class_install_child_property ()

-- void        gtk_container_class_install_child_property
--                                             (GtkContainerClass *cclass,
--                                              guint property_id,
--                                              GParamSpec *pspec);

-- Installs a child property on a container class.

-- cclass : 	a GtkContainerClass
-- property_id : 	the id for the property
-- pspec : 	the GParamSpec for the property
-- gtk_container_class_list_child_properties ()

-- GParamSpec** gtk_container_class_list_child_properties
--                                             (GObjectClass *cclass,
--                                              guint *n_properties);

-- Returns all child properties of a container class.

-- cclass : 	a GtkContainerClass
-- n_properties : 	location to return the number of child properties found
-- Returns : 	a newly allocated array of GParamSpec*. The array must be freed with g_free().
-- Property Details
-- The "border-width" property

--   "border-width"         guint                 : Read / Write

-- The width of the empty border outside the containers children.

-- Allowed values: <= G_MAXINT

-- Default value: 0
-- The "child" property

--   "child"                GtkWidget             : Write

-- Can be used to add a new child to the container.
-- The "resize-mode" property

--   "resize-mode"          GtkResizeMode         : Read / Write

-- Specify how resize events are handled.

-- Default value: GTK_RESIZE_PARENT
-- Signal Details
-- The "add" signal

-- void        user_function                  (GtkContainer *container,
--                                             GtkWidget    *widget,
--                                             gpointer      user_data)      : Run first

-- container : 	the object which received the signal.
-- widget : 	
-- user_data : 	user data set when the signal handler was connected.
-- The "check-resize" signal

-- void        user_function                  (GtkContainer *container,
--                                             gpointer      user_data)      : Run last

-- container : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- The "remove" signal

-- void        user_function                  (GtkContainer *container,
--                                             GtkWidget    *widget,
--                                             gpointer      user_data)      : Run first

-- container : 	the object which received the signal.
-- widget : 	
-- user_data : 	user data set when the signal handler was connected.
-- The "set-focus-child" signal

-- void        user_function                  (GtkContainer *container,
--                                             GtkWidget    *widget,
--                                             gpointer      user_data)      : Run first

-- container : 	the object which received the signal.
-- widget : 	
-- user_data : 	user data set when the signal handler was connected.

end
	
