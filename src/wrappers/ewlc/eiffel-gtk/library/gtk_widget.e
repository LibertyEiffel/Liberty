note
	description: "GtkWidget -- Base class for all widgets"
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class GTK_WIDGET

inherit GTK_OBJECT

insert
	GTK_WIDGET_EXTERNALS
	GDK_DRAG_ACTION
	GTK_DEST_DEFAULTS
	GDK_MODIFIER_TYPE
	GDK_EVENT_MASK

feature {ANY} -- Access

	hide
			-- Reverses the effects of `show' causing the widget to be hidden
			-- (invisible to the user).
		do
			gtk_widget_hide (handle)
		end

	style: GTK_STYLE
			-- Returns the style for this widget
		do
			create Result.from_external_pointer (gtk_widget_get_style (handle))
		end

	is_sensitive: BOOLEAN
			-- Returns True if this widget is sensitive.
		do
			Result := gtk_widget_is_sensitive (handle).to_boolean
		end


feature {ANY} -- Operation

	set_style (a_style: GTK_STYLE)
			-- Sets the GTK_STYLE for a widget (widget.style).
			-- You probably don't want to use this function;
			-- it interacts badly with themes, because themes work by
			-- replacing the GtkStyle. Instead, use modify_style(). (NOT IMPLEMENTED)
		require
			valid_style: a_style /= Void
		do
			gtk_widget_set_style (handle, a_style.handle)
		end

	show
			-- Flags widget to be displayed.
		do
			debug 
				std_error.put_string(once "Showing a ")
				std_error.put_string(create {STRING}.from_external_copy
											(g_object_type_name(handle)))
				std_error.put_string(once ", handle ")
				std_error.put_pointer(handle)
				std_error.put_new_line
			end
			gtk_widget_show (handle)
		end

	show_all
			-- Recursively shows a widget, and any child widgets (if the
			-- widget is a container).
		do
			gtk_widget_show_all (handle)
		end

	set_drag_destination, drag_dest_set (a_flags, an_actions: INTEGER)
			-- Sets a widget as a potential drop destination.
			-- TODO: GtkTargetEntry isn't wrapped yet, use add_text_targets() and such..
		require
			is_valid_gtk_dest_defaults (a_flags)
			is_valid_gdk_drag_action (an_actions)
		do
			gtk_drag_dest_set (handle, a_flags, default_pointer, 0, an_actions)
		end

	set_drag_source, drag_source_set (a_modifier, an_actions: INTEGER)
			-- Sets up a widget so that GTK+ will start a drag operation when
			-- the user clicks and drags on the widget. The widget must have a
			-- window.
			-- TODO: GtkTargetEntry isn't wrapped yet, use add_text_targets() and such...
		require
			is_valid_gdk_modifier_type (a_modifier)
			is_valid_gdk_drag_action (an_actions)
		do
			gtk_drag_source_set (handle, a_modifier, default_pointer, 0, an_actions)
		end

	drag_dest_add_text_targets
			-- Add the text targets supported by GtkSelection to the target
			-- list of the drag destination. The targets are added with
			-- info = 0. If you need another value, use
			-- drag_dest_set_target_list
		do
			gtk_drag_dest_add_text_targets (handle)
		end

	drag_dest_add_image_targets
			-- Add the image targets supported by GtkSelection to the target
			-- list of the drag destination. The targets are added with
			-- info = 0. If you need another value, use
			-- drag_dest_set_target_list
		do
			gtk_drag_dest_add_image_targets (handle)
		end

	drag_dest_add_uri_targets
			-- Add the URI targets supported by GtkSelection to the target
			-- list of the drag destination. The targets are added with
			-- info = 0. If you need another value, use
			-- drag_dest_set_target_list
		do
			gtk_drag_dest_add_uri_targets (handle)
		end

	drag_source_add_text_targets
			-- Add the text targets supported by GtkSelection to the target
			-- list of the drag source. The targets are added with info = 0.
			-- If you need another value, use drag_source_set_target_list
		do
			gtk_drag_source_add_text_targets (handle)
		end

	drag_source_add_image_targets
			-- Add the writable image targets supported by GtkSelection to the
			-- target list of the drag source. The targets are added with
			-- info = 0. If you need another value, use
			-- drag_source_set_target_list
		do
			gtk_drag_source_add_image_targets (handle)
		end

	drag_source_add_uri_targets
			-- Add the URI targets supported by GtkSelection to the target list
			-- of the drag source. The targets are added with info = 0. If you
			-- need another value, use drag_source_set_target_list
		do
			gtk_drag_source_add_uri_targets (handle)
		end

	drag_source_set_icon_pixbuf (a_pixbuf: GDK_PIXBUF)
			-- Sets the icon that will be used for drags from a particular
			-- widget from a GdkPixbuf. GTK+ retains a reference for pixbuf
			-- and will release it when it is no longer needed.
		do
			gtk_drag_source_set_icon_pixbuf (handle, a_pixbuf.handle)
		end

	drag_source_set_icon_stock (a_stock_id: STRING)
			-- Sets the icon that will be used for drags from a particular
			-- source to a stock icon.
		do
			gtk_drag_source_set_icon_stock  (handle, a_stock_id.to_external)
		end

	drag_source_set_icon_name (an_icon_name: STRING)
			-- Sets the icon that will be used for drags from a particular
			-- source to a themed icon. See the docs for GtkIconTheme for
			-- more details.
		do
			gtk_drag_source_set_icon_name (handle, an_icon_name.to_external)
		end

	set_events (some_events: INTEGER)
			-- Sets the event mask (see GDK_EVENT_MASK) for this widget.
			-- The event mask determines which events the widget will receive.
			-- Keep in mind that different widgets have different default event
			-- masks, and by changing the event mask you may disrupt a widget's
			-- functionality, so be careful. This function must be called while
			-- a widget is unrealized. Consider add_events() for widgets that
			-- are already realized, or if you want to preserve the existing
			-- event mask. This function can't be used with GTK_NO_WINDOW
			-- widgets; to get events on those widgets, place them inside a
			-- GTK_EVENT_BOX and receive events on the event box.
		require
			is_valid_gdk_event_mask (some_events)
		do
			gtk_widget_set_events (handle, some_events)
		end

	add_events (some_events: INTEGER)
			-- Adds the events in the bitfield events to the event mask for
			-- this widget. See set_events() for details.
		require
			is_valid_gdk_event_mask (some_events)
		do
			gtk_widget_add_events (handle, some_events)
		end

-- #define     GTK_WIDGET_TYPE                 (wid)
-- #define     GTK_WIDGET_STATE                (wid)
-- #define     GTK_WIDGET_SAVED_STATE          (wid)
-- #define     GTK_WIDGET_FLAGS                (wid)
-- #define     GTK_WIDGET_TOPLEVEL             (wid)
-- #define     GTK_WIDGET_NO_WINDOW            (wid)

	is_realized: BOOLEAN
		do
			Result := gtk_widget_realized (handle).to_boolean
		end

	is_mapped: BOOLEAN
		do
			Result := gtk_widget_mapped (handle).to_boolean
		end

	is_visible: BOOLEAN
		do
			Result := gtk_widget_visible (handle).to_boolean
		end

	is_drawable: BOOLEAN
		do
			Result := gtk_widget_drawable (handle).to_boolean
		end

-- #define     GTK_WIDGET_SENSITIVE            (wid)
-- #define     GTK_WIDGET_PARENT_SENSITIVE     (wid)
-- #define     GTK_WIDGET_CAN_FOCUS            (wid)
-- #define     GTK_WIDGET_HAS_FOCUS            (wid)
-- #define     GTK_WIDGET_CAN_DEFAULT          (wid)
-- #define     GTK_WIDGET_RECEIVES_DEFAULT     (wid)
-- #define     GTK_WIDGET_HAS_DEFAULT          (wid)
-- #define     GTK_WIDGET_HAS_GRAB             (wid)
-- #define     GTK_WIDGET_RC_STYLE             (wid)
-- #define     GTK_WIDGET_COMPOSITE_CHILD      (wid)
-- #define     GTK_WIDGET_APP_PAINTABLE        (wid)
-- #define     GTK_WIDGET_DOUBLE_BUFFERED      (wid)
-- #define     GTK_WIDGET_SET_FLAGS            (wid,flag)
-- #define     GTK_WIDGET_UNSET_FLAGS          (wid,flag)
-- void        (*GtkCallback)                  (GtkWidget *widget,
--                                              gpointer data);
--             GtkRequisition;
-- struct      GtkAllocation;
--             GtkSelectionData;
--             GtkWidgetAuxInfo;
--             GtkWidgetShapeInfo;
-- enum        GtkWidgetHelpType;
-- GtkWidget*  gtk_widget_new                  (GType type,
--                                              const gchar *first_property_name,
--                                              ...);
-- GtkWidget*  gtk_widget_ref                  (GtkWidget *widget);
-- void        gtk_widget_unref                (GtkWidget *widget);
-- void        gtk_widget_destroy              (GtkWidget *widget);
-- void        gtk_widget_destroyed            (GtkWidget *widget,
--                                              GtkWidget **widget_pointer);
-- void        gtk_widget_set                  (GtkWidget *widget,
--                                              const gchar *first_property_name,
--                                              ...);
-- void        gtk_widget_unparent             (GtkWidget *widget);
-- void        gtk_widget_show_now             (GtkWidget *widget);
-- void        gtk_widget_hide_all             (GtkWidget *widget);
-- void        gtk_widget_map                  (GtkWidget *widget);
-- void        gtk_widget_unmap                (GtkWidget *widget);

	realize
			-- Creates the GDK (windowing system) resources associated with a widget. For example,
			-- 'window' will be created when a widget is realized. Normally realization happens
			-- implicitly; if you show a widget and all its parent containers, then the widget
			-- will be realized and mapped automatically.
			--
			-- Realizing a widget requires all the widget's parent widgets to be realized; calling
			-- 'realize' realizes the widget's parents in addition to widget itself. If a widget
			-- is not yet inside a toplevel window when you realize it, bad things will happen.
			--
			-- This function is primarily used in widget implementations, and isn't very useful
			-- otherwise. Many times when you think you might need it, a better approach is to
			-- connect to a signal that will be called after the widget is realized automatically,
			-- such as "expose_event". Or simply g_signal_connect_after() to the "realize" signal.
		require
			not is_realized
		do
			gtk_widget_realize (handle)
		end

	unrealize
			-- This function is only useful in widget implementations. Causes a widget to be
			-- unrealized (frees all GDK resources associated with the widget, such as 'window').
		require
			is_realized
		do
			gtk_widget_unrealize (handle)
		end

-- void        gtk_widget_queue_resize         (GtkWidget *widget);
-- void        gtk_widget_queue_resize_no_redraw
--                                             (GtkWidget *widget);
-- void        gtk_widget_draw                 (GtkWidget *widget,
--                                              GdkRectangle *area);

	actual_size_request: GTK_REQUISITION
		do
			create Result.make
			gtk_widget_size_request (handle, Result.handle)
		ensure
			Result /= Void
		end

-- void        gtk_widget_get_child_requisition
--                                             (GtkWidget *widget,
--                                              GtkRequisition *requisition);
-- void        gtk_widget_size_allocate        (GtkWidget *widget,
--                                              GtkAllocation *allocation);
-- void        gtk_widget_add_accelerator      (GtkWidget *widget,
--                                              const gchar *accel_signal,
--                                              GtkAccelGroup *accel_group,
--                                              guint accel_key,
--                                              GdkModifierType accel_mods,
--                                              GtkAccelFlags accel_flags);
-- gboolean    gtk_widget_remove_accelerator   (GtkWidget *widget,
--                                              GtkAccelGroup *accel_group,
--                                              guint accel_key,
--                                              GdkModifierType accel_mods);
-- void        gtk_widget_set_accel_path       (GtkWidget *widget,
--                                              const gchar *accel_path,
--                                              GtkAccelGroup *accel_group);
-- GList*      gtk_widget_list_accel_closures  (GtkWidget *widget);
-- gboolean    gtk_widget_can_activate_accel   (GtkWidget *widget,
--                                              guint signal_id);
-- gboolean    gtk_widget_event                (GtkWidget *widget,
--                                              GdkEvent *event);
-- gboolean    gtk_widget_activate             (GtkWidget *widget);
-- void        gtk_widget_reparent             (GtkWidget *widget,
--                                              GtkWidget *new_parent);
-- gboolean    gtk_widget_intersect            (GtkWidget *widget,
--                                              GdkRectangle *area,
--                                              GdkRectangle *intersection);
	-- gboolean    gtk_widget_is_focus             (GtkWidget *widget);
	
	grab_focus
			-- Causes widget to have the keyboard focus for the GtkWindow
			-- it's inside. Current widget must be a focusable widget,
			-- such as a GTK_ENTRY; something like GtkFrame won't
			-- work. (More precisely, it must have the GTK_CAN_FOCUS flag
			-- set.)
		require focusable: can_focus
		do
			gtk_widget_grab_focus (handle)
		end
	
	grab_default
			-- Causes widget to become the default widget. widget must have
			-- the GTK_CAN_DEFAULT flag set; typically you have to set this 
			-- flag yourself by calling 
			-- GTK_WIDGET_SET_FLAGS (widget, GTK_CAN_DEFAULT). The default
			-- widget is activated when the user presses Enter in a window.
			-- Default widgets must be activatable, that is, gtk_widget_activate()
			-- should affect them.
		require defaultable: can_default
		do
			gtk_widget_grab_default (handle)
		end
	
	set_name (a_name: STRING)
			-- Widgets can be named, which allows you to refer to them from
			-- a gtkrc file. You can apply a style to widgets with a particular
			-- name in the gtkrc file. See the documentation for gtkrc files
			-- (on the same page as the docs for GtkRcStyle).
			--
			-- Note that widget names are separated by periods in paths (see
			-- `path'), so names with embedded periods may cause confusion.
			--
			-- a_name : name for the widget
		do
			gtk_widget_set_name (handle, a_name.to_external)
		end

	name: STRING
			-- Retrieves the name of a widget. See `set_name' for the
			-- significance of widget names.
			--
			-- Returns : name of the widget.
		do
			create Result.from_external_copy (gtk_widget_get_name (handle))
		end

-- void        gtk_widget_set_state            (GtkWidget *widget,
--                                              GtkStateType state);
-- void        gtk_widget_set_parent           (GtkWidget *widget,
--                                              GtkWidget *parent);
-- void        gtk_widget_set_parent_window    (GtkWidget *widget,
--                                              GdkWindow *parent_window);

	window: GDK_WINDOW
			-- Result can be void if window isn't realized yet
		local factory: G_OBJECT_EXPANDED_FACTORY [GDK_WINDOW]
		do
			Result := factory.wrapper_or_void (gtk_widget_get_window (handle))
		end

	parent_window: GDK_WINDOW
		local factory: G_OBJECT_EXPANDED_FACTORY [GDK_WINDOW]
		do
			Result := factory.wrapper_or_void (gtk_widget_get_parent_window (handle))
		end

-- void        gtk_widget_set_uposition        (GtkWidget *widget,
--                                              gint x,
--                                              gint y);
-- void        gtk_widget_set_usize            (GtkWidget *widget,
--                                              gint width,
--                                              gint height);
-- void        gtk_widget_set_events           (GtkWidget *widget,
--                                              gint events);
-- void        gtk_widget_add_events           (GtkWidget *widget,
--                                              gint events);
-- void        gtk_widget_set_extension_events (GtkWidget *widget,
--                                              GdkExtensionMode mode);
-- GdkExtensionMode gtk_widget_get_extension_events
--                                             (GtkWidget *widget);
-- GtkWidget*  gtk_widget_get_ancestor         (GtkWidget *widget,
--                                              GType widget_type);
-- GdkColormap* gtk_widget_get_colormap        (GtkWidget *widget);
-- void        gtk_widget_set_colormap         (GtkWidget *widget,
--                                              GdkColormap *colormap);
-- GdkVisual*  gtk_widget_get_visual           (GtkWidget *widget);
-- gint        gtk_widget_get_events           (GtkWidget *widget);
-- void        gtk_widget_get_pointer          (GtkWidget *widget,
--                                              gint *x,
--                                              gint *y);
-- gboolean    gtk_widget_is_ancestor          (GtkWidget *widget,
--                                              GtkWidget *ancestor);
-- gboolean    gtk_widget_translate_coordinates
--                                             (GtkWidget *src_widget,
--                                              GtkWidget *dest_widget,
--                                              gint src_x,
--                                              gint src_y,
--                                              gint *dest_x,
--                                              gint *dest_y);
-- gboolean    gtk_widget_hide_on_delete       (GtkWidget *widget);
-- #define     gtk_widget_set_rc_style         (widget)
-- void        gtk_widget_ensure_style         (GtkWidget *widget);
-- #define     gtk_widget_restore_default_style(widget)
-- void        gtk_widget_reset_rc_styles      (GtkWidget *widget);
-- void        gtk_widget_push_colormap        (GdkColormap *cmap);
-- void        gtk_widget_pop_colormap         (void);
-- void        gtk_widget_set_default_colormap (GdkColormap *colormap);
-- GtkStyle*   gtk_widget_get_default_style    (void);
-- GdkColormap* gtk_widget_get_default_colormap
--                                             (void);
-- GdkVisual*  gtk_widget_get_default_visual   (void);
-- void        gtk_widget_set_direction        (GtkWidget *widget,
--                                              GtkTextDirection dir);
-- enum        GtkTextDirection;
-- GtkTextDirection gtk_widget_get_direction   (GtkWidget *widget);
-- void        gtk_widget_set_default_direction
--                                             (GtkTextDirection dir);
-- GtkTextDirection gtk_widget_get_default_direction
--                                             (void);
-- void        gtk_widget_shape_combine_mask   (GtkWidget *widget,
--                                              GdkBitmap *shape_mask,
--                                              gint offset_x,
--                                              gint offset_y);
-- void        gtk_widget_path                 (GtkWidget *widget,
--                                              guint *path_length,
--                                              gchar **path,
--                                              gchar **path_reversed);
-- void        gtk_widget_class_path           (GtkWidget *widget,
--                                              guint *path_length,
--                                              gchar **path,
--                                              gchar **path_reversed);
-- gchar*      gtk_widget_get_composite_name   (GtkWidget *widget);
-- void        gtk_widget_modify_style         (GtkWidget *widget,
--                                              GtkRcStyle *style);
-- GtkRcStyle* gtk_widget_get_modifier_style   (GtkWidget *widget);
-- void        gtk_widget_modify_fg            (GtkWidget *widget,
--                                              GtkStateType state,
--                                              const GdkColor *color);
-- void        gtk_widget_modify_bg            (GtkWidget *widget,
--                                              GtkStateType state,
--                                              const GdkColor *color);
-- void        gtk_widget_modify_text          (GtkWidget *widget,
--                                              GtkStateType state,
--                                              const GdkColor *color);
-- void        gtk_widget_modify_base          (GtkWidget *widget,
--                                              GtkStateType state,
--                                              const GdkColor *color);
-- void        gtk_widget_modify_font          (GtkWidget *widget,
--                                              PangoFontDescription *font_desc);
-- PangoContext* gtk_widget_get_pango_context  (GtkWidget *widget);
-- PangoLayout* gtk_widget_create_pango_layout (GtkWidget *widget,
--                                              const gchar *text);
-- GdkPixbuf*  gtk_widget_render_icon          (GtkWidget *widget,
--                                              const gchar *stock_id,
--                                              GtkIconSize size,
--                                              const gchar *detail);
-- void        gtk_widget_pop_composite_child  (void);
-- void        gtk_widget_push_composite_child (void);
-- void        gtk_widget_queue_clear          (GtkWidget *widget);
-- void        gtk_widget_queue_clear_area     (GtkWidget *widget,
--                                              gint x,
--                                              gint y,
--                                              gint width,
--                                              gint height);
-- void        gtk_widget_queue_draw_area      (GtkWidget *widget,
--                                              gint x,
--                                              gint y,
--                                              gint width,
--                                              gint height);
-- void        gtk_widget_reset_shapes         (GtkWidget *widget);
-- void        gtk_widget_set_app_paintable    (GtkWidget *widget,
--                                              gboolean app_paintable);
-- void        gtk_widget_set_double_buffered  (GtkWidget *widget,
--                                              gboolean double_buffered);
-- void        gtk_widget_set_redraw_on_allocate
--                                             (GtkWidget *widget,
--                                              gboolean redraw_on_allocate);
-- void        gtk_widget_set_composite_name   (GtkWidget *widget,
--                                              const gchar *name);
-- gboolean    gtk_widget_set_scroll_adjustments
--                                             (GtkWidget *widget,
--                                              GtkAdjustment *hadjustment,
--                                              GtkAdjustment *vadjustment);
-- gboolean    gtk_widget_mnemonic_activate    (GtkWidget *widget,
--                                              gboolean group_cycling);
-- void        gtk_widget_class_install_style_property
--                                             (GtkWidgetClass *klass,
--                                              GParamSpec *pspec);
-- void        gtk_widget_class_install_style_property_parser
--                                             (GtkWidgetClass *klass,
--                                              GParamSpec *pspec,
--                                              GtkRcPropertyParser parser);
-- GParamSpec* gtk_widget_class_find_style_property
--                                             (GtkWidgetClass *klass,
--                                              const gchar *property_name);
-- GParamSpec** gtk_widget_class_list_style_properties
--                                             (GtkWidgetClass *klass,
--                                              guint *n_properties);
-- GdkRegion*  gtk_widget_region_intersect     (GtkWidget *widget,
--                                              GdkRegion *region);
-- gint        gtk_widget_send_expose          (GtkWidget *widget,
--                                              GdkEvent *event);
-- void        gtk_widget_style_get            (GtkWidget *widget,
--                                              const gchar *first_property_name,
--                                              ...);
-- void        gtk_widget_style_get_property   (GtkWidget *widget,
--                                              const gchar *property_name,
--                                              GValue *value);
-- void        gtk_widget_style_get_valist     (GtkWidget *widget,
--                                              const gchar *first_property_name,
--                                              va_list var_args);
-- AtkObject*  gtk_widget_get_accessible       (GtkWidget *widget);
-- gboolean    gtk_widget_child_focus          (GtkWidget *widget,
--                                              GtkDirectionType direction);
-- void        gtk_widget_child_notify         (GtkWidget *widget,
--                                              const gchar *child_property);
-- void        gtk_widget_freeze_child_notify  (GtkWidget *widget);
-- gboolean    gtk_widget_get_child_visible    (GtkWidget *widget);
-- GtkWidget*  gtk_widget_get_parent           (GtkWidget *widget);
-- GtkSettings* gtk_widget_get_settings        (GtkWidget *widget);
-- GtkClipboard* gtk_widget_get_clipboard      (GtkWidget *widget,
--                                              GdkAtom selection);
-- GdkDisplay* gtk_widget_get_display          (GtkWidget *widget);
-- GdkWindow*  gtk_widget_get_root_window      (GtkWidget *widget);
-- GdkScreen*  gtk_widget_get_screen           (GtkWidget *widget);
-- gboolean    gtk_widget_has_screen           (GtkWidget *widget);

-- #define     gtk_widget_pop_visual           ()
-- #define     gtk_widget_push_visual          (visual)
-- void        gtk_widget_set_child_visible    (GtkWidget *widget,
--                                              gboolean is_visible);
-- #define     gtk_widget_set_default_visual   (visual)
-- #define     gtk_widget_set_visual           (widget,visual)
-- void        gtk_widget_thaw_child_notify    (GtkWidget *widget);
-- void        gtk_widget_set_no_show_all      (GtkWidget *widget,
--                                              gboolean no_show_all);
-- gboolean    gtk_widget_get_no_show_all      (GtkWidget *widget);
-- GList*      gtk_widget_list_mnemonic_labels (GtkWidget *widget);
-- void        gtk_widget_add_mnemonic_label   (GtkWidget *widget,
--                                              GtkWidget *label);
-- void        gtk_widget_remove_mnemonic_label
--                                             (GtkWidget *widget,
--                                              GtkWidget *label);

-- GtkRequisition* gtk_requisition_copy        (const GtkRequisition *requisition);
-- void        gtk_requisition_free            (GtkRequisition *requisition);



-- Object Hierarchy

--   GObject
--    +----GtkObject
--          +----GtkWidget
--                +----GtkContainer
--                +----GtkMisc
--                +----GtkCalendar
--                +----GtkCellView
--                +----GtkDrawingArea
--                +----GtkEntry
--                +----GtkRuler
--                +----GtkRange
--                +----GtkSeparator
--                +----GtkInvisible
--                +----GtkOldEditable
--                +----GtkPreview
--                +----GtkProgress

-- Known Derived Interfaces

-- GtkWidget is required by GtkFileChooser and GtkCellEditable.
-- Implemented Interfaces

-- GtkWidget implements AtkImplementorIface.
-- Properties

--   "app-paintable"        gboolean              : Read / Write
--   "can-default"          gboolean              : Read / Write
--   "can-focus"            gboolean              : Read / Write
--   "composite-child"      gboolean              : Read
--   "events"               GdkEventMask          : Read / Write
--   "extension-events"     GdkExtensionMode      : Read / Write
--   "has-default"          gboolean              : Read / Write
--   "has-focus"            gboolean              : Read / Write
--   "height-request"       gint                  : Read / Write
--   "is-focus"             gboolean              : Read / Write
--   "name"                 gchararray            : Read / Write
--   "no-show-all"          gboolean              : Read / Write
--   "parent"               GtkContainer          : Read / Write
--   "receives-default"     gboolean              : Read / Write
--   "sensitive"            gboolean              : Read / Write
--   "style"                GtkStyle              : Read / Write
--   "visible"              gboolean              : Read / Write
--   "width-request"        gint                  : Read / Write

-- Style Properties

--   "cursor-aspect-ratio"  gfloat                : Read
--   "cursor-color"         GdkColor              : Read
--   "draw-border"          GtkBorder             : Read
--   "focus-line-pattern"   gchararray            : Read
--   "focus-line-width"     gint                  : Read
--   "focus-padding"        gint                  : Read
--   "interior-focus"       gboolean              : Read
--   "secondary-cursor-color" GdkColor              : Read

feature {ANY} -- Signals

-- "accel-closures-changed"
--             void        user_function      (GtkWidget *widget,
--                                             gpointer   user_data)      : 
-- "can-activate-accel"
--             gboolean    user_function      (GtkWidget *widget,
--                                             guint      signal_id,
--                                             gpointer   user_data)      : Run last
-- "child-notify"
--             void        user_function      (GtkWidget  *widget,
--                                             GParamSpec *pspec,
--                                             gpointer    user_data)      : Run first / No recursion / Has details / No hooks
-- "client-event"
--             gboolean    user_function      (GtkWidget      *widget,
--                                             GdkEventClient *event,
--                                             gpointer        user_data)      : Run last
-- "configure-event"
--             gboolean    user_function      (GtkWidget         *widget,
--                                             GdkEventConfigure *event,
--                                             gpointer           user_data)      : Run last

feature {ANY} -- delete-event signal

	delete_event_signal_name: STRING is "delete-event"

	enable_on_delete_event
			-- Connects "delete-event" signal to `on_delete_event' feature.
		do
			connect (Current, delete_event_signal_name, $on_delete_event)
		end

	on_delete_event: INTEGER
			-- Built-in delete-event signal handler; empty by design; redefine it.

			-- The `delete-event' signal is emitted if a user requests that a
			-- toplevel window is closed. The default handler for this signal
			-- destroys the window.
			-- finish with "Result := 1" to stop other handlers.
		do
		end

	connect_agent_to_delete_event_signal (a_function: FUNCTION[ANY, TUPLE [GTK_WIDGET, GDK_EVENT], BOOLEAN])
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			delete_event_callback: DELETE_EVENT_CALLBACK
		do
			create delete_event_callback.make
			delete_event_callback.connect (Current, a_function)
		end

-- "direction-changed"
--             void        user_function      (GtkWidget       *widget,
--                                             GtkTextDirection arg1,
--                                             gpointer         user_data)      : Run first

feature {ANY} -- drag-begin signal

	drag_begin_signal_name: STRING is "drag-begin"
		-- "drag-begin"
		--             void        user_function      (GtkWidget      *widget,
		--                                             GdkDragContext *drag_context,
		--                                             gpointer        user_data)         : Run last

	enable_on_drag_begin
			-- Connects "drag-begin" signal to `on_drag_begin' feature.
		do
			connect (Current, drag_begin_signal_name, $on_drag_begin)
		end

	on_drag_begin: INTEGER
			-- Built-in drag-begin signal handler; empty by design; redefine it.

			-- The `drag-begin' signal is emitted on the drag source
			-- when a drag is started. A typical reason to connect to this
			-- signal is to set up a custom drag icon with
			-- gtk_drag_source_set_icon().
		do
		end

	connect_agent_to_drag_begin_signal (a_procedure: PROCEDURE[ANY, TUPLE [GDK_DRAG_CONTEXT, GTK_WIDGET]])
			-- widget : 	the object which received the signal.
			-- drag_context : 	the drag context
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			drag_begin_callback: DRAG_BEGIN_CALLBACK
		do
			create drag_begin_callback.make
			drag_begin_callback.connect (Current, a_procedure)
		end

feature {ANY} -- drag-data-delete signal

	drag_data_delete_signal_name: STRING is "drag-data-delete"
		-- "drag-data-delete"
		--             void        user_function      (GtkWidget      *widget,
		--                                             GdkDragContext *drag_context,
		--                                             gpointer        user_data)         : Run last

	enable_on_drag_data_delete
			-- Connects "drag-data-delete" signal to `on_drag_data_delete' feature.
		do
			connect (Current, drag_data_delete_signal_name, $on_drag_data_delete)
		end

	on_drag_data_delete: INTEGER
			-- Built-in drag-data-delete signal handler; empty by design; redefine it.

			-- The `drag-data-delete' signal is emitted on the drag
			-- source when a drag with the action GDK_ACTION_MOVE is
			-- successfully completed. The signal handler is responsible
			-- for deleting the data that has been dropped. What "delete"
			-- means, depends on the context of the drag operation
		do
		end

	connect_agent_to_drag_data_delete_signal (a_procedure: PROCEDURE[ANY, TUPLE [GDK_DRAG_CONTEXT, GTK_WIDGET]])
			-- widget : 	the object which received the signal.
			-- drag_context : 	the drag context
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			drag_data_delete_callback: DRAG_DATA_DELETE_CALLBACK
		do
			create drag_data_delete_callback.make
			drag_data_delete_callback.connect (Current, a_procedure)
		end

feature {ANY} -- drag-data-get signal

	drag_data_get_signal_name: STRING is "drag-data-get"
		-- "drag-data-get"
		--             void        user_function      (GtkWidget        *widget,
		--                                             GdkDragContext   *drag_context,
		--                                             GtkSelectionData *data,
		--                                             guint             info,
		--                                             guint             time,
		--                                             gpointer          user_data)         : Run last

	enable_on_drag_data_get
			-- Connects "drag-data-get" signal to `on_drag_data_get' feature.
		do
			connect (Current, drag_data_get_signal_name, $on_drag_data_get)
		end

	on_drag_data_get: INTEGER
			-- Built-in drag-data-get signal handler; empty by design; redefine it.

			-- The `drag-data-get' signal is emitted on the drag source
			-- when the drop site requests the data which is dragged. It is
			-- the responsibility of the signal handler to fill data with
			-- the data in the format which is indicated by info. See
			-- gtk_selection_data_set() and gtk_selection_data_set_text().
		do
		end

	connect_agent_to_drag_data_get_signal (a_procedure: PROCEDURE[ANY,
																					  TUPLE [GDK_DRAG_CONTEXT, GTK_SELECTION_DATA,
																								INTEGER, INTEGER, GTK_WIDGET]])
			-- widget : 	the object which received the signal.
			-- drag_context : 	the drag context
			-- data : 	the GtkSelectionData to be filled with the dragged data
			-- info : 	the info that has been registered with the target in the GtkTargetList.
			-- time : 	the timestamp at which the data was requested
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			drag_data_get_callback: DRAG_DATA_GET_CALLBACK
		do
			create drag_data_get_callback.make
			drag_data_get_callback.connect (Current, a_procedure)
		end

feature {ANY} -- drag-data-received signal

	drag_data_received_signal_name: STRING is "drag-data-received"
		-- "drag-data-received"
		--             void        user_function      (GtkWidget        *widget,
		--                                             GdkDragContext   *drag_context,
		--                                             gint              x,
		--                                             gint              y,
		--                                             GtkSelectionData *data,
		--                                             guint             info,
		--                                             guint             time,
		--                                             gpointer          user_data)         : Run last

	enable_on_drag_data_received
			-- Connects "drag-data-received" signal to `on_drag_data_received' feature.
		do
			connect (Current, drag_data_received_signal_name, $on_drag_data_received)
		end

	on_drag_data_received: INTEGER
			-- Built-in drag-data-received signal handler; empty by design; redefine it.

			-- The `drag-data-received' signal is emitted on the drop
			-- site when the dragged data has been received. If the data
			-- was received in order to determine whether the drop will be
			-- accepted, the handler is expected to call gdk_drag_status()
			-- and not finish the drag. If the data was received in
			-- response to a `drag-drop' signal (and this is the last
			-- target to be received), the handler for this signal is
			-- expected to process the received data and then call
			-- gtk_drag_finish(), setting the success parameter depending
			-- on whether the data was processed successfully.

			-- The handler may inspect and modify drag_context->action
			-- before calling gtk_drag_finish(), e.g. to implement
			-- GDK_ACTION_ASK as shown in the following example:
			-- (see http://developer.gnome.org/doc/API/2.0/gtk/GtkWidget.html#GtkWidget-drag-data-received)
		do
		end

	connect_agent_to_drag_data_received_signal (a_procedure: PROCEDURE[ANY,
																							 TUPLE [GDK_DRAG_CONTEXT, INTEGER, INTEGER,
																									  GTK_SELECTION_DATA, INTEGER, INTEGER,
																									  GTK_WIDGET]])
			-- widget : 	the object which received the signal.
			-- drag_context : 	the drag context
			-- x : 	where the drop happened
			-- y : 	where the drop happened
			-- data : 	the received data
			-- info : 	the info that has been registered with the target in the GtkTargetList.
			-- time : 	the timestamp at which the data was received
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			drag_data_received_callback: DRAG_DATA_RECEIVED_CALLBACK
		do
			create drag_data_received_callback.make
			drag_data_received_callback.connect (Current, a_procedure)
		end

feature {ANY} -- drag-drop signal

	drag_drop_signal_name: STRING is "drag-drop"
		-- "drag-drop" gboolean    user_function      (GtkWidget      *widget,
		--                                             GdkDragContext *drag_context,
		--                                             gint            x,
		--                                             gint            y,
		--                                             guint           time,
		--                                             gpointer        user_data)         : Run last

	enable_on_drag_drop
			-- Connects "drag-drop" signal to `on_drag_drop' feature.
		do
			connect (Current, drag_drop_signal_name, $on_drag_drop)
		end

	on_drag_drop: INTEGER
			-- Built-in drag-drop signal handler; empty by design; redefine it.

			-- The `drag-drop signal' is emitted on the drop site when
			-- the user drops the data onto the widget. The signal handler
			-- must determine whether the cursor position is in a drop zone
			-- or not. If it is not in a drop zone, it returns FALSE and no
			-- further processing is necessary. Otherwise, the handler
			-- returns TRUE. In this case, the handler must ensure that
			-- gtk_drag_finish() is called to let the source know that the
			-- drop is done. The call to gtk_drag_finish() can be done
			-- either directly or in a ::drag-data-received handler which
			-- gets triggered by calling gtk_drop_get_data() to receive the
			-- data for one or more of the supported targets.
		do
		end

	connect_agent_to_drag_drop_signal (a_function: FUNCTION[ANY, TUPLE [GDK_DRAG_CONTEXT, INTEGER, INTEGER,
																							  INTEGER, GTK_WIDGET], BOOLEAN])
			-- widget : 	the object which received the signal.
			-- drag_context : 	the drag context
			-- x : 	the x coordinate of the current cursor position
			-- y : 	the y coordinate of the current cursor position
			-- time : 	the timestamp of the motion event
			-- returns : 	whether the cursor position is in a drop zone
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			drag_drop_callback: DRAG_DROP_CALLBACK
		do
			create drag_drop_callback.make
			drag_drop_callback.connect (Current, a_function)
		end

feature {ANY} -- drag-end signal

	drag_end_signal_name: STRING is "drag-end"
		-- "drag-end"  void        user_function      (GtkWidget      *widget,
		--                                             GdkDragContext *drag_context,
		--                                             gpointer        user_data)         : Run last

	enable_on_drag_end
			-- Connects "drag-end" signal to `on_drag_end' feature.
		do
			connect (Current, drag_end_signal_name, $on_drag_end)
		end

	on_drag_end: INTEGER
			-- Built-in drag-end signal handler; empty by design; redefine it.

			-- The `drag-end' signal is emitted on the drag source when
			-- a drag is finished. A typical reason to connect to this
			-- signal is to undo things done in `drag-begin'.
		do
		end

	connect_agent_to_drag_end_signal (a_procedure: PROCEDURE[ANY, TUPLE [GDK_DRAG_CONTEXT, GTK_WIDGET]])
			-- widget : 	the object which received the signal.
			-- drag_context : 	the drag context
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			drag_end_callback: DRAG_END_CALLBACK
		do
			create drag_end_callback.make
			drag_end_callback.connect (Current, a_procedure)
		end

feature {ANY} -- drag-leave signal

	drag_leave_signal_name: STRING is "drag-leave"
		-- "drag-leave"
		--             void        user_function      (GtkWidget      *widget,
		--                                             GdkDragContext *drag_context,
		--                                             guint           time,
		--                                             gpointer        user_data)         : Run last

	enable_on_drag_leave
			-- Connects "drag-leave" signal to `on_drag_leave' feature.
		do
			connect (Current, drag_leave_signal_name, $on_drag_leave)
		end

	on_drag_leave: INTEGER
			-- Built-in drag-leave signal handler; empty by design; redefine it.

			-- The `drag-leave' signal is emitted on the drop site when
			-- the cursor leaves the widget. A typical reason to connect to
			-- this signal is to undo things done in `drag-motion', e.g.
			-- undo highlighting with gtk_drag_unhighlight()
		do
		end

	connect_agent_to_drag_leave_signal (a_procedure: PROCEDURE[ANY, TUPLE [GDK_DRAG_CONTEXT, INTEGER, GTK_WIDGET]])
			-- widget : 	the object which received the signal.
			-- drag_context : 	the drag context
			-- time : 	the timestamp of the motion event
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			drag_leave_callback: DRAG_LEAVE_CALLBACK
		do
			create drag_leave_callback.make
			drag_leave_callback.connect (Current, a_procedure)
		end

feature {ANY} -- drag-motion signal

	drag_motion_signal_name: STRING is "drag-motion"
		-- "drag-motion"
		--             gboolean    user_function      (GtkWidget      *widget,
		--                                             GdkDragContext *drag_context,
		--                                             gint            x,
		--                                             gint            y,
		--                                             guint           time,
		--                                             gpointer        user_data)         : Run last

	enable_on_drag_motion
			-- Connects "drag-motion" signal to `on_drag_motion' feature.
		do
			connect (Current, drag_motion_signal_name, $on_drag_motion)
		end

	on_drag_motion: INTEGER
			-- Built-in drag-motion signal handler; empty by design; redefine it.

			-- The `drag-motion' signal is emitted on the drop site when
			-- the user moves the cursor over the widget during a drag. The
			-- signal handler must determine whether the cursor position is
			-- in a drop zone or not. If it is not in a drop zone, it
			-- returns FALSE and no further processing is necessary.
			-- Otherwise, the handler returns TRUE. In this case, the
			-- handler is responsible for providing the necessary
			-- information for displaying feedback to the user, by calling
			-- gdk_drag_status(). If the decision whether the drop will be
			-- accepted or rejected can't be made based solely on the
			-- cursor position and the type of the data, the handler may
			-- inspect the dragged data by calling gtk_drag_get_data() and
			-- defer the gdk_drag_status() call to the `drag-data-received'
			-- handler.

			-- Note that there is no `drag-enter' signal. The drag
			-- receiver has to keep track of whether he has received any
			-- `drag-motion' signals since the last `drag-leave' and if
			-- not, treat the `drag-motion' signal as an "enter" signal.
			-- Upon an "enter", the handler will typically highlight the
			-- drop site with gtk_drag_highlight().
			-- See an example here: http://developer.gnome.org/doc/API/2.0/gtk/GtkWidget.html#GtkWidget-drag-motion.
		do
		end

	connect_agent_to_drag_motion_signal (a_function: FUNCTION[ANY, TUPLE [GDK_DRAG_CONTEXT, INTEGER, INTEGER,
																								 INTEGER, GTK_WIDGET], BOOLEAN])
			-- widget : 	the object which received the signal.
			-- drag_context : 	the drag context
			-- x : 	the x coordinate of the current cursor position
			-- y : 	the y coordinate of the current cursor position
			-- time : 	the timestamp of the motion event
			-- returns : 	whether the cursor position is in a drop zone
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			drag_motion_callback: DRAG_MOTION_CALLBACK
		do
			create drag_motion_callback.make
			drag_motion_callback.connect (Current, a_function)
		end

feature {ANY} -- enter-notify-event signal

	enter_notify_event_signal_name: STRING is "enter-notify-event"
			-- "enter-notify-event"
			--  gboolean user_function (GtkWidget        *widget,
			--                          GdkEventCrossing *event,
			--                          gpointer          user_data)  : Run last

	enable_on_enter_notify_event
			-- Connects "enter-notify-event" signal to `on_enter_notify_event' feature.
		do
			connect (Current, enter_notify_event_signal_name, $on_enter_notify_event)
		end

	on_enter_notify_event (an_event_crossing: GDK_EVENT_CROSSING; a_widget: GTK_WIDGET): BOOLEAN
			-- Built-in enter-notify-event signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_enter_notify_event_signal (a_function: FUNCTION[ANY, TUPLE [GDK_EVENT_CROSSING, GTK_WIDGET], BOOLEAN])
			-- widget : 	the object which received the signal.
			-- event : 	
			-- user_data : 	user data set when the signal handler was connected.
			-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			enter_notify_event_callback: ENTER_NOTIFY_EVENT_CALLBACK
		do
			create enter_notify_event_callback.make
			enter_notify_event_callback.connect (Current, a_function)
		end


-- "event"     gboolean    user_function      (GtkWidget *widget,
--                                             GdkEvent  *event,
--                                             gpointer   user_data)      : Run last
-- "event-after"
--             void        user_function      (GtkWidget *widget,
--                                             GdkEvent  *event,
--                                             gpointer   user_data)      : 

--             gboolean    user_function      (GtkWidget      *widget,
--                                             GdkEventExpose *event,
--                                             gpointer        user_data)      : Run last

feature {ANY} -- "expose-event"
	connect_agent_to_expose_event_signal (a_function: FUNCTION[ANY, TUPLE [GDK_EVENT_EXPOSE, GTK_WIDGET], BOOLEAN])
			-- The ::expose-event signal is emitted when an area of a previously
			-- obscured GdkWindow is made visible and needs to be redrawn.
			-- GTK_NO_WINDOW widgets will get a synthesized event from their
			-- parent widget.
			--
			-- To receive this signal, the GdkWindow associated to the widget
			-- needs to enable the GDK_EXPOSURE_MASK mask.
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			expose_event_callback: EXPOSE_EVENT_CALLBACK
		do
			create expose_event_callback.make
			expose_event_callback.connect (Current, a_function)
		end

-- "focus"     gboolean    user_function      (GtkWidget       *widget,
--                                             GtkDirectionType arg1,
--                                             gpointer         user_data)      : Run last
-- "focus-in-event"
--             gboolean    user_function      (GtkWidget     *widget,
--                                             GdkEventFocus *event,
--                                             gpointer       user_data)      : Run last
feature {ANY} -- focus-out-event signal

	focus_out_event_signal_name: STRING is "focus-out-event"
		-- "focus-out-event"
		--             gboolean    user_function      (GtkWidget     *widget,
		--                                             GdkEventFocus *event,
		--                                             gpointer       user_data)      : Run last

	enable_on_focus_out_event
			-- Connects "kry-press-event" signal to `on_focus_out_event' feature.
		do
			connect (Current, focus_out_event_signal_name, $on_focus_out_event)
		end

	on_focus_out_event: INTEGER
			-- Built-in focus-out-event signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_focus_out_event_signal (a_function: FUNCTION[ANY, TUPLE [GDK_EVENT_FOCUS, GTK_WIDGET], BOOLEAN])
			-- The `focus-out-event' signal will be emitted when the keyboard focus
			-- leaves the widget's window.

			-- To receive this signal, the GdkWindow associated to the widget needs to
			-- enable the GDK_FOCUS_CHANGE_MASK mask.

			-- widget: the object which received the signal
			-- event: the GdkEventFocus which triggered this signal
			-- Returns: True to stop other handlers from being invoked for the
			--          event. False to propagate the event further.
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			focus_out_event_callback: FOCUS_OUT_EVENT_CALLBACK
		do
			create focus_out_event_callback.make
			focus_out_event_callback.connect (Current, a_function)
		end

-- "grab-broken-event"
--             gboolean    user_function      (GtkWidget *widget,
--                                             GdkEvent  *event,
--                                             gpointer   user_data)      : Run last
-- "grab-focus"
--             void        user_function      (GtkWidget *widget,
--                                             gpointer   user_data)      : Run last / Action
-- "grab-notify"
--             void        user_function      (GtkWidget *widget,
--                                             gboolean   arg1,
--                                             gpointer   user_data)      : Run first
-- "hide"      void        user_function      (GtkWidget *widget,
--                                             gpointer   user_data)      : Run first
-- "hierarchy-changed"
--             void        user_function      (GtkWidget *widget,
--                                             GtkWidget *widget2,
--                                             gpointer   user_data)      : Run last
feature {ANY} -- key-press-event signal

	key_press_event_signal_name: STRING is "key-press-event"
		-- "key-press-event" signal
		-- gboolean    user_function                  (GtkWidget       *widget,
		--											   GdkEventKey     *event,
		--											   gpointer        user_data)      : Run last

	enable_on_key_press_event
			-- Connects "kry-press-event" signal to `on_key_press_event' feature.
		do
			connect (Current, key_press_event_signal_name, $on_key_press_event)
		end

	on_key_press_event: INTEGER
			-- Built-in key-press-event signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_key_press_event_signal (a_function: FUNCTION[ANY, TUPLE [GDK_EVENT_KEY, GTK_WIDGET], BOOLEAN])
			-- widget : 	the object which received the signal.
			-- event :
			-- user_data : 	user data set when the signal handler was connected.
			-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			key_press_event_callback: KEY_PRESS_EVENT_CALLBACK
		do
			create key_press_event_callback.make
			key_press_event_callback.connect (Current, a_function)
		end

-- "key-release-event"
--             gboolean    user_function      (GtkWidget   *widget,
--                                             GdkEventKey *event,
--                                             gpointer     user_data)      : Run last

feature {ANY} -- leave-notify-event signal

	leave_notify_event_signal_name: STRING is "leave-notify-event"
			-- "leave-notify-event"
			--  gboolean user_function (GtkWidget        *widget,
			--                          GdkEventCrossing *event,
			--                          gpointer          user_data)  : Run last

	enable_on_leave_notify_event
			-- Connects "leave-notify-event" signal to `on_leave_notify_event' feature.
		do
			connect (Current, leave_notify_event_signal_name, $on_leave_notify_event)
		end

	on_leave_notify_event (an_event_crossing: GDK_EVENT_CROSSING; a_widget: GTK_WIDGET): BOOLEAN
			-- Built-in leave-notify-event signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_leave_notify_event_signal (a_function: FUNCTION[ANY, TUPLE [GDK_EVENT_CROSSING, GTK_WIDGET], BOOLEAN])
			-- widget : 	the object which received the signal.
			-- event : 	
			-- user_data : 	user data set when the signal handler was connected.
			-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			leave_notify_event_callback: LEAVE_NOTIFY_EVENT_CALLBACK
		do
			create leave_notify_event_callback.make
			leave_notify_event_callback.connect (Current, a_function)
		end


-- "map"       void        user_function      (GtkWidget *widget,
--                                             gpointer   user_data)      : Run first
-- "map-event" gboolean    user_function      (GtkWidget *widget,
--                                             GdkEvent  *event,
--                                             gpointer   user_data)      : Run last
-- "mnemonic-activate"
--             gboolean    user_function      (GtkWidget *widget,
--                                             gboolean   arg1,
--                                             gpointer   user_data)      : Run last

feature {ANY} -- motion-notify-event signal

	motion_notify_event_signal_name: STRING is "motion-notify-event"
		-- "motion-notify-event"
		--             gboolean    user_function      (GtkWidget      *widget,
		--                                             GdkEventMotion *event,
		--                                             gpointer        user_data)      : Run last

	enable_on_motion_notify_event
			-- Connects "motion-notify-event" signal to `on_motion_notify_event' feature.
		do
			connect (Current, motion_notify_event_signal_name, $on_motion_notify_event)
		end

	on_motion_notify_event (a_event_motion: GDK_EVENT_MOTION; a_widet: GTK_WIDGET): BOOLEAN
			-- Built-in motion-notify-event signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_motion_notify_event_signal (a_function: FUNCTION[ANY, TUPLE [GDK_EVENT_MOTION, GTK_WIDGET], BOOLEAN])
			-- widget : 	the object which received the signal.
			-- event : 	
			-- user_data : 	user data set when the signal handler was connected.
			-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			motion_notify_event_callback: MOTION_NOTIFY_EVENT_CALLBACK
		do
			create motion_notify_event_callback.make
			motion_notify_event_callback.connect (Current, a_function)
		end

feature {ANY} -- button-release-event signal

	button_release_event_signal_name: STRING is "button-release-event"
		-- "button-release-event" signal
		-- gboolean    user_function                  (GtkWidget      *widget,
		--											   GdkEventButton *event,
		--											   gpointer        user_data)      : Run last

	enable_on_button_release_event
			-- Connects "button-release-event" signal to `on_button_release_event' feature.
		do
			connect (Current, button_release_event_signal_name, $on_button_release_event)
		end

	on_button_release_event (event: GDK_EVENT_BUTTON; a_widget: GTK_WIDGET): BOOLEAN
			-- Built-in button-release-event signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_button_release_event_signal (a_function: FUNCTION[ANY, TUPLE [GDK_EVENT_BUTTON, GTK_WIDGET], BOOLEAN])
			-- widget : 	the object which received the signal.
			-- event :
			-- user_data : 	user data set when the signal handler was connected.
			-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			button_release_event_callback: BUTTON_RELEASE_EVENT_CALLBACK
		do
			create button_release_event_callback.make
			button_release_event_callback.connect (Current, a_function)
		end

feature {ANY} -- button-press-event signal

	button_press_event_signal_name: STRING is "button-press-event"
		-- "button-press-event" signal
		-- gboolean    user_function                  (GtkWidget      *widget,
		--											   GdkEventButton *event,
		--											   gpointer        user_data)      : Run last

	enable_on_button_press_event
			-- Connects "button-press-event" signal to `on_button_press_event' feature.
		do
			connect (Current, button_press_event_signal_name, $on_button_press_event)
		end

	on_button_press_event (event: GDK_EVENT_BUTTON; a_widget: GTK_WIDGET): BOOLEAN
			-- Built-in button-press-event signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_button_press_event_signal (a_function: FUNCTION[ANY, TUPLE [GDK_EVENT_BUTTON, GTK_WIDGET], BOOLEAN])
			-- widget : 	the object which received the signal.
			-- event :
			-- user_data : 	user data set when the signal handler was connected.
			-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			button_press_event_callback: BUTTON_PRESS_EVENT_CALLBACK
		do
			create button_press_event_callback.make
			button_press_event_callback.connect (Current, a_function)
		end

-- "no-expose-event"
--             gboolean    user_function      (GtkWidget        *widget,
--                                             GdkEventNoExpose *event,
--                                             gpointer          user_data)      : Run last
-- "parent-set"
--             void        user_function      (GtkWidget *widget,
--                                             GtkObject *old_parent,
--                                             gpointer   user_data)       : Run first
-- "popup-menu"
--             gboolean    user_function      (GtkWidget *widget,
--                                             gpointer   user_data)      : Run last / Action
-- "property-notify-event"
--             gboolean    user_function      (GtkWidget        *widget,
--                                             GdkEventProperty *event,
--                                             gpointer          user_data)      : Run last
-- "proximity-in-event"
--             gboolean    user_function      (GtkWidget         *widget,
--                                             GdkEventProximity *event,
--                                             gpointer           user_data)      : Run last
-- "proximity-out-event"
--             gboolean    user_function      (GtkWidget         *widget,
--                                             GdkEventProximity *event,
--                                             gpointer           user_data)      : Run last

feature {ANY} -- realize signal

	realize_signal_name: STRING is "realize"
-- "realize"   void        user_function      (GtkWidget *widget,
--                                             gpointer   user_data)      : Run first

	enable_on_realize
			-- Connects "realize" signal to `on_realize' feature.
		do
			connect (Current, realize_signal_name, $on_realize)
		end

	on_realize
			-- Built-in realize signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_realize_signal (a_procedure: PROCEDURE[ANY, TUPLE [GTK_WIDGET]])
			-- widget : 	the object which received the signal.
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			realize_callback: REALIZE_CALLBACK
		do
			create realize_callback.make
			realize_callback.connect (Current, a_procedure)
		end

-- "screen-changed"
--             void        user_function      (GtkWidget *widget,
--                                             GdkScreen *arg1,
--                                             gpointer   user_data)      : Run last

feature {ANY} -- scroll-event signal

	scroll_event_signal_name: STRING is "scroll-event"
		--             gboolean    user_function      (GtkWidget      *widget,
		--                                             GdkEventScroll *event,
		--                                             gpointer        user_data)      : Run last


	enable_on_scroll_event
			-- Connects "scroll-event" signal to `on_scroll_event' feature.
		do
			connect (Current, scroll_event_signal_name, $on_scroll_event)
		end

	on_scroll_event (event: POINTER; a_widget: POINTER): BOOLEAN
			-- Built-in button-release-event signal handler; empty by design; redefine it.
		do
		end

	connect_agent_to_scroll_event_signal (a_function: FUNCTION[ANY, TUPLE [GDK_EVENT_SCROLL, GTK_WIDGET], BOOLEAN])
			-- widget : 	the object which received the signal.
			-- event :
			-- user_data : 	user data set when the signal handler was connected.
			-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		require
			valid_function: a_function /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			scroll_event_callback: SCROLL_EVENT_CALLBACK
		do
			create scroll_event_callback.make
			scroll_event_callback.connect (Current, a_function)
		end

-- "selection-clear-event"
--             gboolean    user_function      (GtkWidget         *widget,
--                                             GdkEventSelection *event,
--                                             gpointer           user_data)      : Run last
-- "selection-get"
--             void        user_function      (GtkWidget        *widget,
--                                             GtkSelectionData *data,
--                                             guint             info,
--                                             guint             time,
--                                             gpointer          user_data)      : Run last
-- "selection-notify-event"
--             gboolean    user_function      (GtkWidget         *widget,
--                                             GdkEventSelection *event,
--                                             gpointer           user_data)      : Run last
-- "selection-received"
--             void        user_function      (GtkWidget        *widget,
--                                             GtkSelectionData *data,
--                                             guint             time,
--                                             gpointer          user_data)      : Run last
-- "selection-request-event"
--             gboolean    user_function      (GtkWidget         *widget,
--                                             GdkEventSelection *event,
--                                             gpointer           user_data)      : Run last
-- "show"      void        user_function      (GtkWidget *widget,
--                                             gpointer   user_data)      : Run first
-- "show-help" gboolean    user_function      (GtkWidget        *widget,
--                                             GtkWidgetHelpType arg1,
--                                             gpointer          user_data)      : Run last / Action

feature {ANY} -- size-allocate signal

	size_allocate_signal_name: STRING is "size-allocate"
		-- "size-allocate"
		--             void        user_function      (GtkWidget     *widget,
		--                                             GtkAllocation *allocation,
		--                                             gpointer       user_data)       : Run first

	enable_on_size_allocate
			-- Connects "size-allocate" signal to `on_size_allocate' feature.
		do
			connect (Current, size_allocate_signal_name, $on_size_allocate)
		end

	on_size_allocate: INTEGER
			-- Built-in size-allocate signal handler; empty by design; redefine it.

			-- The `size-allocate' signal is emitted if a user requests that a
			-- toplevel window is closed. The default handler for this signal
			-- destroys the window.
			-- finish with "Result := 1" to stop other handlers.
		do
		end

	connect_agent_to_size_allocate_signal (a_procedure: PROCEDURE[ANY, TUPLE [GTK_ALLOCATION, GTK_WIDGET]])
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			size_allocate_callback: SIZE_ALLOCATE_CALLBACK
		do
			create size_allocate_callback.make
			size_allocate_callback.connect (Current, a_procedure)
		end

feature {ANY} -- size-request signal

	size_request_signal_name: STRING is "size-request"
		-- "size-request"
		--             void        user_function      (GtkWidget      *widget,
		--                                             GtkRequisition *requisition,
		--                                             gpointer        user_data)        : Run first

	enable_on_size_request
			-- Connects "size-request" signal to `on_size_request' feature.
		do
			connect (Current, size_request_signal_name, $on_size_request)
		end

	on_size_request: INTEGER
			-- Built-in size-request signal handler; empty by design; redefine it.

			-- The `size-request' signal is emitted if a user requests that a
			-- toplevel window is closed. The default handler for this signal
			-- destroys the window.
			-- finish with "Result := 1" to stop other handlers.
		do
		end

	connect_agent_to_size_request_signal (a_procedure: PROCEDURE[ANY, TUPLE [GTK_REQUISITION, GTK_WIDGET]])
		require
			valid_procedure: a_procedure /= Void
			wrapper_is_stored: is_eiffel_wrapper_stored
		local
			size_request_callback: SIZE_REQUEST_CALLBACK
		do
			create size_request_callback.make
			size_request_callback.connect (Current, a_procedure)
		end

-- "state-changed"
--             void        user_function      (GtkWidget   *widget,
--                                             GtkStateType state,
--                                             gpointer     user_data)      : Run first
-- "style-set" void        user_function      (GtkWidget *widget,
--                                             GtkStyle  *previous_style,
--                                             gpointer   user_data)           : Run first
-- "unmap"     void        user_function      (GtkWidget *widget,
--                                             gpointer   user_data)      : Run first
-- "unmap-event"
--             gboolean    user_function      (GtkWidget *widget,
--                                             GdkEvent  *event,
--                                             gpointer   user_data)      : Run last
-- "unrealize" void        user_function      (GtkWidget *widget,
--                                             gpointer   user_data)      : Run last
-- "visibility-notify-event"
--             gboolean    user_function      (GtkWidget          *widget,
--                                             GdkEventVisibility *event,
--                                             gpointer            user_data)      : Run last
-- "window-state-event"
--             gboolean    user_function      (GtkWidget           *widget,
--                                             GdkEventWindowState *event,
--                                             gpointer             user_data)      : Run last

-- Description

-- GtkWidget introduces style properties - these are basically object properties that are stored not on the object, but in the style object associated to the widget. Style properties are set in resource files. This mechanism is used for configuring such things as the location of the scrollbar arrows through the theme, giving theme authors more control over the look of applications without the need to write a theme engine in C.

-- Use gtk_widget_class_install_style_property() to install style properties for a widget class, gtk_widget_class_find_style_property() or gtk_widget_class_list_style_properties() to get information about existing style properties and gtk_widget_style_get_property(), gtk_widget_style_get() or gtk_widget_style_get_valist() to obtain the value of a style property.
-- Details
-- GtkWidget

-- typedef struct {
--   /* The style for the widget. The style contains the
--    *  colors the widget should be drawn in for each state
--    *  along with graphics contexts used to draw with and
--    *  the font to use for text.
--    */
--   GtkStyle *style;
  
--   /* The widget's desired size.
--    */
--   GtkRequisition requisition;

	allocation: GTK_ALLOCATION
			-- The widget's allocated size.
		do
			create Result.copy_from_pointer (gtk_widget_get_allocation (handle))
		end
 
--   /* The widget's window or its parent window if it does
--    *  not have a window. (Which will be indicated by the
--    *  GTK_NO_WINDOW flag being set).
--    */
--   GdkWindow *window;
  
--   /* The widget's parent.
--    */
--   GtkWidget *parent;
-- } GtkWidget;

-- GtkStyle *style; 	The style for the widget. The style contains the colors the widget should be drawn in for each state along with graphics contexts used to draw with and the font to use for text.
-- GtkRequisition requisition; 	The widget's desired size.
-- GtkAllocation allocation; 	The widget's allocated size.
-- GdkWindow *window; 	The widget's window or its parent window if it does not have a window. (Which will be indicated by the GTK_NO_WINDOW flag being set).
-- GtkWidget *parent; 	
-- GtkWidgetClass

-- typedef struct {
--   /* The object class structure needs to be the first
--    *  element in the widget class structure in order for
--    *  the class mechanism to work correctly. This allows a
--    *  GtkWidgetClass pointer to be cast to a GtkObjectClass
--    *  pointer.
--    */
--   GtkObjectClass parent_class;

  
--   guint activate_signal;

--   guint set_scroll_adjustments_signal;
-- } GtkWidgetClass;

-- activate_signal The signal to emit when a widget of this class is activated, gtk_widget_activate() handles the emission. Implementation of this signal is optional.

-- set_scroll_adjustment_signal This signal is emitted when a widget of this class is added to a scrolling aware parent, gtk_widget_set_scroll_adjustments() handles the emission. Implementation of this signal is optional.
-- enum GtkWidgetFlags

-- typedef enum
-- {
--   GTK_TOPLEVEL         = 1 < < 4,
--   GTK_NO_WINDOW        = 1 < < 5,
--   GTK_REALIZED         = 1 < < 6,
--   GTK_MAPPED           = 1 < < 7,
--   GTK_VISIBLE          = 1 < < 8,
--   GTK_SENSITIVE        = 1 < < 9,
--   GTK_PARENT_SENSITIVE = 1 < < 10,
--   GTK_CAN_FOCUS        = 1 < < 11,
--   GTK_HAS_FOCUS        = 1 < < 12,

--   /* widget is allowed to receive the default via gtk_widget_grab_default
--    * and will reserve space to draw the default if possible
--    */
--   GTK_CAN_DEFAULT      = 1 < < 13,

--   /* the widget currently is receiving the default action and should be drawn
--    * appropriately if possible
--    */
--   GTK_HAS_DEFAULT      = 1 < < 14,

--   GTK_HAS_GRAB	       = 1 < < 15,
--   GTK_RC_STYLE	       = 1 < < 16,
--   GTK_COMPOSITE_CHILD  = 1 < < 17,
--   GTK_NO_REPARENT      = 1 < < 18,
--   GTK_APP_PAINTABLE    = 1 < < 19,

--   /* the widget when focused will receive the default action and have
--    * HAS_DEFAULT set even if there is a different widget set as default
--    */
--   GTK_RECEIVES_DEFAULT = 1 < < 20,

--   GTK_DOUBLE_BUFFERED  = 1 < < 21,
--   GTK_NO_SHOW_ALL      = 1 < < 22
-- } GtkWidgetFlags;

-- Tells about certain properties of the widget.
-- GTK_TOPLEVEL 	widgets without a real parent, as there are GtkWindows and GtkMenus have this flag set throughout their lifetime. Toplevel widgets always contain their own GdkWindow.
-- GTK_NO_WINDOW 	Indicative for a widget that does not provide its own GdkWindow. Visible action (e.g. drawing) is performed on the parent's GdkWindow.
-- GTK_REALIZED 	Set by gtk_widget_realize(), unset by gtk_widget_unrealize(). A realized widget has an associated GdkWindow.
-- GTK_MAPPED 	Set by gtk_widget_map(), unset by gtk_widget_unmap(). Only realized widgets can be mapped. It means that gdk_window_show() has been called on the widgets window(s).
-- GTK_VISIBLE 	Set by gtk_widget_show(), unset by gtk_widget_hide(). Implies that a widget will be mapped as soon as its parent is mapped.
-- GTK_SENSITIVE 	Set and unset by gtk_widget_set_sensitive(). The sensitivity of a widget determines whether it will receive certain events (e.g. button or key presses). One premise for the widget's sensitivity is to have this flag set.
-- GTK_PARENT_SENSITIVE 	Set and unset by gtk_widget_set_sensitive() operations on the parents of the widget. This is the second premise for the widget's sensitivity. Once it has GTK_SENSITIVE and GTK_PARENT_SENSITIVE set, its state is effectively sensitive. This is expressed (and can be examined) by the GTK_WIDGET_IS_SENSITIVE macro.
-- GTK_CAN_FOCUS 	Determines whether a widget is able to handle focus grabs.
-- GTK_HAS_FOCUS 	Set by gtk_widget_grab_focus() for widgets that also have GTK_CAN_FOCUS set. The flag will be unset once another widget grabs the focus.
-- GTK_CAN_DEFAULT 	The widget is allowed to receive the default action via gtk_widget_grab_default().
-- GTK_HAS_DEFAULT 	The widget currently is receiving the default action.
-- GTK_HAS_GRAB 	Set by gtk_grab_add(), unset by gtk_grab_remove(). It means that the widget is in the grab_widgets stack, and will be the preferred one for receiving events other than ones of cosmetic value.
-- GTK_RC_STYLE 	Indicates that the widget's style has been looked up through the rc mechanism. It does not imply that the widget actually had a style defined through the rc mechanism.
-- GTK_COMPOSITE_CHILD 	Indicates that the widget is a composite child of its parent; see gtk_widget_push_composite_child(), gtk_widget_pop_composite_child().
-- GTK_NO_REPARENT 	Unused since before GTK+ 1.2, will be removed in a future version.
-- GTK_APP_PAINTABLE 	Set and unset by gtk_widget_set_app_paintable(). Must be set on widgets whose window the application directly draws on, in order to keep GTK+ from overwriting the drawn stuff.
-- GTK_RECEIVES_DEFAULT 	The widget when focused will receive the default action and have GTK_HAS_DEFAULT set even if there is a different widget set as default.
-- GTK_DOUBLE_BUFFERED 	Set and unset by gtk_widget_set_double_buffered(). Indicates that exposes done on the widget should be double-buffered.
-- GTK_NO_SHOW_ALL 	
-- GTK_WIDGET_TYPE()

-- #define GTK_WIDGET_TYPE(wid)		  (GTK_OBJECT_TYPE (wid))

-- Gets the type of a widget.
-- wid : 	a GtkWidget.
-- GTK_WIDGET_STATE()

-- #define GTK_WIDGET_STATE(wid)		  (GTK_WIDGET (wid)->state)

-- Returns the current state of the widget, as a GtkStateType.
-- wid : 	a GtkWidget.
-- GTK_WIDGET_SAVED_STATE()

-- #define GTK_WIDGET_SAVED_STATE(wid)	  (GTK_WIDGET (wid)->saved_state)

-- Returns the saved state of the widget, as a GtkStateType.

-- The saved state will be restored when a widget gets sensitive again, after it has been made insensitive with gtk_widget_set_state() or gtk_widget_set_sensitive().
-- wid : 	a GtkWidget.
-- GTK_WIDGET_FLAGS()

-- #define GTK_WIDGET_FLAGS(wid)		  (GTK_OBJECT_FLAGS (wid))

-- Returns the widget flags from wid.
-- wid : 	a GtkWidget.

	is_toplevel: BOOLEAN
			-- Evaluates to TRUE if the widget is a toplevel widget.
		do
			Result := gtk_widget_toplevel (handle).to_boolean
		end

-- wid : 	a GtkWidget.
-- GTK_WIDGET_NO_WINDOW()

-- #define GTK_WIDGET_NO_WINDOW(wid)	  ((GTK_WIDGET_FLAGS (wid) & GTK_NO_WINDOW) != 0)

-- Evaluates to TRUE if the widget doesn't have an own GdkWindow.
-- wid : 	a GtkWidget.

-- GTK_WIDGET_SENSITIVE()

-- #define GTK_WIDGET_SENSITIVE(wid)	  ((GTK_WIDGET_FLAGS (wid) & GTK_SENSITIVE) != 0)

-- Evaluates to TRUE if the GTK_SENSITIVE flag has be set on the widget.
-- wid : 	a GtkWidget.
-- GTK_WIDGET_PARENT_SENSITIVE()

-- #define GTK_WIDGET_PARENT_SENSITIVE(wid)  ((GTK_WIDGET_FLAGS (wid) & GTK_PARENT_SENSITIVE) != 0)

-- Evaluates to TRUE if the GTK_PARENT_SENSITIVE flag has be set on the widget.
-- wid : 	a GtkWidget.

	can_focus: BOOLEAN
			-- Is the widget able to handle focus grabs?
		do
			Result := gtk_widget_can_focus(handle).to_boolean
		end

-- GTK_WIDGET_HAS_FOCUS()

-- #define GTK_WIDGET_HAS_FOCUS(wid)	  ((GTK_WIDGET_FLAGS (wid) & GTK_HAS_FOCUS) != 0)

-- Evaluates to TRUE if the widget has grabbed the focus and no other widget has done so more recently.
-- wid : 	a GtkWidget.

	can_default: BOOLEAN
			-- Evaluates to TRUE if the widget is allowed to receive the 
			-- default action via `grab_default'.
		do
			Result := gtk_widget_can_default(handle).to_boolean
		end

-- GTK_WIDGET_RECEIVES_DEFAULT()

-- #define GTK_WIDGET_RECEIVES_DEFAULT(wid)  ((GTK_WIDGET_FLAGS (wid) & GTK_RECEIVES_DEFAULT) != 0)

-- Evaluates to TRUE if the widget when focused will receive the default action even if there is a different widget set as default.
-- wid : 	a GtkWidget.
-- GTK_WIDGET_HAS_DEFAULT()

-- #define GTK_WIDGET_HAS_DEFAULT(wid)	  ((GTK_WIDGET_FLAGS (wid) & GTK_HAS_DEFAULT) != 0)

-- Evaluates to TRUE if the widget currently is receiving the default action.
-- wid : 	a GtkWidget.
-- GTK_WIDGET_HAS_GRAB()

-- #define GTK_WIDGET_HAS_GRAB(wid)	  ((GTK_WIDGET_FLAGS (wid) & GTK_HAS_GRAB) != 0)

-- Evaluates to TRUE if the widget is in the grab_widgets stack, and will be the preferred one for receiving events other than ones of cosmetic value.
-- wid : 	a GtkWidget.
-- GTK_WIDGET_RC_STYLE()

-- #define GTK_WIDGET_RC_STYLE(wid)	  ((GTK_WIDGET_FLAGS (wid) & GTK_RC_STYLE) != 0)

-- Evaluates to TRUE if the widget's style has been looked up through the rc mechanism.
-- wid : 	a GtkWidget.
-- GTK_WIDGET_COMPOSITE_CHILD()

-- #define GTK_WIDGET_COMPOSITE_CHILD(wid)	  ((GTK_WIDGET_FLAGS (wid) & GTK_COMPOSITE_CHILD) != 0)

-- Evaluates to TRUE if the widget is a composite child of its parent.
-- wid : 	a GtkWidget.
-- GTK_WIDGET_APP_PAINTABLE()

-- #define GTK_WIDGET_APP_PAINTABLE(wid)	  ((GTK_WIDGET_FLAGS (wid) & GTK_APP_PAINTABLE) != 0)

-- Evaluates to TRUE if the GTK_APP_PAINTABLE flag has been set on the widget.
-- wid : 	a GtkWidget.
-- GTK_WIDGET_DOUBLE_BUFFERED()

-- #define GTK_WIDGET_DOUBLE_BUFFERED(wid)	  ((GTK_WIDGET_FLAGS (wid) & GTK_DOUBLE_BUFFERED) != 0)

-- Evaluates to TRUE if the GTK_DOUBLE_BUFFERED flag has been set on the widget.
-- wid : 	a GtkWidget.
-- GTK_WIDGET_SET_FLAGS()

-- #define GTK_WIDGET_SET_FLAGS(wid,flag)	  G_STMT_START{ (GTK_WIDGET_FLAGS (wid) |= (flag)); }G_STMT_END

-- Turns on certain widget flags.
-- wid : 	a GtkWidget.
-- flag : 	the flags to set.
-- GTK_WIDGET_UNSET_FLAGS()

-- #define GTK_WIDGET_UNSET_FLAGS(wid,flag)  G_STMT_START{ (GTK_WIDGET_FLAGS (wid) &= ~(flag)); }G_STMT_END

-- Turns off certain widget flags.
-- wid : 	a GtkWidget.
-- flag : 	the flags to unset.
-- GtkCallback ()

-- void        (*GtkCallback)                  (GtkWidget *widget,
--                                              gpointer data);

-- The type of the callback functions used for e.g. iterating over the children of a container, see gtk_container_foreach().
-- widget : 	the widget to operate on
-- data : 	user-supplied data
-- GtkRequisition

-- typedef struct {
--   gint width;
--   gint height;
-- } GtkRequisition;

-- A GtkRequisition represents the desired size of a widget. See the section called �ize Requisition�for more information.
-- gint width; 	the widget's desired width
-- gint height; 	the widget's desired height
-- struct GtkAllocation

-- struct GtkAllocation {
--   gint x;
--   gint y;
--   gint width;
--   gint height;
-- };

-- A GtkAllocation of a widget represents region which has been allocated to the widget by its parent. It is a subregion of its parents allocation. See the section called �ize Allocation�for more information.
-- gint x; 	the X position of the widget's area relative to its parents allocation.
-- gint y; 	the Y position of the widget's area relative to its parents allocation.
-- gint width; 	the width of the widget's allocated area.
-- gint height; 	the height of the widget's allocated area.
-- GtkSelectionData

-- typedef struct {
--   GdkAtom	selection;
--   GdkAtom	target;
--   GdkAtom	type;
--   gint		format;
--   guchar       *data;  
--   gint		length;
--   GdkDisplay   *display;
-- } GtkSelectionData;

-- GtkWidgetAuxInfo

-- typedef struct {
--   gint x;
--   gint y;
--   gint width;
--   gint height;
--   guint x_set : 1;
--   guint y_set : 1;
-- } GtkWidgetAuxInfo;

-- GtkWidgetShapeInfo

-- typedef struct {
--   gint16     offset_x;
--   gint16     offset_y;
--   GdkBitmap *shape_mask;
-- } GtkWidgetShapeInfo;

-- enum GtkWidgetHelpType

-- typedef enum
-- {
--   GTK_WIDGET_HELP_TOOLTIP,
--   GTK_WIDGET_HELP_WHATS_THIS
-- } GtkWidgetHelpType;

-- gtk_widget_new ()

-- GtkWidget*  gtk_widget_new                  (GType type,
--                                              const gchar *first_property_name,
--                                              ...);

-- This is a convenience function for creating a widget and setting its properties in one go. For example you might write: gtk_widget_new (GTK_TYPE_LABEL, "label", "Hello World", "xalign", 0.0, NULL) to create a left-aligned label. Equivalent to g_object_new(), but returns a widget so you don't have to cast the object yourself.

-- type : 	type ID of the widget to create
-- first_property_name : 	name of first property to set
-- ... : 	value of first property, followed by more properties, NULL-terminated
-- Returns : 	a new GtkWidget of type widget_type
-- gtk_widget_ref ()

-- GtkWidget*  gtk_widget_ref                  (GtkWidget *widget);

-- Adds a reference to a widget. This function is exactly the same as calling g_object_ref(), and exists mostly for historical reasons. It can still be convenient to avoid casting a widget to a GObject, it saves a small amount of typing.

-- widget : 	a GtkWidget
-- Returns : 	the widget that was referenced
-- gtk_widget_unref ()

-- void        gtk_widget_unref                (GtkWidget *widget);

-- Inverse of gtk_widget_ref(). Equivalent to g_object_unref().

-- widget : 	a GtkWidget
-- gtk_widget_destroy ()

-- void        gtk_widget_destroy              (GtkWidget *widget);

-- Destroys a widget. Equivalent to gtk_object_destroy(), except that you don't have to cast the widget to GtkObject. When a widget is destroyed, it will break any references it holds to other objects. If the widget is inside a container, the widget will be removed from the container. If the widget is a toplevel (derived from GtkWindow), it will be removed from the list of toplevels, and the reference GTK+ holds to it will be removed. Removing a widget from its container or the list of toplevels results in the widget being finalized, unless you've added additional references to the widget with g_object_ref().

-- In most cases, only toplevel widgets (windows) require explicit destruction, because when you destroy a toplevel its children will be destroyed as well.

-- widget : 	a GtkWidget
-- gtk_widget_destroyed ()

-- void        gtk_widget_destroyed            (GtkWidget *widget,
--                                              GtkWidget **widget_pointer);

-- This function sets *widget_pointer to NULL if widget_pointer != NULL. It's intended to be used as a callback connected to the "destroy" signal of a widget. You connect gtk_widget_destroyed() as a signal handler, and pass the address of your widget variable as user data. Then when the widget is destroyed, the variable will be set to NULL. Useful for example to avoid multiple copies of the same dialog.

-- widget : 	a GtkWidget
-- widget_pointer : 	address of a variable that contains widget
-- gtk_widget_set ()

-- void        gtk_widget_set                  (GtkWidget *widget,
--                                              const gchar *first_property_name,
--                                              ...);

-- Warning

-- gtk_widget_set is deprecated and should not be used in newly-written code.

-- Like g_object_set() - there's no reason to use this instead of g_object_set().

-- widget : 	a GtkWidget
-- first_property_name : 	name of first property to set
-- ... : 	value of first property, followed by more properties, NULL-terminated
-- gtk_widget_unparent ()

-- void        gtk_widget_unparent             (GtkWidget *widget);

-- This function is only for use in widget implementations. Should be called by implementations of the remove method on GtkContainer, to dissociate a child from the container.

-- widget : 	a GtkWidget
-- gtk_widget_show_now ()

-- void        gtk_widget_show_now             (GtkWidget *widget);

-- Shows a widget. If the widget is an unmapped toplevel widget (i.e. a GtkWindow that has not yet been shown), enter the main loop and wait for the window to actually be mapped. Be careful; because the main loop is running, anything can happen during this function.

-- widget : 	a GtkWidget

-- gtk_widget_hide_all ()

-- void        gtk_widget_hide_all             (GtkWidget *widget);

-- Recursively hides a widget and any child widgets.

-- widget : 	a GtkWidget

	map
			-- This function is only for use in widget implementations. Causes a
			-- widget to be mapped if it isn't already.
		require
			not is_mapped
		do
			gtk_widget_map (handle)
		end

	unmap
			-- This function is only for use in widget implementations. Causes a
			-- widget to be unmapped if it's currently mapped.
		require
			is_mapped
		do
			gtk_widget_unmap (handle)
		end

	queue_draw
			-- Equivalent to calling queue_draw_area for the entire area of a widget.
		do
			gtk_widget_queue_draw (handle)
		end

-- gtk_widget_queue_resize ()

-- void        gtk_widget_queue_resize         (GtkWidget *widget);

-- This function is only for use in widget implementations. Flags a widget to have its size renegotiated; should be called when a widget for some reason has a new size request. For example, when you change the text in a GtkLabel, GtkLabel queues a resize to ensure there's enough space for the new text.

-- widget : 	a GtkWidget
-- gtk_widget_queue_resize_no_redraw ()

-- void        gtk_widget_queue_resize_no_redraw
--                                             (GtkWidget *widget);

-- This function works like gtk_widget_queue_resize(), except that the widget is not invalidated.

-- widget : 	a GtkWidget

-- Since 2.4
-- gtk_widget_draw ()

-- void        gtk_widget_draw                 (GtkWidget *widget,
--                                              GdkRectangle *area);

-- Warning

-- gtk_widget_draw is deprecated and should not be used in newly-written code.

-- In GTK+ 1.2, this function would immediately render the region area of a widget, by invoking the virtual draw method of a widget. In GTK+ 2.0, the draw method is gone, and instead gtk_widget_draw() simply invalidates the specified region of the widget, then updates the invalid region of the widget immediately. Usually you don't want to update the region immediately for performance reasons, so in general gtk_widget_queue_draw_area() is a better choice if you want to draw a region of a widget.

-- widget : 	a GtkWidget
-- area : 	area to draw
-- gtk_widget_size_request ()

-- void        gtk_widget_size_request         (GtkWidget *widget,
--                                              GtkRequisition *requisition);

-- This function is typically used when implementing a GtkContainer subclass. Obtains the preferred size of a widget. The container uses this information to arrange its child widgets and decide what size allocations to give them with gtk_widget_size_allocate().

-- You can also call this function from an application, with some caveats. Most notably, getting a size request requires the widget to be associated with a screen, because font information may be needed. Multihead-aware applications should keep this in mind.

-- Also remember that the size request is not necessarily the size a widget will actually be allocated.

-- See also gtk_widget_get_child_requisition().

-- widget : 	a GtkWidget
-- requisition : 	a GtkRequisition to be filled in
-- gtk_widget_get_child_requisition ()

-- void        gtk_widget_get_child_requisition
--                                             (GtkWidget *widget,
--                                              GtkRequisition *requisition);

-- This function is only for use in widget implementations. Obtains widget->requisition, unless someone has forced a particular geometry on the widget (e.g. with gtk_widget_set_usize()), in which case it returns that geometry instead of the widget's requisition.

-- This function differs from gtk_widget_size_request() in that it retrieves the last size request value from widget->requisition, while gtk_widget_size_request() actually calls the "size_request" method on widget to compute the size request and fill in widget->requisition, and only then returns widget->requisition.

-- Because this function does not call the "size_request" method, it can only be used when you know that widget->requisition is up-to-date, that is, gtk_widget_size_request() has been called since the last time a resize was queued. In general, only container implementations have this information; applications should use gtk_widget_size_request().

-- widget : 	a GtkWidget
-- requisition : 	a GtkRequisition to be filled in
-- gtk_widget_size_allocate ()

-- void        gtk_widget_size_allocate        (GtkWidget *widget,
--                                              GtkAllocation *allocation);

-- This function is only used by GtkContainer subclasses, to assign a size and position to their child widgets.

-- widget : 	a GtkWidget
-- allocation : 	position and size to be allocated to widget
-- gtk_widget_add_accelerator ()

-- void        gtk_widget_add_accelerator      (GtkWidget *widget,
--                                              const gchar *accel_signal,
--                                              GtkAccelGroup *accel_group,
--                                              guint accel_key,
--                                              GdkModifierType accel_mods,
--                                              GtkAccelFlags accel_flags);

-- Installs an accelerator for this widget in accel_group that causes accel_signal to be emitted if the accelerator is activated. The accel_group needs to be added to the widget's toplevel via gtk_window_add_accel_group(), and the signal must be of type G_RUN_ACTION. Accelerators added through this function are not user changeable during runtime. If you want to support accelerators that can be changed by the user, use gtk_accel_map_add_entry() and gtk_widget_set_accel_path() or gtk_menu_item_set_accel_path() instead.

-- widget : 	widget to install an accelerator on
-- accel_signal : 	widget signal to emit on accelerator activation
-- accel_group : 	accel group for this widget, added to its toplevel
-- accel_key : 	GDK keyval of the accelerator
-- accel_mods : 	modifier key combination of the accelerator
-- accel_flags : 	flag accelerators, e.g. GTK_ACCEL_VISIBLE
-- gtk_widget_remove_accelerator ()

-- gboolean    gtk_widget_remove_accelerator   (GtkWidget *widget,
--                                              GtkAccelGroup *accel_group,
--                                              guint accel_key,
--                                              GdkModifierType accel_mods);

-- Removes an accelerator from widget, previously installed with gtk_widget_add_accelerator().

-- widget : 	widget to install an accelerator on
-- accel_group : 	accel group for this widget
-- accel_key : 	GDK keyval of the accelerator
-- accel_mods : 	modifier key combination of the accelerator
-- Returns : 	whether an accelerator was installed and could be removed
-- gtk_widget_set_accel_path ()

-- void        gtk_widget_set_accel_path       (GtkWidget *widget,
--                                              const gchar *accel_path,
--                                              GtkAccelGroup *accel_group);

-- Given an accelerator group, accel_group, and an accelerator path, accel_path, sets up an accelerator in accel_group so whenever the key binding that is defined for accel_path is pressed, widget will be activated. This removes any accelerators (for any accelerator group) installed by previous calls to gtk_widget_set_accel_path(). Associating accelerators with paths allows them to be modified by the user and the modifications to be saved for future use. (See gtk_accel_map_save().)

-- This function is a low level function that would most likely be used by a menu creation system like GtkItemFactory. If you use GtkItemFactory, setting up accelerator paths will be done automatically.

-- Even when you you aren't using GtkItemFactory, if you only want to set up accelerators on menu items gtk_menu_item_set_accel_path() provides a somewhat more convenient interface.

-- widget : 	a GtkWidget
-- accel_path : 	path used to look up the accelerator
-- accel_group : 	a GtkAccelGroup.
-- gtk_widget_list_accel_closures ()

-- GList*      gtk_widget_list_accel_closures  (GtkWidget *widget);

-- Lists the closures used by widget for accelerator group connections with gtk_accel_group_connect_by_path() or gtk_accel_group_connect(). The closures can be used to monitor accelerator changes on widget, by connecting to the ::accel_changed signal of the GtkAccelGroup of a closure which can be found out with gtk_accel_group_from_accel_closure().

-- widget : 	widget to list accelerator closures for
-- Returns : 	a newly allocated GList of closures
-- gtk_widget_can_activate_accel ()

-- gboolean    gtk_widget_can_activate_accel   (GtkWidget *widget,
--                                              guint signal_id);

-- Determines whether an accelerator that activates the signal identified by signal_id can currently be activated. This is done by emitting the GtkWidget::can-activate-accel signal on widget; if the signal isn't overridden by a handler or in a derived widget, then the default check is that the widget must be sensitive, and the widget and all its ancestors mapped.

-- widget : 	a GtkWidget
-- signal_id : 	the ID of a signal installed on widget
-- Returns : 	TRUE if the accelerator can be activated.

-- Since 2.4
-- gtk_widget_event ()

-- gboolean    gtk_widget_event                (GtkWidget *widget,
--                                              GdkEvent *event);

-- Rarely-used function. This function is used to emit the event signals on a widget (those signals should never be emitted without using this function to do so). If you want to synthesize an event though, don't use this function; instead, use gtk_main_do_event() so the event will behave as if it were in the event queue. Don't synthesize expose events; instead, use gdk_window_invalidate_rect() to invalidate a region of the window.

-- widget : 	a GtkWidget
-- event : 	a GdkEvent
-- Returns : 	return from the event signal emission (TRUE if the event was handled)
-- gtk_widget_activate ()

-- gboolean    gtk_widget_activate             (GtkWidget *widget);

-- For widgets that can be "activated" (buttons, menu items, etc.) this function activates them. Activation is what happens when you press Enter on a widget during key navigation. If widget isn't activatable, the function returns FALSE.

-- widget : 	a GtkWidget that's activatable
-- Returns : 	TRUE if the widget was activatable
-- gtk_widget_reparent ()

-- void        gtk_widget_reparent             (GtkWidget *widget,
--                                              GtkWidget *new_parent);

-- Moves a widget from one GtkContainer to another, handling reference count issues to avoid destroying the widget.

-- widget : 	a GtkWidget
-- new_parent : 	a GtkContainer to move the widget into
-- gtk_widget_intersect ()

-- gboolean    gtk_widget_intersect            (GtkWidget *widget,
--                                              GdkRectangle *area,
--                                              GdkRectangle *intersection);

-- Computes the intersection of a widget's area and area, storing the intersection in intersection, and returns TRUE if there was an intersection. intersection may be NULL if you're only interested in whether there was an intersection.

-- widget : 	a GtkWidget
-- area : 	a rectangle
-- intersection : 	rectangle to store intersection of widget and area
-- Returns : 	TRUE if there was an intersection
-- gtk_widget_is_focus ()

-- gboolean    gtk_widget_is_focus             (GtkWidget *widget);

-- Determines if the widget is the focus widget within its toplevel. (This does not mean that the HAS_FOCUS flag is necessarily set; HAS_FOCUS will only be set if the toplevel widget additionally has the global input focus.)

-- widget : 	a GtkWidget
-- Returns : 	TRUE if the widget is the focus widget.

-- gtk_widget_set_state ()

-- void        gtk_widget_set_state            (GtkWidget *widget,
--                                              GtkStateType state);

-- This function is for use in widget implementations. Sets the state of a widget (insensitive, prelighted, etc.) Usually you should set the state using wrapper functions such as gtk_widget_set_sensitive().

-- widget : 	a GtkWidget
-- state : 	new state for widget

feature {ANY} -- Sensitivity

	set_sensitive (sens: BOOLEAN)
			-- Sets the sensitivity of Current. A widget is sensitive
			-- if the user can interact with it. Insensitive widgets are
			-- "grayed out" and the user can't interact with them.
		do
			gtk_widget_set_sensitive (handle, sens.to_integer)
		end

-- 	set_sensitive is
-- 			-- Makes the widget sensitive. A widget is sensitive if the
-- 			-- user can interact with it. Insensitive widgets are "grayed
-- 			-- out" and the user can't interact with them. Insensitive
-- 			-- widgets are known as "inactive", "disabled", or "ghosted"
-- 			-- in some other toolkits.
-- 		do
-- 			gtk_widget_set_sensitive (handle, 1)
-- 		ensure sensitive: is_sensitive
-- 		end
-- 
-- 	unset_sensitive is
-- 			-- Makes the widget not sensitive. See `set_sensitive'.
-- 		do
-- 			gtk_widget_set_sensitive (handle, 0)
-- 		ensure unsensitive: not is_sensitive
-- 		end

feature {ANY}

-- gtk_widget_set_parent ()

-- void        gtk_widget_set_parent           (GtkWidget *widget,
--                                              GtkWidget *parent);

-- This function is useful only when implementing subclasses of GtkContainer. Sets the container as the parent of widget, and takes care of some details such as updating the state and style of the child to reflect its new location. The opposite function is gtk_widget_unparent().

-- widget : 	a GtkWidget
-- parent : 	parent container
-- gtk_widget_set_parent_window ()

-- void        gtk_widget_set_parent_window    (GtkWidget *widget,
--                                              GdkWindow *parent_window);

-- Sets a non default parent window for widget.

-- widget : 	a GtkWidget.
-- parent_window : 	the new parent window.

-- gtk_widget_set_uposition ()

-- void        gtk_widget_set_uposition        (GtkWidget *widget,
--                                              gint x,
--                                              gint y);

-- Warning

-- gtk_widget_set_uposition is deprecated and should not be used in newly-written code.

-- Sets the position of a widget. The funny "u" in the name comes from the "user position" hint specified by the X Window System, and exists for legacy reasons. This function doesn't work if a widget is inside a container; it's only really useful on GtkWindow.

-- Don't use this function to center dialogs over the main application window; most window managers will do the centering on your behalf if you call gtk_window_set_transient_for(), and it's really not possible to get the centering to work correctly in all cases from application code. But if you insist, use gtk_window_set_position() to set GTK_WIN_POS_CENTER_ON_PARENT, don't do the centering manually.

-- Note that although x and y can be individually unset, the position is not honoured unless both x and y are set.

-- widget : 	a GtkWidget
-- x : 	x position; -1 to unset x; -2 to leave x unchanged
-- y : 	y position; -1 to unset y; -2 to leave y unchanged
-- gtk_widget_set_usize ()

-- void        gtk_widget_set_usize            (GtkWidget *widget,
--                                              gint width,
--                                              gint height);

-- Warning

-- gtk_widget_set_usize is deprecated and should not be used in newly-written code.

-- Sets the minimum size of a widget; that is, the widget's size request will be width by height. You can use this function to force a widget to be either larger or smaller than it is. The strange "usize" name dates from the early days of GTK+, and derives from X Window System terminology. In many cases, gtk_window_set_default_size() is a better choice for toplevel windows than this function; setting the default size will still allow users to shrink the window. Setting the usize will force them to leave the window at least as large as the usize. When dealing with window sizes, gtk_window_set_geometry_hints() can be a useful function as well.

-- Note the inherent danger of setting any fixed size - themes, translations into other languages, different fonts, and user action can all change the appropriate size for a given widget. So, it's basically impossible to hardcode a size that will always be correct.

-- Deprecated: Use gtk_widget_set_size_request() instead.

-- widget : 	a GtkWidget
-- width : 	minimum width, or -1 to unset
-- height : 	minimum height, or -1 to unset
-- gtk_widget_set_events ()

-- void        gtk_widget_set_events           (GtkWidget *widget,
--                                              gint events);

-- Sets the event mask (see GdkEventMask) for a widget. The event mask determines which events a widget will receive. Keep in mind that different widgets have different default event masks, and by changing the event mask you may disrupt a widget's functionality, so be careful. This function must be called while a widget is unrealized. Consider gtk_widget_add_events() for widgets that are already realized, or if you want to preserve the existing event mask. This function can't be used with GTK_NO_WINDOW widgets; to get events on those widgets, place them inside a GtkEventBox and receive events on the event box.

-- widget : 	a GtkWidget
-- events : 	event mask
-- gtk_widget_add_events ()

-- void        gtk_widget_add_events           (GtkWidget *widget,
--                                              gint events);

-- Adds the events in the bitfield events to the event mask for widget. See gtk_widget_set_events() for details.

-- widget : 	a GtkWidget
-- events : 	an event mask, see GdkEventMask
-- gtk_widget_set_extension_events ()

-- void        gtk_widget_set_extension_events (GtkWidget *widget,
--                                              GdkExtensionMode mode);

-- Sets the extension events mask to mode. See GdkExtensionMode and gdk_input_set_extension_events().

-- widget : 	a GtkWidget
-- mode : 	bitfield of extension events to receive
-- gtk_widget_get_extension_events ()

-- GdkExtensionMode gtk_widget_get_extension_events
--                                             (GtkWidget *widget);

-- Retrieves the extension events the widget will receive; see gdk_input_set_extension_events().

-- widget : 	a GtkWidget
-- Returns : 	extension events for widget

	toplevel: GTK_WIDGET
		-- The topmost widget in the container hierarchy widget is a part of.
		-- If Current widget has no parent widgets, Result will be Current. 
		-- Note the difference in behavior vs. ancestor;
		-- ancestor (gtk_type_window) would return Void
		-- if widget wasn't inside a toplevel window, and if the window was
		-- inside a GTK_WINDOW-derived widget which was in turn inside the
		-- toplevel GTK_WINDOW. While the second case may seem unlikely, it
		-- actually happens when a GTK_PLUG is embedded inside a GtkSocket
		-- within the same application.

		-- To reliably find the toplevel GtkWindow, use
		-- toplevel and is_toplevel: 

		-- local a_widget: GTK_WIDGET
		-- do 
		-- 		a_widget := my_widget.toplevel
		-- 		if a_widget.is_toplevel then .... end
		local factory: G_OBJECT_EXPANDED_FACTORY [GTK_WIDGET]
		do
			-- No reference will be added to the returned widget;
			-- it should not be unreferenced.
			Result := factory.wrapper (gtk_widget_get_toplevel (handle))
		end

	ancestor (a_widget_type: like g_type): GTK_WIDGET
		-- The first ancestor of widget with type a_widget_type. For
		-- example, ancestor (gtk_type_box) gets the
		-- first GTK_BOX that's an ancestor of widget. See
		-- note about checking for a toplevel GtkWindow in the docs for
		-- gtk_widget_get_toplevel().

		-- Note that unlike gtk_widget_is_ancestor(), gtk_widget_get_ancestor() considers widget to be an ancestor of itself.

		-- widget : 	a GtkWidget
		-- widget_type : 	ancestor type
		-- Returns : 	the ancestor widget, or NULL if not found
	local factory: G_OBJECT_EXPANDED_FACTORY[GTK_WIDGET]
	do	
		-- No reference will be added to the returned widget; it should not be
		-- unreferenced.
		Result := factory.wrapper (gtk_widget_get_ancestor (handle, a_widget_type))
	end

	-- gtk_widget_get_colormap ()

	-- GdkColormap* gtk_widget_get_colormap        (GtkWidget *widget);

	-- Gets the colormap that will be used to render widget. No reference will be added to the returned colormap; it should not be unreferenced.

	-- widget : 	a GtkWidget
	-- Returns : 	the colormap used by widget
	-- gtk_widget_set_colormap ()

	-- void        gtk_widget_set_colormap         (GtkWidget *widget,
	--                                              GdkColormap *colormap);

	-- Sets the colormap for the widget to the given value. Widget must not have been previously realized. This probably should only be used from an init() function (i.e. from the constructor for the widget).

	-- widget : 	a GtkWidget
	-- colormap : 	a colormap
	-- gtk_widget_get_visual ()

	-- GdkVisual*  gtk_widget_get_visual           (GtkWidget *widget);

	-- Gets the visual that will be used to render widget.

	-- widget : 	a GtkWidget
	-- Returns : 	the visual for widget
	-- gtk_widget_get_events ()

	-- gint        gtk_widget_get_events           (GtkWidget *widget);

	-- Returns the event mask for the widget (a bitfield containing flags from the GdkEventMask enumeration). These are the events that the widget will receive.

	-- widget : 	a GtkWidget
	-- Returns : 	event mask for widget
	-- gtk_widget_get_pointer ()

	pointer_position: TUPLE[INTEGER, INTEGER]
		-- Obtains the location of the mouse pointer in widget coordinates.
		-- Widget coordinates are a bit odd; for historical reasons, they are
		-- defined as widget->window coordinates for widgets that are not
		-- GTK_NO_WINDOW widgets, and are relative to widget->allocation.x,
		-- widget->allocation.y for widgets that are GTK_NO_WINDOW widgets.
	local an_x, an_y: INTEGER 
	do
		gtk_widget_get_pointer (handle, $an_x, $an_y)
		create Result.make_2 (an_x,an_y)
	end
	
	
	is_contained_in (an_ancestor: GTK_WIDGET): BOOLEAN
			-- Is Current somewhere inside an_ancestor, possibly with
			-- intermediate containers? True if an_ancestor contains Current
			-- widget as a child, grandchild, great grandchild, etc.
		require ancestor_not_void: an_ancestor /= Void
			do
				Result := gtk_widget_is_ancestor
				(handle, an_ancestor.handle).to_boolean
			end


		-- widget : 	a GtkWidget
		-- ancestor : 	another GtkWidget
		-- gtk_widget_translate_coordinates ()

		-- gboolean    gtk_widget_translate_coordinates
		--                                             (GtkWidget *src_widget,
		--                                              GtkWidget *dest_widget,
		--                                              gint src_x,
		--                                              gint src_y,
		--                                              gint *dest_x,
		--                                              gint *dest_y);

		-- Translate coordinates relative to src_widget's allocation to coordinates relative to dest_widget's allocations. In order to perform this operation, both widgets must be realized, and must share a common toplevel.

		-- src_widget : 	a GtkWidget
		-- dest_widget : 	a GtkWidget
		-- src_x : 	X position relative to src_widget
		-- src_y : 	Y position relative to src_widget
		-- dest_x : 	location to store X position relative to dest_widget
		-- dest_y : 	location to store Y position relative to dest_widget
		-- Returns : 	FALSE if either widget was not realized, or there was no common ancestor. In this case, nothing is stored in *dest_x and *dest_y. Otherwise TRUE.
		-- gtk_widget_hide_on_delete ()

		-- gboolean    gtk_widget_hide_on_delete       (GtkWidget *widget);

		-- Utility function; intended to be connected to the "delete_event" signal on a GtkWindow. The function calls gtk_widget_hide() on its argument, then returns TRUE. If connected to "delete_event", the result is that clicking the close button for a window (on the window frame, top right corner usually) will hide but not destroy the window. By default, GTK+ destroys windows when "delete_event" is received.

		-- widget : 	a GtkWidget
		-- Returns : 	TRUE
		-- gtk_widget_set_rc_style()

		-- #define gtk_widget_set_rc_style(widget)          (gtk_widget_set_style (widget, NULL))

		-- Warning

		-- gtk_widget_set_rc_style is deprecated and should not be used in newly-written code.

		-- Equivalent to gtk_widget_set_style (widget, NULL).
		-- widget : 	a GtkWidget.
		-- gtk_widget_ensure_style ()

	-- void        gtk_widget_ensure_style         (GtkWidget *widget);

	-- Ensures that widget has a style (widget->style). Not a very useful function; most of the time, if you want the style, the widget is realized, and realized widgets are guaranteed to have a style already.

	-- widget : 	a GtkWidget
	-- gtk_widget_restore_default_style()

	-- #define gtk_widget_restore_default_style(widget) (gtk_widget_set_style (widget, NULL))

	-- Warning

	-- gtk_widget_restore_default_style is deprecated and should not be used in newly-written code.

	-- Equivalent to gtk_widget_set_style (widget, NULL).
	-- widget : 	a GtkWidget.
	-- gtk_widget_reset_rc_styles ()

	-- void        gtk_widget_reset_rc_styles      (GtkWidget *widget);

	-- Reset the styles of widget and all descendents, so when they are looked up again, they get the correct values for the currently loaded RC file settings.

	-- This function is not useful for applications.
	-- widget : 	a GtkWidget.
	-- gtk_widget_push_colormap ()

	-- void        gtk_widget_push_colormap        (GdkColormap *cmap);

	-- Pushes cmap onto a global stack of colormaps; the topmost colormap on the stack will be used to create all widgets. Remove cmap with gtk_widget_pop_colormap(). There's little reason to use this function.

	-- cmap : 	a GdkColormap
	-- gtk_widget_pop_colormap ()

	-- void        gtk_widget_pop_colormap         (void);

	-- Removes a colormap pushed with gtk_widget_push_colormap().

	-- gtk_widget_set_default_colormap ()

	-- void        gtk_widget_set_default_colormap (GdkColormap *colormap);

	-- Sets the default colormap to use when creating widgets. gtk_widget_push_colormap() is a better function to use if you only want to affect a few widgets, rather than all widgets.

	-- colormap : 	a GdkColormap
	-- gtk_widget_get_default_style ()

	-- GtkStyle*   gtk_widget_get_default_style    (void);

	-- Returns the default style used by all widgets initially.

	-- Returns : 	the default style. This GtkStyle object is owned by GTK+ and should not be modified or freed.
	-- gtk_widget_get_default_colormap ()

	-- GdkColormap* gtk_widget_get_default_colormap
	--                                             (void);

	-- Obtains the default colormap used to create widgets.

	-- Returns : 	default widget colormap
	-- gtk_widget_get_default_visual ()

	-- GdkVisual*  gtk_widget_get_default_visual   (void);

	-- Obtains the visual of the default colormap. Not really useful; used to be useful before gdk_colormap_get_visual() existed.

	-- Returns : 	visual of the default colormap
	-- gtk_widget_set_direction ()

	-- void        gtk_widget_set_direction        (GtkWidget *widget,
	--                                              GtkTextDirection dir);

	-- Sets the reading direction on a particular widget. This direction controls the primary direction for widgets containing text, and also the direction in which the children of a container are packed. The ability to set the direction is present in order so that correct localization into languages with right-to-left reading directions can be done. Generally, applications will let the default reading direction present, except for containers where the containers are arranged in an order that is explicitely visual rather than logical (such as buttons for text justification).

	-- If the direction is set to GTK_TEXT_DIR_NONE, then the value set by gtk_widget_set_default_direction() will be used.

	-- widget : 	a GtkWidget
	-- dir : 	the new direction
	-- enum GtkTextDirection

	-- typedef enum
	-- {
	--   GTK_TEXT_DIR_NONE,
	--   GTK_TEXT_DIR_LTR,
	--   GTK_TEXT_DIR_RTL
	-- } GtkTextDirection;

	-- gtk_widget_get_direction ()

	-- GtkTextDirection gtk_widget_get_direction   (GtkWidget *widget);

	-- Gets the reading direction for a particular widget. See gtk_widget_set_direction().

	-- widget : 	a GtkWidget
	-- Returns : 	the reading direction for the widget.
	-- gtk_widget_set_default_direction ()

	-- void        gtk_widget_set_default_direction
	--                                             (GtkTextDirection dir);

	-- Sets the default reading direction for widgets where the direction has not been explicitly set by gtk_widget_set_direction().

	-- dir : 	the new default direction. This cannot be GTK_TEXT_DIR_NONE.
	-- gtk_widget_get_default_direction ()

	-- GtkTextDirection gtk_widget_get_default_direction
	--                                             (void);

	-- Obtains the current default reading direction. See gtk_widget_set_default_direction().

	-- Returns : 	the current default direction.
	-- gtk_widget_shape_combine_mask ()

	-- void        gtk_widget_shape_combine_mask   (GtkWidget *widget,
	--                                              GdkBitmap *shape_mask,
	--                                              gint offset_x,
	--                                              gint offset_y);

	-- Sets a shape for this widget's GDK window. This allows for transparent windows etc., see gdk_window_shape_combine_mask() for more information.

	-- widget : 	a GtkWidget.
	-- shape_mask : 	shape to be added, or NULL to remove an existing shape.
	-- offset_x : 	X position of shape mask with respect to window.
	-- offset_y : 	Y position of shape mask with respect to window.
	-- gtk_widget_path ()

	-- void        gtk_widget_path                 (GtkWidget *widget,
	--                                              guint *path_length,
	--                                              gchar **path,
	--                                              gchar **path_reversed);

	-- Obtains the full path to widget. The path is simply the name of a widget and all its parents in the container hierarchy, separated by periods. The name of a widget comes from gtk_widget_get_name(). Paths are used to apply styles to a widget in gtkrc configuration files. Widget names are the type of the widget by default (e.g. "GtkButton") or can be set to an application-specific value with gtk_widget_set_name(). By setting the name of a widget, you allow users or theme authors to apply styles to that specific widget in their gtkrc file. path_reversed_p fills in the path in reverse order, i.e. starting with widget's name instead of starting with the name of widget's outermost ancestor.

	-- widget : 	a GtkWidget
	-- path_length : 	location to store length of the path, or NULL
	-- path : 	location to store allocated path string, or NULL
	-- path_reversed : 	location to store allocated reverse path string, or NULL
	-- gtk_widget_class_path ()

	-- void        gtk_widget_class_path           (GtkWidget *widget,
	--                                              guint *path_length,
	--                                              gchar **path,
	--                                              gchar **path_reversed);

	-- Same as gtk_widget_path(), but always uses the name of a widget's type, never uses a custom name set with gtk_widget_set_name().

	-- widget : 	a GtkWidget
	-- path_length : 	location to store the length of the class path, or NULL
	-- path : 	location to store the class path as an allocated string, or NULL
	-- path_reversed : 	location to store the reverse class path as an allocated string, or NULL
	-- gtk_widget_get_composite_name ()

	-- gchar*      gtk_widget_get_composite_name   (GtkWidget *widget);

	-- Obtains the composite name of a widget.

	-- widget : 	a GtkWidget.
	-- Returns : 	the composite name of widget, or NULL if widget is not a composite child. The string should not be freed when it is no longer needed.
	-- gtk_widget_modify_style ()

	-- void        gtk_widget_modify_style         (GtkWidget *widget,
	--                                              GtkRcStyle *style);

	-- Modifies style values on the widget. Modifications made using this technique take precedence over style values set via an RC file, however, they will be overriden if a style is explicitely set on the widget using gtk_widget_set_style(). The GtkRcStyle structure is designed so each field can either be set or unset, so it is possible, using this function, to modify some style values and leave the others unchanged.

	-- Note that modifications made with this function are not cumulative with previous calls to gtk_widget_modify_style() or with such functions as gtk_widget_modify_fg(). If you wish to retain previous values, you must first call gtk_widget_get_modifier_style(), make your modifications to the returned style, then call gtk_widget_modify_style() with that style. On the other hand, if you first call gtk_widget_modify_style(), subsequent calls to such functions gtk_widget_modify_fg() will have a cumulative effect with the initial modifications.

	-- widget : 	a GtkWidget
	-- style : 	the GtkRcStyle holding the style modifications
	-- gtk_widget_get_modifier_style ()

	-- GtkRcStyle* gtk_widget_get_modifier_style   (GtkWidget *widget);

	-- Returns the current modifier style for the widget. (As set by gtk_widget_modify_style().) If no style has previously set, a new GtkRcStyle will be created with all values unset, and set as the modifier style for the widget. If you make changes to this rc style, you must call gtk_widget_modify_style(), passing in the returned rc style, to make sure that your changes take effect.

	-- Caution: passing the style back to gtk_widget_modify_style() will normally end up destroying it, because gtk_widget_modify_style() copies the passed-in style and sets the copy as the new modifier style, thus dropping any reference to the old modifier style. Add a reference to the modifier style if you want to keep it alive.

	-- widget : 	a GtkWidget
	-- Returns : 	the modifier style for the widget. This rc style is owned by the widget. If you want to keep a pointer to value this around, you must add a refcount using gtk_rc_style_ref().
	-- gtk_widget_modify_fg ()

	-- void        gtk_widget_modify_fg            (GtkWidget *widget,
	--                                              GtkStateType state,
	--                                              const GdkColor *color);

	-- Sets the foreground color for a widget in a particular state. All other style values are left untouched. See also gtk_widget_modify_style().

	-- widget : 	a GtkWidget.
	-- state : 	the state for which to set the foreground color.
	-- color : 	the color to assign (does not need to be allocated), or NULL to undo the effect of previous calls to of gtk_widget_modify_fg().
	-- gtk_widget_modify_bg ()

	-- void        gtk_widget_modify_bg            (GtkWidget *widget,
	--                                              GtkStateType state,
	--                                              const GdkColor *color);

	-- Sets the background color for a widget in a particular state. All other style values are left untouched. See also gtk_widget_modify_style().

	-- Note that "no window" widgets (which have the GTK_NO_WINDOW flag set) draw on their parent container's window and thus may not draw any background themselves. This is the case for e.g. GtkLabel. To modify the background of such widgets, you have to set the background color on their parent; if you want to set the background of a rectangular area around a label, try placing the label in a GtkEventBox widget and setting the background color on that.

	-- widget : 	a GtkWidget.
	-- state : 	the state for which to set the background color.
	-- color : 	the color to assign (does not need to be allocated), or NULL to undo the effect of previous calls to of gtk_widget_modify_bg().
	-- gtk_widget_modify_text ()

	-- void        gtk_widget_modify_text          (GtkWidget *widget,
	--                                              GtkStateType state,
	--                                              const GdkColor *color);

	-- Sets the text color for a widget in a particular state. All other style values are left untouched. The text color is the foreground color used along with the base color (see gtk_widget_modify_base()) for widgets such as GtkEntry and GtkTextView. See also gtk_widget_modify_style().

	-- widget : 	a GtkWidget.
	-- state : 	the state for which to set the text color.
	-- color : 	the color to assign (does not need to be allocated), or NULL to undo the effect of previous calls to of gtk_widget_modify_text().
	-- gtk_widget_modify_base ()

	-- void        gtk_widget_modify_base          (GtkWidget *widget,
	--                                              GtkStateType state,
	--                                              const GdkColor *color);

	-- Sets the base color for a widget in a particular state. All other style values are left untouched. The base color is the background color used along with the text color (see gtk_widget_modify_text()) for widgets such as GtkEntry and GtkTextView. See also gtk_widget_modify_style().

	-- Note that "no window" widgets (which have the GTK_NO_WINDOW flag set) draw on their parent container's window and thus may not draw any background themselves. This is the case for e.g. GtkLabel. To modify the background of such widgets, you have to set the base color on their parent; if you want to set the background of a rectangular area around a label, try placing the label in a GtkEventBox widget and setting the base color on that.

	-- widget : 	a GtkWidget.
	-- state : 	the state for which to set the base color.
	-- color : 	the color to assign (does not need to be allocated), or NULL to undo the effect of previous calls to of gtk_widget_modify_base().
	-- gtk_widget_modify_font ()

	-- void        gtk_widget_modify_font          (GtkWidget *widget,
	--                                              PangoFontDescription *font_desc);

	-- Sets the font to use for a widget. All other style values are left untouched. See also gtk_widget_modify_style().

	-- widget : 	a GtkWidget
	-- font_desc : 	the font description to use, or NULL to undo the effect of previous calls to gtk_widget_modify_font().

	create_pango_context: PANGO_CONTEXT
		-- Creates a new PANGO_CONTEXT with the appropriate colormap,
		-- font description, and base direction for drawing text for
		-- this widget. See also pango_context.
	do
		create Result.from_external_pointer (gtk_widget_create_pango_context (handle))
	ensure
		Result /= Void
	end

	pango_context: PANGO_CONTEXT
		-- a PANGO_CONTEXT with the appropriate colormap, font description
		-- and base direction for this widget. Unlike the context returned
		-- by create_pango_context, this context is owned by the widget (it
		-- can be used until the screen for the widget changes or the
		-- widget is removed from its toplevel), and will be updated to
		-- match any changes to the widget's attributes.

		-- If you create and keep a PANGO_LAYOUT using this context, you
		-- must deal with changes to the context by calling context_changed
		-- on the layout in response to the ::style-set and
		-- ::direction-changed signals for the widget.
	local factory: G_OBJECT_EXPANDED_FACTORY [PANGO_CONTEXT]
	do
		Result := factory.wrapper (gtk_widget_get_pango_context (handle))
	end

	create_pango_layout (a_text: STRING): PANGO_LAYOUT
		-- Creates a new PANGO_LAYOUT with the appropriate colormap,
		-- font description, and base direction for drawing text for this
		-- widget.
		--
		-- If you keep a PANGO_LAYOUT created in this way around, in order
		-- notify the layout of changes to the base direction or font of
		-- this widget, you must call layout.context_changed in response
		-- to the ::style-set and ::direction-changed signals for the
		-- widget.
	do
		create Result.from_external_pointer
		(gtk_widget_create_pango_layout (handle, a_text.to_external))
	end

	-- gtk_widget_render_icon ()

	-- GdkPixbuf*  gtk_widget_render_icon          (GtkWidget *widget,
	--                                              const gchar *stock_id,
	--                                              GtkIconSize size,
	--                                              const gchar *detail);

	-- A convenience function that uses the theme engine and RC file settings for widget to look up stock_id and render it to a pixbuf. stock_id should be a stock icon ID such as GTK_STOCK_OPEN or GTK_STOCK_OK. size should be a size such as GTK_ICON_SIZE_MENU. detail should be a string that identifies the widget or code doing the rendering, so that theme engines can special-case rendering for that widget or code.

	-- The pixels in the returned GdkPixbuf are shared with the rest of the application and should not be modified. The pixbuf should be freed after use with g_object_unref().

	-- widget : 	a GtkWidget
	-- stock_id : 	a stock ID
	-- size : 	a stock size. A size of (GtkIconSize)-1 means render at the size of the source and don't scale (if there are multiple source sizes, GTK+ picks one of the available sizes).
	-- detail : 	render detail to pass to theme engine
	-- Returns : 	a new pixbuf, or NULL if the stock ID wasn't known
	-- gtk_widget_pop_composite_child ()

	-- void        gtk_widget_pop_composite_child  (void);

	-- Cancels the effect of a previous call to gtk_widget_push_composite_child().

	-- gtk_widget_push_composite_child ()

	-- void        gtk_widget_push_composite_child (void);

	-- Makes all newly-created widgets as composite children until the corresponding gtk_widget_pop_composite_child() call.

	-- A composite child is a child that's an implementation detail of the container it's inside and should not be visible to people using the container. Composite children aren't treated differently by GTK (but see gtk_container_foreach() vs. gtk_container_forall()), but e.g. GUI builders might want to treat them in a different way.

	-- Here is a simple example:

	--   gtk_widget_push_composite_child ();
	--   scrolled_window->hscrollbar = gtk_hscrollbar_new (hadjustment);
	--   gtk_widget_set_composite_name (scrolled_window->hscrollbar, "hscrollbar");
	--   gtk_widget_pop_composite_child ();
	--   gtk_widget_set_parent (scrolled_window->hscrollbar, 
	--                          GTK_WIDGET (scrolled_window));
	--   g_object_ref (scrolled_window->hscrollbar);

	-- gtk_widget_queue_clear ()

	-- void        gtk_widget_queue_clear          (GtkWidget *widget);

	-- Warning

	-- gtk_widget_queue_clear is deprecated and should not be used in newly-written code.

	-- This function does the same as gtk_widget_queue_draw().

	-- Deprecated: Use gtk_widget_queue_draw() instead.

	-- widget : 	a GtkWidget
	-- gtk_widget_queue_clear_area ()

	-- void        gtk_widget_queue_clear_area     (GtkWidget *widget,
	--                                              gint x,
	--                                              gint y,
	--                                              gint width,
	--                                              gint height);

	-- Warning

	-- gtk_widget_queue_clear_area is deprecated and should not be used in newly-written code.

	-- This function is no longer different from gtk_widget_queue_draw_area(), though it once was. Now it just calls gtk_widget_queue_draw_area(). Originally gtk_widget_queue_clear_area() would force a redraw of the background for GTK_NO_WINDOW widgets, and gtk_widget_queue_draw_area() would not. Now both functions ensure the background will be redrawn.

	-- Deprecated: Use gtk_widget_queue_draw_area() instead.

	-- widget : 	a GtkWidget
	-- x : 	x coordinate of upper-left corner of rectangle to redraw
	-- y : 	y coordinate of upper-left corner of rectangle to redraw
	-- width : 	width of region to draw
	-- height : 	height of region to draw
	-- gtk_widget_queue_draw_area ()

	-- void        gtk_widget_queue_draw_area      (GtkWidget *widget,
	--                                              gint x,
	--                                              gint y,
	--                                              gint width,
	--                                              gint height);

	-- Invalidates the rectangular area of widget defined by x, y, width and height by calling gdk_window_invalidate_rect() on the widget's window and all its child windows. Once the main loop becomes idle (after the current batch of events has been processed, roughly), the window will receive expose events for the union of all regions that have been invalidated.

	-- Normally you would only use this function in widget implementations. You might also use it, or gdk_window_invalidate_rect() directly, to schedule a redraw of a GtkDrawingArea or some portion thereof.

	-- Frequently you can just call gdk_window_invalidate_rect() or gdk_window_invalidate_region() instead of this function. Those functions will invalidate only a single window, instead of the widget and all its children.

	-- The advantage of adding to the invalidated region compared to simply drawing immediately is efficiency; using an invalid region ensures that you only have to redraw one time.

	-- widget : 	a GtkWidget
	-- x : 	x coordinate of upper-left corner of rectangle to redraw
	-- y : 	y coordinate of upper-left corner of rectangle to redraw
	-- width : 	width of region to draw
	-- height : 	height of region to draw
	-- gtk_widget_reset_shapes ()

	-- void        gtk_widget_reset_shapes         (GtkWidget *widget);

	-- Recursively resets the shape on this widget and its descendants.

	-- widget : 	a GtkWidget.
	-- gtk_widget_set_app_paintable ()

	-- void        gtk_widget_set_app_paintable    (GtkWidget *widget,
	--                                              gboolean app_paintable);

	-- Sets whether the application intends to draw on the widget in an ::expose-event handler.

	-- This is a hint to the widget and does not affect the behavior of the GTK+ core; many widgets ignore this flag entirely. For widgets that do pay attention to the flag, such as GtkEventBox and GtkWindow, the effect is to suppress default themed drawing of the widget's background. (Children of the widget will still be drawn.) The application is then entirely responsible for drawing the widget background.

	-- widget : 	a GtkWidget
	-- app_paintable : 	TRUE if the application will paint on the widget
	-- gtk_widget_set_double_buffered ()

	-- void        gtk_widget_set_double_buffered  (GtkWidget *widget,
	--                                              gboolean double_buffered);

	-- Widgets are double buffered by default; you can use this function to turn off the buffering. "Double buffered" simply means that gdk_window_begin_paint_region() and gdk_window_end_paint() are called automatically around expose events sent to the widget. gdk_window_begin_paint() diverts all drawing to a widget's window to an offscreen buffer, and gdk_window_end_paint() draws the buffer to the screen. The result is that users see the window update in one smooth step, and don't see individual graphics primitives being rendered.

	-- In very simple terms, double buffered widgets don't flicker, so you would only use this function to turn off double buffering if you had special needs and really knew what you were doing.

	-- Note: if you turn off double-buffering, you have to handle expose events, since even the clearing to the background color or pixmap will not happen automatically (as it is done in gdk_window_begin_paint()).

	-- widget : 	a GtkWidget
	-- double_buffered : 	TRUE to double-buffer a widget
	-- gtk_widget_set_redraw_on_allocate ()

	-- void        gtk_widget_set_redraw_on_allocate
	--                                             (GtkWidget *widget,
	--                                              gboolean redraw_on_allocate);

	-- Sets whether the entire widget is queued for drawing when its size allocation changes. By default, this setting is TRUE and the entire widget is redrawn on every size change. If your widget leaves the upper left unchanged when made bigger, turning this setting on will improve performance.

	-- Note that for NO_WINDOW widgets setting this flag to FALSE turns off all allocation on resizing: the widget will not even redraw if its position changes; this is to allow containers that don't draw anything to avoid excess invalidations. If you set this flag on a NO_WINDOW widget that does draw on widget->window, you are responsible for invalidating both the old and new allocation of the widget when the widget is moved and responsible for invalidating regions newly when the widget increases size.

	-- widget : 	a GtkWidget
	-- redraw_on_allocate : 	if TRUE, the entire widget will be redrawn when it is allocated to a new size. Otherwise, only the new portion of the widget will be redrawn.
	-- gtk_widget_set_composite_name ()

	-- void        gtk_widget_set_composite_name   (GtkWidget *widget,
	--                                              const gchar *name);

	-- Sets a widgets composite name. The widget must be a composite child of its parent; see gtk_widget_push_composite_child().

	-- widget : 	a GtkWidget.
	-- name : 	the name to set.
	-- gtk_widget_set_scroll_adjustments ()

	-- gboolean    gtk_widget_set_scroll_adjustments
	--                                             (GtkWidget *widget,
	--                                              GtkAdjustment *hadjustment,
	--                                              GtkAdjustment *vadjustment);

	-- For widgets that support scrolling, sets the scroll adjustments and returns TRUE. For widgets that don't support scrolling, does nothing and returns FALSE. Widgets that don't support scrolling can be scrolled by placing them in a GtkViewport, which does support scrolling.

	-- widget : 	a GtkWidget
	-- hadjustment : 	an adjustment for horizontal scrolling, or NULL
	-- vadjustment : 	an adjustment for vertical scrolling, or NULL
	-- Returns : 	TRUE if the widget supports scrolling
	-- gtk_widget_mnemonic_activate ()

	-- gboolean    gtk_widget_mnemonic_activate    (GtkWidget *widget,
	--                                              gboolean group_cycling);

	-- widget : 	
	-- group_cycling : 	
	-- Returns : 	
	-- gtk_widget_class_install_style_property ()

	-- void        gtk_widget_class_install_style_property
	--                                             (GtkWidgetClass *klass,
	--                                              GParamSpec *pspec);

	-- Installs a style property on a widget class. The parser for the style property is determined by the value type of pspec.

	-- klass : 	a GtkWidgetClass
	-- pspec : 	the GParamSpec for the property
	-- gtk_widget_class_install_style_property_parser ()

	-- void        gtk_widget_class_install_style_property_parser
	--                                             (GtkWidgetClass *klass,
	--                                              GParamSpec *pspec,
	--                                              GtkRcPropertyParser parser);

	-- Installs a style property on a widget class.

	-- klass : 	a GtkWidgetClass
	-- pspec : 	the GParamSpec for the style property
	-- parser : 	the parser for the style property
	-- gtk_widget_class_find_style_property ()

	-- GParamSpec* gtk_widget_class_find_style_property
	--                                             (GtkWidgetClass *klass,
	--                                              const gchar *property_name);

	-- Finds a style property of a widget class by name.

	-- klass : 	a GtkWidgetClass
	-- property_name : 	the name of the style property to find
	-- Returns : 	the GParamSpec of the style property or NULL if class has no style property with that name.

	-- Since 2.2
	-- gtk_widget_class_list_style_properties ()

	-- GParamSpec** gtk_widget_class_list_style_properties
	--                                             (GtkWidgetClass *klass,
	--                                              guint *n_properties);

	-- Returns all style properties of a widget class.

	-- klass : 	a GtkWidgetClass
	-- n_properties : 	location to return the number of style properties found
	-- Returns : 	an newly allocated array of GParamSpec*. The array must be freed with g_free().

	-- Since 2.2
	-- gtk_widget_region_intersect ()

	-- GdkRegion*  gtk_widget_region_intersect     (GtkWidget *widget,
	--                                              GdkRegion *region);

	-- Computes the intersection of a widget's area and region, returning the intersection. The result may be empty, use gdk_region_empty() to check.

	-- widget : 	a GtkWidget
	-- region : 	a GdkRegion, in the same coordinate system as widget->allocation. That is, relative to widget->window for NO_WINDOW widgets; relative to the parent window of widget->window for widgets with their own window.
	-- Returns : 	A newly allocated region holding the intersection of widget and region. The coordinates of the return value are relative to widget->window for NO_WINDOW widgets, and relative to the parent window of widget->window for widgets with their own window.
	-- gtk_widget_send_expose ()

	-- gint        gtk_widget_send_expose          (GtkWidget *widget,
	--                                              GdkEvent *event);

	-- Very rarely-used function. This function is used to emit an expose event signals on a widget. This function is not normally used directly. The only time it is used is when propagating an expose event to a child NO_WINDOW widget, and that is normally done using gtk_container_propagate_expose().

	-- If you want to force an area of a window to be redrawn, use gdk_window_invalidate_rect() or gdk_window_invalidate_region(). To cause the redraw to be done immediately, follow that call with a call to gdk_window_process_updates().

	-- widget : 	a GtkWidget
	-- event : 	a expose GdkEvent
	-- Returns : 	return from the event signal emission (TRUE if the event was handled)
	-- gtk_widget_style_get ()

	-- void        gtk_widget_style_get            (GtkWidget *widget,
	--                                              const gchar *first_property_name,
	--                                              ...);

	-- Gets the values of a multiple style properties of widget.

	-- widget : 	a GtkWidget
	-- first_property_name : 	the name of the first property to get
	-- ... : 	pairs of property names and locations to return the property values, starting with the location for first_property_name, terminated by NULL.
	-- gtk_widget_style_get_property ()

	-- void        gtk_widget_style_get_property   (GtkWidget *widget,
	--                                              const gchar *property_name,
	--                                              GValue *value);

	-- Gets the value of a style property of widget.

	-- widget : 	a GtkWidget
	-- property_name : 	the name of a style property
	-- value : 	location to return the property value
	-- gtk_widget_style_get_valist ()

	-- void        gtk_widget_style_get_valist     (GtkWidget *widget,
	--                                              const gchar *first_property_name,
	--                                              va_list var_args);

	-- Non-vararg variant of gtk_widget_style_get(). Used primarily by language bindings.

	-- widget : 	a GtkWidget
	-- first_property_name : 	the name of the first property to get
	-- var_args : 	a va_list of pairs of property names and locations to return the property values, starting with the location for first_property_name.
	-- gtk_widget_get_accessible ()

	-- AtkObject*  gtk_widget_get_accessible       (GtkWidget *widget);

	-- Returns the accessible object that describes the widget to an assistive technology.

	-- If no accessibility library is loaded (i.e. no ATK implementation library is loaded via GTK_MODULES or via another application library, such as libgnome), then this AtkObject instance may be a no-op. Likewise, if no class-specific AtkObject implementation is available for the widget instance in question, it will inherit an AtkObject implementation from the first ancestor class for which such an implementation is defined.

	-- The documentation of the ATK library contains more information about accessible objects and their uses.

	-- widget : 	a GtkWidget
	-- Returns : 	the AtkObject associated with widget
	-- gtk_widget_child_focus ()

	-- gboolean    gtk_widget_child_focus          (GtkWidget *widget,
	--                                              GtkDirectionType direction);

	-- This function is used by custom widget implementations; if you're writing an app, you'd use gtk_widget_grab_focus() to move the focus to a particular widget, and gtk_container_set_focus_chain() to change the focus tab order. So you may want to investigate those functions instead.

	-- gtk_widget_child_focus() is called by containers as the user moves around the window using keyboard shortcuts. direction indicates what kind of motion is taking place (up, down, left, right, tab forward, tab backward). gtk_widget_child_focus() invokes the "focus" signal on GtkWidget; widgets override the default handler for this signal in order to implement appropriate focus behavior.

	-- The "focus" default handler for a widget should return TRUE if moving in direction left the focus on a focusable location inside that widget, and FALSE if moving in direction moved the focus outside the widget. If returning TRUE, widgets normally call gtk_widget_grab_focus() to place the focus accordingly; if returning FALSE, they don't modify the current focus location.

	-- This function replaces gtk_container_focus() from GTK+ 1.2. It was necessary to check that the child was visible, sensitive, and focusable before calling gtk_container_focus(). gtk_widget_child_focus() returns FALSE if the widget is not currently in a focusable state, so there's no need for those checks.

	-- widget : 	a GtkWidget
	-- direction : 	direction of focus movement
	-- Returns : 	TRUE if focus ended up inside widget
	-- gtk_widget_child_notify ()

	-- void        gtk_widget_child_notify         (GtkWidget *widget,
	--                                              const gchar *child_property);

	-- Emits a "child-notify" signal for the child property child_property on widget.

	-- This is the analogue of g_object_notify() for child properties.

	-- widget : 	a GtkWidget
	-- child_property : 	the name of a child property installed on the class of widget's parent.
	-- gtk_widget_freeze_child_notify ()

	-- void        gtk_widget_freeze_child_notify  (GtkWidget *widget);

	-- Stops emission of "child-notify" signals on widget. The signals are queued until gtk_widget_thaw_child_notify() is called on widget.

	-- This is the analogue of g_object_freeze_notify() for child properties.

	-- widget : 	a GtkWidget
	-- gtk_widget_get_child_visible ()

	-- gboolean    gtk_widget_get_child_visible    (GtkWidget *widget);

	-- Gets the value set with gtk_widget_set_child_visible(). If you feel a need to use this function, your code probably needs reorganization.

	-- This function is only useful for container implementations and never should be called by an application.

	-- widget : 	a GtkWidget
	-- Returns : 	TRUE if the widget is mapped with the parent.

	parent: GTK_WIDGET
		-- Returns the parent container of widget, or Void if none.
	local
		factory: G_OBJECT_EXPANDED_FACTORY [GTK_WIDGET]
	do
		Result := factory.wrapper_or_void (gtk_widget_get_parent (handle))
	end

	-- gtk_widget_get_settings ()

	-- GtkSettings* gtk_widget_get_settings        (GtkWidget *widget);

	-- Gets the settings object holding the settings (global property settings, RC file information, etc) used for this widget.

	-- Note that this function can only be called when the GtkWidget is attached to a toplevel, since the settings object is specific to a particular GdkScreen.

	-- widget : 	a GtkWidget
	-- Returns : 	the relevant GtkSettings object
	-- gtk_widget_get_clipboard ()

	-- GtkClipboard* gtk_widget_get_clipboard      (GtkWidget *widget,
	--                                              GdkAtom selection);

	-- Returns the clipboard object for the given selection to be used with widget. widget must have a GdkDisplay associated with it, so must be attached to a toplevel window.

	-- widget : 	a GtkWidget
	-- selection : 	a GdkAtom which identifies the clipboard to use. GDK_SELECTION_CLIPBOARD gives the default clipboard. Another common value is GDK_SELECTION_PRIMARY, which gives the primary X selection.
	-- Returns : 	the appropriate clipboard object. If no clipboard already exists, a new one will be created. Once a clipboard object has been created, it is persistent for all time.

	-- Since 2.2
	-- gtk_widget_get_display ()

	-- GdkDisplay* gtk_widget_get_display          (GtkWidget *widget);

	-- Get the GdkDisplay for the toplevel window associated with this widget. This function can only be called after the widget has been added to a widget hierarchy with a GtkWindow at the top.

	-- In general, you should only create display specific resources when a widget has been realized, and you should free those resources when the widget is unrealized.

	-- widget : 	a GtkWidget
	-- Returns : 	the GdkDisplay for the toplevel for this widget.

	-- Since 2.2
	-- gtk_widget_get_root_window ()

	-- GdkWindow*  gtk_widget_get_root_window      (GtkWidget *widget);

	-- Get the root window where this widget is located. This function can only be called after the widget has been added to a widget heirarchy with GtkWindow at the top.

	-- The root window is useful for such purposes as creating a popup GdkWindow associated with the window. In general, you should only create display specific resources when a widget has been realized, and you should free those resources when the widget is unrealized.

	-- widget : 	a GtkWidget
	-- Returns : 	the GdkWindow root window for the toplevel for this widget.

	-- Since 2.2
	-- gtk_widget_get_screen ()

	-- GdkScreen*  gtk_widget_get_screen           (GtkWidget *widget);

	-- Get the GdkScreen from the toplevel window associated with this widget. This function can only be called after the widget has been added to a widget hierarchy with a GtkWindow at the top.

	-- In general, you should only create screen specific resources when a widget has been realized, and you should free those resources when the widget is unrealized.

	-- widget : 	a GtkWidget
	-- Returns : 	the GdkScreen for the toplevel for this widget.

	-- Since 2.2
	-- gtk_widget_has_screen ()

	-- gboolean    gtk_widget_has_screen           (GtkWidget *widget);

	-- Checks whether there is a GdkScreen is associated with this widget. All toplevel widgets have an associated screen, and all widgets added into a heirarchy with a toplevel window at the top.

	-- widget : 	a GtkWidget
	-- Returns : 	TRUE if there is a GdkScreen associcated with the widget.

	-- Since 2.2
	-- gtk_widget_get_size_request ()

	-- void        gtk_widget_get_size_request     (GtkWidget *widget,
	--                                              gint *width,
	--                                              gint *height);

	-- Gets the size request that was explicitly set for the widget using gtk_widget_set_size_request(). A value of -1 stored in width or height indicates that that dimension has not been set explicitly and the natural requisition of the widget will be used intead. See gtk_widget_set_size_request(). To get the size a widget will actually use, call gtk_widget_size_request() instead of this function.

	-- widget : 	a GtkWidget
	-- width : 	return location for width, or NULL
	-- height : 	return location for height, or NULL
	-- gtk_widget_pop_visual()

	-- #define gtk_widget_pop_visual()               ((void) 0)

	-- Warning

	-- gtk_widget_pop_visual is deprecated and should not be used in newly-written code.

	-- This function is deprecated; it does nothing.
	-- gtk_widget_push_visual()

	-- #define gtk_widget_push_visual(visual)        ((void) 0)

	-- Warning

	-- gtk_widget_push_visual is deprecated and should not be used in newly-written code.

	-- This function is deprecated; it does nothing.
	-- visual : 	
	-- gtk_widget_set_child_visible ()

	-- void        gtk_widget_set_child_visible    (GtkWidget *widget,
	--                                              gboolean is_visible);

	-- Sets whether widget should be mapped along with its when its parent is mapped and widget has been shown with gtk_widget_show().

	-- The child visibility can be set for widget before it is added to a container with gtk_widget_set_parent(), to avoid mapping children unnecessary before immediately unmapping them. However it will be reset to its default state of TRUE when the widget is removed from a container.

	-- Note that changing the child visibility of a widget does not queue a resize on the widget. Most of the time, the size of a widget is computed from all visible children, whether or not they are mapped. If this is not the case, the container can queue a resize itself.

	-- This function is only useful for container implementations and never should be called by an application.

	-- widget : 	a GtkWidget
	-- is_visible : 	if TRUE, widget should be mapped along with its parent.
	-- gtk_widget_set_default_visual()

	-- #define gtk_widget_set_default_visual(visual) ((void) 0)

	-- Warning

	-- gtk_widget_set_default_visual is deprecated and should not be used in newly-written code.

	-- This function is deprecated; it does nothing.
	-- visual : 	

	set_size_request (a_width, an_height: INTEGER)
	-- Sets the minimum size of a widget; that is, the widget's
	-- size request will be `a_width' by `an_height'. You can use
	-- this function to force a widget to be either larger or
	-- smaller than it normally would be.

	-- In most cases, `set_default_size' is a better choice for
	-- toplevel windows than this function; setting the default
	-- size will still allow users to shrink the window. Setting
	-- the size request will force them to leave the window at
	-- least as large as the size request. When dealing with
	-- window sizes, GTK_WINDOW's `set_geometry_hints' can be a
	-- useful function as well.

	-- Note the inherent danger of setting any fixed size -
	-- themes, translations into other languages, different
	-- fonts, and user action can all change the appropriate size
	-- for a given widget. So, it's basically impossible to
	-- hardcode a size that will always be correct.

	-- The size request of a widget is the smallest size a widget
	-- can accept while still functioning well and drawing itself
	-- correctly. However in some strange cases a widget may be
	-- allocated less than its requested size, and in many cases
	-- a widget may be allocated more space than it requested.

	-- If the size request in a given direction is -1 (unset),
	-- then the "natural" size request of the widget will be used
	-- instead.

	-- Widgets can't actually be allocated a size less than 1 by
	-- 1, but you can pass 0,0 to this function to mean "as small
	-- as possible."

	-- width : 	width widget should request, or -1 to unset
	-- height : 	height widget should request, or -1 to unset
require
	valid_width: a_width >= -1
	valid_height: an_height >= -1
do
	gtk_widget_set_size_request (handle, a_width, an_height);
end

size_request: TUPLE [INTEGER, INTEGER]
		local
			width, height: INTEGER
		do
			gtk_widget_get_size_request (handle, $width, $height)
			Result := [width, height]
		ensure
			Result /= Void
		end

		-- gtk_widget_set_visual()

		-- #define gtk_widget_set_visual(widget,visual)  ((void) 0)

		-- Warning

		-- gtk_widget_set_visual is deprecated and should not be used in newly-written code.

		-- This function is deprecated; it does nothing.
		-- widget : 	
		-- visual : 	
		-- gtk_widget_thaw_child_notify ()

		-- void        gtk_widget_thaw_child_notify    (GtkWidget *widget);

		-- Reverts the effect of a previous call to gtk_widget_freeze_child_notify(). This causes all queued "child-notify" signals on widget to be emitted.

		-- widget : 	a GtkWidget
		-- gtk_widget_set_no_show_all ()

		-- void        gtk_widget_set_no_show_all      (GtkWidget *widget,
		--                                              gboolean no_show_all);

		-- Sets the "no_show_all" property, which determines whether calls to gtk_widget_show_all() and gtk_widget_hide_all() will affect this widget.

		-- This is mostly for use in constructing widget hierarchies with externally controlled visibility, see GtkUIManager.

		-- widget : 	a GtkWidget
		-- no_show_all : 	the new value for the "no_show_all" property

		-- Since 2.4
		-- gtk_widget_get_no_show_all ()

		-- gboolean    gtk_widget_get_no_show_all      (GtkWidget *widget);

		-- Returns the current value of the "no_show_all" property, which determines whether calls to gtk_widget_show_all() and gtk_widget_hide_all() will affect this widget.

		-- widget : 	a GtkWidget
		-- Returns : 	the current value of the "no_show_all" property.

		-- Since 2.4
		-- gtk_widget_list_mnemonic_labels ()

		-- GList*      gtk_widget_list_mnemonic_labels (GtkWidget *widget);

		-- Returns a newly allocated list of the widgets, normally labels, for which this widget is a the target of a mnemonic (see for example, gtk_label_set_mnemonic_widget()).

		-- The widgets in the list are not individually referenced. If you want to iterate through the list and perform actions involving callbacks that might destroy the widgets, you must call g_list_foreach (result, (GFunc)g_object_ref, NULL) first, and then unref all the widgets afterwards.

		-- widget : 	a GtkWidget
		-- Returns : 	the list of mnemonic labels; free this list with g_list_free() when you are done with it.

		-- Since 2.4
		-- gtk_widget_add_mnemonic_label ()

		-- void        gtk_widget_add_mnemonic_label   (GtkWidget *widget,
		--                                              GtkWidget *label);

		-- Adds a widget to the list of mnemonic labels for this widget. (See gtk_widget_list_mnemonic_labels()). Note the list of mnemonic labels for the widget is cleared when the widget is destroyed, so the caller must make sure to update its internal state at this point as well, by using a connection to the ::destroy signal or a weak notifier.

		-- widget : 	a GtkWidget
		-- label : 	a GtkWidget that acts as a mnemonic label for widget.

		-- Since 2.4
		-- gtk_widget_remove_mnemonic_label ()

		-- void        gtk_widget_remove_mnemonic_label
		--                                             (GtkWidget *widget,
		--                                              GtkWidget *label);

		-- Removes a widget from the list of mnemonic labels for this widget. (See gtk_widget_list_mnemonic_labels()). The widget must have previously been added to the list with gtk_widget_add_mnemonic_label().

		-- widget : 	a GtkWidget
		-- label : 	a GtkWidget that was previously set as a mnemnic label for widget with gtk_widget_add_mnemonic_label().

		-- Since 2.4
		-- gtk_requisition_copy ()

		-- GtkRequisition* gtk_requisition_copy        (const GtkRequisition *requisition);

		-- Copies a GtkRequisition.

		-- requisition : 	a GtkRequisition.
		-- Returns : 	a copy of requisition.
		-- gtk_requisition_free ()

		-- void        gtk_requisition_free            (GtkRequisition *requisition);

		-- Frees a GtkRequisition.

		-- requisition : 	a GtkRequisition.
		-- Property Details
		-- The "app-paintable" property

		--   "app-paintable"        gboolean              : Read / Write

		-- Whether the application will paint directly on the widget.

		-- Default value: FALSE
		-- The "can-default" property

		--   "can-default"          gboolean              : Read / Write

		-- Whether the widget can be the default widget.

		-- Default value: FALSE
		-- The "can-focus" property

		--   "can-focus"            gboolean              : Read / Write

		-- Whether the widget can accept the input focus.

		-- Default value: FALSE
		-- The "composite-child" property

		--   "composite-child"      gboolean              : Read

		-- Whether the widget is part of a composite widget.

		-- Default value: FALSE
		-- The "events" property

		--   "events"               GdkEventMask          : Read / Write

		-- The event mask that decides what kind of GdkEvents this widget gets.

		-- Default value: GDK_STRUCTURE_MASK
		-- The "extension-events" property

		--   "extension-events"     GdkExtensionMode      : Read / Write

		-- The mask that decides what kind of extension events this widget gets.

		-- Default value: GDK_EXTENSION_EVENTS_NONE
		-- The "has-default" property

		--   "has-default"          gboolean              : Read / Write

		-- Whether the widget is the default widget.

		-- Default value: FALSE
		-- The "has-focus" property

		--   "has-focus"            gboolean              : Read / Write

		-- Whether the widget has the input focus.

		-- Default value: FALSE
		-- The "height-request" property

		--   "height-request"       gint                  : Read / Write

		-- Override for height request of the widget, or -1 if natural request should be used.

		-- Allowed values: >= -1

		-- Default value: -1
		-- The "is-focus" property

		--   "is-focus"             gboolean              : Read / Write

		-- Whether the widget is the focus widget within the toplevel.

		-- Default value: FALSE
		-- The "name" property

		--   "name"                 gchararray            : Read / Write

		-- The name of the widget.

		-- Default value: NULL
		-- The "no-show-all" property

		--   "no-show-all"          gboolean              : Read / Write

		-- Whether gtk_widget_show_all() should not affect this widget.

		-- Default value: FALSE
		-- The "parent" property

		--   "parent"               GtkContainer          : Read / Write

		-- The parent widget of this widget. Must be a Container widget.
		-- The "receives-default" property

		--   "receives-default"     gboolean              : Read / Write

		-- If TRUE, the widget will receive the default action when it is focused.

		-- Default value: FALSE
		-- The "sensitive" property

		--   "sensitive"            gboolean              : Read / Write

		-- Whether the widget responds to input.

		-- Default value: TRUE
		-- The "style" property

		--   "style"                GtkStyle              : Read / Write

		-- The style of the widget, which contains information about how it will look (colors etc).
		-- The "visible" property

		--   "visible"              gboolean              : Read / Write

		-- Whether the widget is visible.

		-- Default value: FALSE
		-- The "width-request" property

		--   "width-request"        gint                  : Read / Write

		-- Override for width request of the widget, or -1 if natural request should be used.

		-- Allowed values: >= -1

		-- Default value: -1
		-- Style Property Details
		-- The "cursor-aspect-ratio" style property

		--   "cursor-aspect-ratio"  gfloat                : Read

		-- Aspect ratio with which to draw insertion cursor.

		-- Allowed values: [0,1]

		-- Default value: 0.04
		-- The "cursor-color" style property

		--   "cursor-color"         GdkColor              : Read

		-- Color with which to draw insertion cursor.
		-- The "draw-border" style property

		--   "draw-border"          GtkBorder             : Read

		-- Size of areas outside the widget's allocation to draw.
		-- The "focus-line-pattern" style property

		--   "focus-line-pattern"   gchararray            : Read

		-- Dash pattern used to draw the focus indicator.

		-- Default value: "\001\001"
		-- The "focus-line-width" style property

		--   "focus-line-width"     gint                  : Read

		-- Width, in pixels, of the focus indicator line.

		-- Allowed values: >= 0

		-- Default value: 1
		-- The "focus-padding" style property

		--   "focus-padding"        gint                  : Read

		-- Width, in pixels, between focus indicator and the widget 'box'.

		-- Allowed values: >= 0

		-- Default value: 1
		-- The "interior-focus" style property

		--   "interior-focus"       gboolean              : Read

		-- Whether to draw the focus indicator inside widgets.

		-- Default value: TRUE
		-- The "secondary-cursor-color" style property

		--   "secondary-cursor-color" GdkColor              : Read

		-- Color with which to draw the secondary insertion cursor when editing mixed right-to-left and left-to-right text.
		-- Signal Details
		-- The "accel-closures-changed" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  gpointer   user_data)      : 

		-- widget : 	the object which received the signal.
		-- user_data : 	user data set when the signal handler was connected.
		-- The "can-activate-accel" signal

		-- gboolean    user_function                  (GtkWidget *widget,
		-- 														  guint      signal_id,
		-- 														  gpointer   user_data)      : Run last

		-- Determines whether an accelerator that activates the signal identified by signal_id can currently be activated. This signal is present to allow applications and derived widgets to override the default GtkWidget handling for determining whether an accelerator can be activated.

		-- widget : 	the object which received the signal
		-- signal_id : 	the ID of a signal installed on widget
		-- returns : 	TRUE if the signal can be activated.
		-- user_data : 	user data set when the signal handler was connected.
		-- The "child-notify" signal

		-- void        user_function                  (GtkWidget  *widget,
		-- 														  GParamSpec *pspec,
		-- 														  gpointer    user_data)      : Run first / No recursion / Has details / No hooks

		-- The ::child-notify signal is emitted for each child property that has changed on an object. The signal's detail holds the property name.

		-- widget : 	the object which received the signal.
		-- pspec : 	the GParamSpec of the changed child property.
		-- user_data : 	user data set when the signal handler was connected.
		-- The "client-event" signal

		-- gboolean    user_function                  (GtkWidget      *widget,
		-- 														  GdkEventClient *event,
		-- 														  gpointer        user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "configure-event" signal

		-- gboolean    user_function                  (GtkWidget         *widget,
		-- 														  GdkEventConfigure *event,
		-- 														  gpointer           user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "destroy-event" signal

		-- gboolean    user_function                  (GtkWidget *widget,
		-- 														  GdkEvent  *event,
		-- 														  gpointer   user_data)      : Run last

		-- The ::destroy-event signal is emitted when a GdkWindow is destroyed. You rarely get this signal, because most widgets disconnect themselves from their window before they destroy it, so no widget owns the window at destroy time.

		-- widget : 	the object which received the signal.
		-- event : 	the event which triggered this signal
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "direction-changed" signal

		-- void        user_function                  (GtkWidget       *widget,
		-- 														  GtkTextDirection arg1,
		-- 														  gpointer         user_data)      : Run first

		-- widget : 	the object which received the signal.
		-- arg1 : 	
		-- user_data : 	user data set when the signal handler was connected.

		-- The "event" signal

		-- gboolean    user_function                  (GtkWidget *widget,
		-- 														  GdkEvent  *event,
		-- 														  gpointer   user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.

		-- The "event-after" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  GdkEvent  *event,
		-- 														  gpointer   user_data)      : 

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.

		-- The "focus" signal

		-- gboolean    user_function                  (GtkWidget       *widget,
		-- 														  GtkDirectionType arg1,
		-- 														  gpointer         user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- arg1 : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "focus-in-event" signal

		-- gboolean    user_function                  (GtkWidget     *widget,
		-- 														  GdkEventFocus *event,
		-- 														  gpointer       user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "focus-out-event" signal

		-- gboolean    user_function                  (GtkWidget     *widget,
		-- 														  GdkEventFocus *event,
		-- 														  gpointer       user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "grab-broken-event" signal

		-- gboolean    user_function                  (GtkWidget *widget,
		-- 														  GdkEvent  *event,
		-- 														  gpointer   user_data)      : Run last

		-- Emitted when a pointer or keyboard grab on a window belonging to widget gets broken.

		-- On X11, this happens when the grab window becomes unviewable (i.e. it or one of its ancestors is unmapped), or if the same application grabs the pointer or keyboard again.

		-- widget : 	the object which received the signal
		-- event : 	the GdkEventGrabBroken event
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.

		-- Since 2.8
		-- The "grab-focus" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  gpointer   user_data)      : Run last / Action

		-- widget : 	the object which received the signal.
		-- user_data : 	user data set when the signal handler was connected.
		-- The "grab-notify" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  gboolean   arg1,
		-- 														  gpointer   user_data)      : Run first

		-- widget : 	the object which received the signal.
		-- arg1 : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- The "hide" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  gpointer   user_data)      : Run first

		-- widget : 	the object which received the signal.
		-- user_data : 	user data set when the signal handler was connected.
		-- The "hierarchy-changed" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  GtkWidget *widget2,
		-- 														  gpointer   user_data)      : Run last

		-- Emitted when there is a chance in the hierarchy to which a widget belong. More precisely, a widget is anchored when its toplevel ancestor is a GtkWindow. This signal is emitted when a widget changes from un-anchored to anchored or vice-versa.
		-- widget : 	the object which received the signal.
		-- widget2 : 	
		-- user_data : 	user data set when the signal handler was connected.

		-- The "key-press-event" signal

		-- gboolean    user_function                  (GtkWidget   *widget,
		-- 														  GdkEventKey *event,
		-- 														  gpointer     user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.

		-- The "key-release-event" signal

		-- gboolean    user_function                  (GtkWidget   *widget,
		-- 														  GdkEventKey *event,
		-- 														  gpointer     user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.

		-- The "map" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  gpointer   user_data)      : Run first

		-- widget : 	the object which received the signal.
		-- user_data : 	user data set when the signal handler was connected.
		-- The "map-event" signal

		-- gboolean    user_function                  (GtkWidget *widget,
		-- 														  GdkEvent  *event,
		-- 														  gpointer   user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "mnemonic-activate" signal

		-- gboolean    user_function                  (GtkWidget *widget,
		-- 														  gboolean   arg1,
		-- 														  gpointer   user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- arg1 : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	
		-- The "no-expose-event" signal

		-- gboolean    user_function                  (GtkWidget        *widget,
		-- 														  GdkEventNoExpose *event,
		-- 														  gpointer          user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "parent-set" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  GtkObject *old_parent,
		-- 														  gpointer   user_data)       : Run first

		-- widget : 	the object which received the signal.
		-- old_parent : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- The "popup-menu" signal

		-- gboolean    user_function                  (GtkWidget *widget,
		-- 														  gpointer   user_data)      : Run last / Action

		-- This signal gets emitted whenever a widget should pop up a context-sensitive menu. This usually happens through the standard key binding mechanism; by pressing a certain key while a widget is focused, the user can cause the widget to pop up a menu. For example, the GtkEntry widget creates a menu with clipboard commands. See the section called �mplement GtkWidget::popup_menu�for an example of how to use this signal.

		-- widget : 	the object which received the signal
		-- returns : 	TRUE if a menu was activated
		-- user_data : 	user data set when the signal handler was connected.
		-- The "property-notify-event" signal

		-- gboolean    user_function                  (GtkWidget        *widget,
		-- 														  GdkEventProperty *event,
		-- 														  gpointer          user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "proximity-in-event" signal

		-- gboolean    user_function                  (GtkWidget         *widget,
		-- 														  GdkEventProximity *event,
		-- 														  gpointer           user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "proximity-out-event" signal

		-- gboolean    user_function                  (GtkWidget         *widget,
		-- 														  GdkEventProximity *event,
		-- 														  gpointer           user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "realize" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  gpointer   user_data)      : Run first

		-- widget : 	the object which received the signal.
		-- user_data : 	user data set when the signal handler was connected.
		-- The "screen-changed" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  GdkScreen *arg1,
		-- 														  gpointer   user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- arg1 : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- The "scroll-event" signal

		-- gboolean    user_function                  (GtkWidget      *widget,
		-- 														  GdkEventScroll *event,
		-- 														  gpointer        user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "selection-clear-event" signal

		-- gboolean    user_function                  (GtkWidget         *widget,
		-- 														  GdkEventSelection *event,
		-- 														  gpointer           user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "selection-get" signal

		-- void        user_function                  (GtkWidget        *widget,
		-- 														  GtkSelectionData *data,
		-- 														  guint             info,
		-- 														  guint             time,
		-- 														  gpointer          user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- data : 	
		-- info : 	
		-- time : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- The "selection-notify-event" signal

		-- gboolean    user_function                  (GtkWidget         *widget,
		-- 														  GdkEventSelection *event,
		-- 														  gpointer           user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "selection-received" signal

		-- void        user_function                  (GtkWidget        *widget,
		-- 														  GtkSelectionData *data,
		-- 														  guint             time,
		-- 														  gpointer          user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- data : 	
		-- time : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- The "selection-request-event" signal

		-- gboolean    user_function                  (GtkWidget         *widget,
		-- 														  GdkEventSelection *event,
		-- 														  gpointer           user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "show" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  gpointer   user_data)      : Run first

		-- widget : 	the object which received the signal.
		-- user_data : 	user data set when the signal handler was connected.
		-- The "show-help" signal

		-- gboolean    user_function                  (GtkWidget        *widget,
		-- 														  GtkWidgetHelpType arg1,
		-- 														  gpointer          user_data)      : Run last / Action

		-- widget : 	the object which received the signal.
		-- arg1 : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	
		-- The "size-allocate" signal

		-- void        user_function                  (GtkWidget     *widget,
		-- 														  GtkAllocation *allocation,
		-- 														  gpointer       user_data)       : Run first

		-- widget : 	the object which received the signal.
		-- allocation : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- The "size-request" signal

		-- void        user_function                  (GtkWidget      *widget,
		-- 														  GtkRequisition *requisition,
		-- 														  gpointer        user_data)        : Run first

		-- widget : 	the object which received the signal.
		-- requisition : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- The "state-changed" signal

		-- void        user_function                  (GtkWidget   *widget,
		-- 														  GtkStateType state,
		-- 														  gpointer     user_data)      : Run first

		-- widget : 	the object which received the signal.
		-- state : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- The "style-set" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  GtkStyle  *previous_style,
		-- 														  gpointer   user_data)           : Run first

		-- The style-set signal is emitted when a new style has been set on a widget. Note that style-modifying functions like gtk_widget_modify_base() also cause this signal to be emitted.

		-- widget : 	the object on which the signal is emitted
		-- previous_style : 	the previous style, or NULL if the widget just got its initial style
		-- user_data : 	user data set when the signal handler was connected.
		-- The "unmap" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  gpointer   user_data)      : Run first

		-- widget : 	the object which received the signal.
		-- user_data : 	user data set when the signal handler was connected.
		-- The "unmap-event" signal

		-- gboolean    user_function                  (GtkWidget *widget,
		-- 														  GdkEvent  *event,
		-- 														  gpointer   user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "unrealize" signal

		-- void        user_function                  (GtkWidget *widget,
		-- 														  gpointer   user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- user_data : 	user data set when the signal handler was connected.
		-- The "visibility-notify-event" signal

		-- gboolean    user_function                  (GtkWidget          *widget,
		-- 														  GdkEventVisibility *event,
		-- 														  gpointer            user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.
		-- The "window-state-event" signal

		-- gboolean    user_function                  (GtkWidget           *widget,
		-- 														  GdkEventWindowState *event,
		-- 														  gpointer             user_data)      : Run last

		-- widget : 	the object which received the signal.
		-- event : 	
		-- user_data : 	user data set when the signal handler was connected.
		-- Returns : 	TRUE to stop other handlers from being invoked for the event. FALSE to propagate the event further.

	end
