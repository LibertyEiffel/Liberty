note
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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
	revision "$REvision:$"


deferred class GTK_CONTAINER_EXTERNALS

inherit
	ANY undefine is_equal, copy end
	GTK_RESIZE_MODE

feature {} -- External calls

-- #include

-- #define     GTK_IS_RESIZE_CONTAINER         (widget)
-- #define     GTK_CONTAINER_WARN_INVALID_CHILD_PROPERTY_ID(object, property_id, pspec)
-- #define     gtk_container_border_width
	gtk_container_add (container,widget: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_container_remove (container,widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	-- TODO: wrap (if useful) this variadic function void
	-- gtk_container_add_with_properties (GtkContainer *container,
	-- GtkWidget *widget, const gchar *first_prop_name, ...

	gtk_container_get_resize_mode (container: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		ensure valid_result: is_valid_gtk_resize_mode (Result)
		end

	gtk_container_set_resize_mode (container: POINTER; a_resize_mode: INTEGER)
		require valid_mode: is_valid_gtk_resize_mode (a_resize_mode)
		external "C use <gtk/gtk.h>"
		end

	gtk_container_check_resize (container: POINTER)
		external "C use <gtk/gtk.h>"
		end

	-- TODO: wrap this callback-using feature void
	-- gtk_container_foreach (GtkContainer *container, GtkCallback
	-- callback, gpointer callback_data external "C use <gtk/gtk.h>"
	-- end

	-- TODO: wrap this callback-using feature void
	-- gtk_container_foreach_full (GtkContainer *container, --
	-- GtkCallback callback, -- GtkCallbackMarshal marshal, -- gpointer
	-- callback_data, -- GtkDestroyNotify notify
	-- external "C use <gtk/gtk.h>"
	-- end

	gtk_container_get_children (container: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_container_set_reallocate_redraws (container: POINTER; needs_redraws: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_container_set_focus_child (container,child: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_container_get_focus_vadjustment (container: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_container_set_focus_vadjustment (container,adjustment: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_container_get_focus_hadjustment (container: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gk_container_set_focus_hadjustment (container,adjustment: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_container_resize_children (container: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_container_child_type (container: POINTER)
		external "C use <gtk/gtk.h>"
		ensure -- TODO: is_valid_gtk_gtype (Result)
		end

	gtk_container_get_border_width (container: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_container_set_border_width (container: POINTER; a_border_width: INTEGER)
		external "C use <gtk/gtk.h>"
		end


-- void        gtk_container_child_get         (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *first_prop_name,
--                                              ...
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_container_child_set         (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *first_prop_name,
--                                              ...
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_container_child_get_property
--                                             (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *property_name,
--                                              GValue *value
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_container_child_set_property
--                                             (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *property_name,
--                                              const GValue *value
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_container_child_get_valist  (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *first_property_name,
--                                              va_list var_args
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_container_child_set_valist  (GtkContainer *container,
--                                              GtkWidget *child,
--                                              const gchar *first_property_name,
--                                              va_list var_args
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_container_forall            (GtkContainer *container,
--                                              GtkCallback callback,
--                                              gpointer callback_data
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_container_propagate_expose  (GtkContainer *container,
--                                              GtkWidget *child,
--                                              GdkEventExpose *event
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_container_get_focus_chain   (GtkContainer *container,
--                                              GList **focusable_widgets
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_container_set_focus_chain   (GtkContainer *container,
--                                              GList *focusable_widgets
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_container_unset_focus_chain (GtkContainer *container
--		external "C use <gtk/gtk.h>"
--		end

-- GParamSpec* gtk_container_class_find_child_property
--                                             (GObjectClass *cclass,
--                                              const gchar *property_name
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_container_class_install_child_property
--                                             (GtkContainerClass *cclass,
--                                              guint property_id,
--                                              GParamSpec *pspec
--		external "C use <gtk/gtk.h>"
--		end

-- GParamSpec** gtk_container_class_list_child_properties
--                                             (GObjectClass *cclass,
--                                              guint *n_properties
--		external "C use <gtk/gtk.h>"
--		end



-- Properties

--   "border-width"         guint                 : Read / Write
--   "child"                GtkWidget             : Write
--   "resize-mode"          GtkResizeMode         : Read / Write

-- Signals

-- "add"       void        user_function      (GtkContainer *container,
--                                             GtkWidget    *widget,
--                                             gpointer      user_data)      : Run first
-- "check-resize"
--             void        user_function      (GtkContainer *container,
--                                             gpointer      user_data)      : Run last
-- "remove"    void        user_function      (GtkContainer *container,
--                                             GtkWidget    *widget,
--                                             gpointer      user_data)      : Run first
-- "set-focus-child"
--             void        user_function      (GtkContainer *container,
--                                             GtkWidget    *widget,
--                                             gpointer      user_data)      : Run first

end -- class GTK_CONTAINER_EXTERNALS
