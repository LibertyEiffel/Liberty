note
	description: "Extenarl calls for  GtkWidget"
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
	revision: "$REvision:$"

deferred class GTK_WIDGET_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

-- enum        GtkWidgetFlags;
-- #define     GTK_WIDGET_TYPE                 (wid)
-- #define     GTK_WIDGET_STATE                (wid)
-- #define     GTK_WIDGET_SAVED_STATE          (wid)
-- #define     GTK_WIDGET_FLAGS                (wid)

	gtk_widget_toplevel (a_widget: POINTER): INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIDGET_TOPLEVEL"
		end

-- #define     GTK_WIDGET_NO_WINDOW            (wid)

	gtk_widget_realized (a_widget: POINTER): INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIDGET_REALIZED"
		end

	gtk_widget_mapped (a_widget: POINTER): INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIDGET_MAPPED"
		end

	gtk_widget_visible (a_widget: POINTER): INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIDGET_VISIBLE"
		end

	gtk_widget_drawable (a_widget: POINTER): INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIDGET_DRAWABLE"
		end

-- #define     GTK_WIDGET_SENSITIVE            (wid)
-- #define     GTK_WIDGET_PARENT_SENSITIVE     (wid)
-- #define     GTK_WIDGET_IS_SENSITIVE         (wid)
	gtk_widget_can_focus (a_widget: POINTER): INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIDGET_CAN_FOCUS"
		end

-- #define     GTK_WIDGET_HAS_FOCUS            (wid)

	gtk_widget_can_default (a_widget: POINTER): INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIDGET_CAN_DEFAULT"
		end

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

-- TODO: GtkWidget*  gtk_widget_new                  (GType type,
--                                              const gchar *first_property_name,
--                                              ...);
	gtk_widget_ref (widget: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_unref (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_destroy (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_destroyed (widget,widget_pointer: POINTER)
			-- Note: C types are GtkWidget *widget, GtkWidget **widget_pointer
		external "C use <gtk/gtk.h>"
		end

	-- TODO: void gtk_widget_set (GtkWidget *widget, -- const gchar
	-- *first_property_name, -- ...)

	gtk_widget_unparent (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_show (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_show_now (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_hide (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_show_all (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_hide_all (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_map (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_unmap (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_realize (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_unrealize (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_queue_draw (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_queue_resize (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_queue_resize_no_redraw (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_draw (widget, gdkrectangle_area: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_size_request (widget, gtkrequisition: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_get_child_requisition (widget, gtkrequisition: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_size_allocate (widget, gtkallocation: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_get_allocation (widget: POINTER): POINTER
		external "C inline use <gtk/gtk.h>"
		alias "&(((GtkWidget *)$widget)->allocation)"
		end

	gtk_widget_add_accelerator (widget, char_accel_signal, gtkaccelgroup: POINTER;
	                            guint_accel_key, gdkmodifiertype, gtkaccelflags: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_drag_dest_set (widget: POINTER; a_flags: INTEGER; a_targets: POINTER; n_targets, an_actions: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_drag_source_set (widget: POINTER; a_modifier: INTEGER; a_targets: POINTER; n_targets, an_actions: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_drag_dest_add_text_targets (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_drag_dest_add_image_targets (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_drag_dest_add_uri_targets (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_drag_source_add_text_targets (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_drag_source_add_image_targets (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_drag_source_add_uri_targets (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_drag_source_set_icon_pixbuf (widget, a_pixbuf: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_drag_source_set_icon_stock  (widget, a_stock_id: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_drag_source_set_icon_name (widget, an_icon_name: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_set_events (widget: POINTER; some_events: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_add_events (widget: POINTER; some_events: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	-- TODO: gboolean gtk_widget_remove_accelerator (GtkWidget *widget,
	--                                              GtkAccelGroup
	--                                              *accel_group, guint
	--                                              accel_key,
	--                                              GdkModifierType
	--                                              accel_mods) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_set_accel_path (widget: POINTER,
--                                              const gchar *accel_path,
--                                              GtkAccelGroup *accel_group) is
--		external "C use <gtk/gtk.h>"
--		end

-- GList*      gtk_widget_list_accel_closures  (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_can_activate_accel   (GtkWidget *widget,
--                                              guint signal_id) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_event                (GtkWidget *widget,
--                                              GdkEvent *event) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_activate             (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_reparent (widget: POINTER,
--                                              GtkWidget *new_parent) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_intersect            (GtkWidget *widget,
--                                              GdkRectangle *area,
--                                              GdkRectangle *intersection) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_is_focus             (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

	gtk_widget_grab_focus (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_grab_default (widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_set_name (widget, a_name: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_get_name (widget: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

-- gtk_widget_set_state (widget: POINTER,
--                                              GtkStateType state) is
--		external "C use <gtk/gtk.h>"
--		end

	gtk_widget_set_sensitive (widget: POINTER; sens: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_is_sensitive (widget: POINTER): INTEGER
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIDGET_IS_SENSITIVE"
		end

-- gtk_widget_set_parent (widget: POINTER,
--                                              GtkWidget *parent) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_set_parent_window (widget: POINTER,
--                                              GdkWindow *parent_window) is
--		external "C use <gtk/gtk.h>"
--		end

	gtk_widget_get_window (widget: POINTER): POINTER
		external "C struct GtkWidget get window use <gtk/gtk.h>"
		end

	gtk_widget_get_parent_window (widget: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

-- gtk_widget_set_uposition (widget: POINTER,
--                                              gint x,
--                                              gint y) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_set_usize (widget: POINTER,
--                                              gint width,
--                                              gint height) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_set_events (widget: POINTER,
--                                              gint events) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_add_events (widget: POINTER,
--                                              gint events) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_set_extension_events (widget: POINTER,
--                                              GdkExtensionMode mode) is
--		external "C use <gtk/gtk.h>"
--		end

-- GdkExtensionMode gtk_widget_get_extension_events
--                                             (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

	gtk_widget_get_toplevel (a_widget: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

  gtk_widget_get_ancestor (a_widget: POINTER; a_widget_type: INTEGER): POINTER
		external "C use <gtk/gtk.h>"
		end

-- GdkColormap* gtk_widget_get_colormap        (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_set_colormap (widget: POINTER,
--                                              GdkColormap *colormap) is
--		external "C use <gtk/gtk.h>"
--		end

-- GdkVisual*  gtk_widget_get_visual           (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- gint        gtk_widget_get_events           (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

gtk_widget_get_pointer (widget, an_x, an_y: POINTER)
		external "C use <gtk/gtk.h>"
		end

gtk_widget_is_ancestor (a_widget, an_ancestor: POINTER): INTEGER
	external "C use <gtk/gtk.h>"
	end

-- gboolean    gtk_widget_translate_coordinates
--                                             (GtkWidget *src_widget,
--                                              GtkWidget *dest_widget,
--                                              gint src_x,
--                                              gint src_y,
--                                              gint *dest_x,
--                                              gint *dest_y) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_hide_on_delete       (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

	gtk_widget_set_style (widget, a_style: POINTER)
		external "C use <gtk/gtk.h>"
		end

-- #define     gtk_widget_set_rc_style         (widget)
-- gtk_widget_ensure_style (widget: POINTER) is
--		external "C use <gtk/gtk.h>"
--		end

	gtk_widget_get_style (widget: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

-- #define     gtk_widget_restore_default_style(widget)
-- gtk_widget_reset_rc_styles (widget: POINTER) is
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_widget_push_colormap        (GdkColormap *cmap) is
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_widget_pop_colormap         (void) is
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_widget_set_default_colormap (GdkColormap *colormap) is
--		external "C use <gtk/gtk.h>"
--		end

-- GtkStyle*   gtk_widget_get_default_style    (void) is
--		external "C use <gtk/gtk.h>"
--		end

-- GdkColormap* gtk_widget_get_default_colormap
--                                             (void) is
--		external "C use <gtk/gtk.h>"
--		end

-- GdkVisual*  gtk_widget_get_default_visual   (void) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_set_direction (widget: POINTER,
--                                              GtkTextDirection dir) is
--		external "C use <gtk/gtk.h>"
--		end

-- enum        GtkTextDirection;
-- GtkTextDirection gtk_widget_get_direction   (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_widget_set_default_direction
--                                             (GtkTextDirection dir) is
--		external "C use <gtk/gtk.h>"
--		end

-- GtkTextDirection gtk_widget_get_default_direction
--                                             (void) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_shape_combine_mask (widget: POINTER,
--                                              GdkBitmap *shape_mask,
--                                              gint offset_x,
--                                              gint offset_y) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_path (widget: POINTER,
--                                              guint *path_length,
--                                              gchar **path,
--                                              gchar **path_reversed) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_class_path (widget: POINTER,
--                                              guint *path_length,
--                                              gchar **path,
--                                              gchar **path_reversed) is
--		external "C use <gtk/gtk.h>"
--		end

-- gchar*      gtk_widget_get_composite_name   (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_modify_style (widget: POINTER,
--                                              GtkRcStyle *style) is
--		external "C use <gtk/gtk.h>"
--		end

-- GtkRcStyle* gtk_widget_get_modifier_style   (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_modify_fg (widget: POINTER,
--                                              GtkStateType state,
--                                              const GdkColor *color) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_modify_bg (widget: POINTER,
--                                              GtkStateType state,
--                                              const GdkColor *color) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_modify_text (widget: POINTER,
--                                              GtkStateType state,
--                                              const GdkColor *color) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_modify_base (widget: POINTER,
--                                              GtkStateType state,
--                                              const GdkColor *color) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_modify_font (widget: POINTER,
--                                              PangoFontDescription *font_desc) is
--		external "C use <gtk/gtk.h>"
--		end

	gtk_widget_create_pango_context (a_widget: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_get_pango_context  (a_widget: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_widget_create_pango_layout (a_widget, a_text: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

-- GdkPixbuf*  gtk_widget_render_icon          (GtkWidget *widget,
--                                              const gchar *stock_id,
--                                              GtkIconSize size,
--                                              const gchar *detail) is
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_widget_pop_composite_child  (void) is
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_widget_push_composite_child (void) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_queue_clear (widget: POINTER) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_queue_clear_area (widget: POINTER,
--                                              gint x,
--                                              gint y,
--                                              gint width,
--                                              gint height) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_queue_draw_area (widget: POINTER,
--                                              gint x,
--                                              gint y,
--                                              gint width,
--                                              gint height) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_reset_shapes (widget: POINTER) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_set_app_paintable (widget: POINTER,
--                                              gboolean app_paintable) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_set_double_buffered (widget: POINTER,
--                                              gboolean double_buffered) is
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_widget_set_redraw_on_allocate
--                                             (GtkWidget *widget,
--                                              gboolean redraw_on_allocate) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_set_composite_name (widget: POINTER,
--                                              const gchar *name) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_set_scroll_adjustments
--                                             (GtkWidget *widget,
--                                              GtkAdjustment *hadjustment,
--                                              GtkAdjustment *vadjustment) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_mnemonic_activate    (GtkWidget *widget,
--                                              gboolean group_cycling) is
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_widget_class_install_style_property
--                                             (GtkWidgetClass *klass,
--                                              GParamSpec *pspec) is
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_widget_class_install_style_property_parser
--                                             (GtkWidgetClass *klass,
--                                              GParamSpec *pspec,
--                                              GtkRcPropertyParser parser) is
--		external "C use <gtk/gtk.h>"
--		end

-- GParamSpec* gtk_widget_class_find_style_property
--                                             (GtkWidgetClass *klass,
--                                              const gchar *property_name) is
--		external "C use <gtk/gtk.h>"
--		end

-- GParamSpec** gtk_widget_class_list_style_properties
--                                             (GtkWidgetClass *klass,
--                                              guint *n_properties) is
--		external "C use <gtk/gtk.h>"
--		end

-- GdkRegion*  gtk_widget_region_intersect     (GtkWidget *widget,
--                                              GdkRegion *region) is
--		external "C use <gtk/gtk.h>"
--		end

-- gint        gtk_widget_send_expose          (GtkWidget *widget,
--                                              GdkEvent *event) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_style_get (widget: POINTER,
--                                              const gchar *first_property_name,
--                                              ...) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_style_get_property (widget: POINTER,
--                                              const gchar *property_name,
--                                              GValue *value) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_style_get_valist (widget: POINTER,
--                                              const gchar *first_property_name,
--                                              va_list var_args) is
--		external "C use <gtk/gtk.h>"
--		end

-- AtkObject*  gtk_widget_get_accessible       (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_child_focus          (GtkWidget *widget,
--                                              GtkDirectionType direction) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_child_notify (widget: POINTER,
--                                              const gchar *child_property) is
--		external "C use <gtk/gtk.h>"
--		end

-- gtk_widget_freeze_child_notify (widget: POINTER) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_get_child_visible    (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

	gtk_widget_get_parent (a_widget: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

-- GtkSettings* gtk_widget_get_settings        (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- GtkClipboard* gtk_widget_get_clipboard      (GtkWidget *widget,
--                                              GdkAtom selection) is
--		external "C use <gtk/gtk.h>"
--		end

-- GdkDisplay* gtk_widget_get_display          (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- GdkWindow*  gtk_widget_get_root_window      (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- GdkScreen*  gtk_widget_get_screen           (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_has_screen           (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

	gtk_widget_get_size_request (widget, width, height: POINTER)
		external "C use <gtk/gtk.h>"
		end

-- #define     gtk_widget_pop_visual           ()
-- #define     gtk_widget_push_visual          (visual)
-- gtk_widget_set_child_visible (widget: POINTER,
--                                              gboolean is_visible) is
--		external "C use <gtk/gtk.h>"
--		end

-- #define     gtk_widget_set_default_visual   (visual)
	gtk_widget_set_size_request (widget: POINTER; width, height: INTEGER)
		external "C use <gtk/gtk.h>"
		end

-- #define     gtk_widget_set_visual           (widget,visual)
--gtk_widget_thaw_child_notify (widget: POINTER) is
--		external "C use <gtk/gtk.h>"
--		end

--gtk_widget_set_no_show_all (widget: POINTER,
--                                              gboolean no_show_all) is
--		external "C use <gtk/gtk.h>"
--		end

-- gboolean    gtk_widget_get_no_show_all      (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

-- GList*      gtk_widget_list_mnemonic_labels (GtkWidget *widget) is
--		external "C use <gtk/gtk.h>"
--		end

--gtk_widget_add_mnemonic_label (widget: POINTER,
--                                              GtkWidget *label) is
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_widget_remove_mnemonic_label
--                                             (GtkWidget *widget,
--                                              GtkWidget *label) is
--		external "C use <gtk/gtk.h>"
--		end


-- GtkRequisition* gtk_requisition_copy        (const GtkRequisition *requisition) is
--		external "C use <gtk/gtk.h>"
--		end

-- void        gtk_requisition_free            (GtkRequisition *requisition) is
--		external "C use <gtk/gtk.h>"
--		end

end
