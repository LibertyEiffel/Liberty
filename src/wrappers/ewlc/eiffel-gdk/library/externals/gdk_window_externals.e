note
	description: "External calls for GdkWindow"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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
	revision: "$Revision:$"

deferred class GDK_WINDOW_EXTERNALS

inherit ANY undefine is_equal, copy end

--insert 
--  enum        GdkWindowType;
--  enum        GdkWindowClass;
--  enum        GdkWindowHints;
--              GdkGeometry;
--  enum        GdkGravity;
--  enum        GdkWindowEdge;
--  enum        GdkWindowTypeHint;
--              GdkWindowAttr;
--  enum        GdkWindowAttributesType;

feature {} -- External calls

	gdk_window_new (parent, attributes: POINTER; attributes_mask: INTEGER): POINTER
		external "C use <gdk/gdk.h>"
		end

	gdk_window_get_pointer (window, x_ptr, y_ptr, mask_ptr: POINTER): POINTER
		external "C use <gdk/gdk.h>"
		end

	gdk_window_set_cursor (window, cursor: POINTER)
		external "C use <gdk/gdk.h>"
		end

	gdk_window_get_children (window: POINTER): POINTER
			--  GList*      gdk_window_get_children         (GdkWindow *window);
		external "C use <gdk/gdk.h>"
		end

	gdk_window_get_position (a_handle, an_x_ptr, an_y_ptr: POINTER)
			--  void gdk_window_get_position (GdkWindow *window, gint *x,
			--  gint *y);
		external "C use <gdk/gdk.h>"
		end

--  #include <gdk/gdk.h>

--  void        gdk_window_destroy              (GdkWindow *window);
--  #define     gdk_window_ref
--  #define     gdk_window_unref
--  GdkWindowType gdk_window_get_window_type    (GdkWindow *window);
--  GdkWindow*  gdk_window_at_pointer           (gint *win_x,
--                                               gint *win_y);
--  void        gdk_window_show                 (GdkWindow *window);
--  void        gdk_window_show_unraised        (GdkWindow *window);
--  void        gdk_window_hide                 (GdkWindow *window);
--  gboolean    gdk_window_is_visible           (GdkWindow *window);
--  gboolean    gdk_window_is_viewable          (GdkWindow *window);
--  GdkWindowState gdk_window_get_state         (GdkWindow *window);
--  void        gdk_window_withdraw             (GdkWindow *window);
--  void        gdk_window_iconify              (GdkWindow *window);
--  void        gdk_window_deiconify            (GdkWindow *window);
--  void        gdk_window_stick                (GdkWindow *window);
--  void        gdk_window_unstick              (GdkWindow *window);
--  void        gdk_window_maximize             (GdkWindow *window);
--  void        gdk_window_unmaximize           (GdkWindow *window);
--  void        gdk_window_fullscreen           (GdkWindow *window);
--  void        gdk_window_unfullscreen         (GdkWindow *window);
--  void        gdk_window_set_keep_above       (GdkWindow *window,
--                                               gboolean setting);
--  void        gdk_window_set_keep_below       (GdkWindow *window,
--                                               gboolean setting);
--  void        gdk_window_move                 (GdkWindow *window,
--                                               gint x,
--                                               gint y);
--  void        gdk_window_resize               (GdkWindow *window,
--                                               gint width,
--                                               gint height);
--  void        gdk_window_move_resize          (GdkWindow *window,
--                                               gint x,
--                                               gint y,
--                                               gint width,
--                                               gint height);
--  void        gdk_window_scroll               (GdkWindow *window,
--                                               gint dx,
--                                               gint dy);
--  void        gdk_window_move_region          (GdkWindow *window,
--                                               GdkRegion *region,
--                                               gint dx,
--                                               gint dy);
--  void        gdk_window_reparent             (GdkWindow *window,
--                                               GdkWindow *new_parent,
--                                               gint x,
--                                               gint y);
--  void        gdk_window_clear                (GdkWindow *window);
--  void        gdk_window_clear_area           (GdkWindow *window,
--                                               gint x,
--                                               gint y,
--                                               gint width,
--                                               gint height);
--  void        gdk_window_clear_area_e         (GdkWindow *window,
--                                               gint x,
--                                               gint y,
--                                               gint width,
--                                               gint height);
--  #define     gdk_window_copy_area            (drawable,gc,x,y,source_drawable,source_x,source_y,width,height)
--  void        gdk_window_raise                (GdkWindow *window);
--  void        gdk_window_lower                (GdkWindow *window);
--  void        gdk_window_focus                (GdkWindow *window,
--                                               guint32 timestamp);
--  void        gdk_window_register_dnd         (GdkWindow *window);
--  void        gdk_window_begin_resize_drag    (GdkWindow *window,
--                                               GdkWindowEdge edge,
--                                               gint button,
--                                               gint root_x,
--                                               gint root_y,
--                                               guint32 timestamp);
--  void        gdk_window_begin_move_drag      (GdkWindow *window,
--                                               gint button,
--                                               gint root_x,
--                                               gint root_y,
--                                               guint32 timestamp);
--  void        gdk_window_constrain_size       (GdkGeometry *geometry,
--                                               guint flags,
--                                               gint width,
--                                               gint height,
--                                               gint *new_width,
--                                               gint *new_height);

--  void        gdk_window_begin_paint_rect     (GdkWindow *window,
--                                               GdkRectangle *rectangle);
--  void        gdk_window_begin_paint_region   (GdkWindow *window,
--                                               GdkRegion *region);
--  void        gdk_window_end_paint            (GdkWindow *window);

--  void        gdk_window_invalidate_rect      (GdkWindow *window,
--                                               GdkRectangle *rect,
--                                               gboolean invalidate_children);
--  void        gdk_window_invalidate_region    (GdkWindow *window,
--                                               GdkRegion *region,
--                                               gboolean invalidate_children);
--  void        gdk_window_invalidate_maybe_recurse
--                                              (GdkWindow *window,
--                                               GdkRegion *region,
--                                               gboolean (*child_func) (GdkWindow *, gpointer),
--                                               gpointer user_data);
--  GdkRegion*  gdk_window_get_update_area      (GdkWindow *window);
--  void        gdk_window_freeze_updates       (GdkWindow *window);
--  void        gdk_window_thaw_updates         (GdkWindow *window);
--  void        gdk_window_process_all_updates  (void);
--  void        gdk_window_process_updates      (GdkWindow *window,
--                                               gboolean update_children);
--  void        gdk_window_set_debug_updates    (gboolean setting);
--  void        gdk_window_get_internal_paint_info
--                                              (GdkWindow *window,
--                                               GdkDrawable **real_drawable,
--                                               gint *x_offset,
--                                               gint *y_offset);
--  void        gdk_window_enable_synchronized_configure
--                                              (GdkWindow *window);
--  void        gdk_window_configure_finished   (GdkWindow *window);

--  void        gdk_window_set_user_data        (GdkWindow *window,
--                                               gpointer user_data);
--  void        gdk_window_set_override_redirect
--                                              (GdkWindow *window,
--                                               gboolean override_redirect);
--  void        gdk_window_set_accept_focus     (GdkWindow *window,
--                                               gboolean accept_focus);
--  void        gdk_window_set_focus_on_map     (GdkWindow *window,
--                                               gboolean focus_on_map);
--  void        gdk_window_add_filter           (GdkWindow *window,
--                                               GdkFilterFunc function,
--                                               gpointer data);
--  void        gdk_window_remove_filter        (GdkWindow *window,
--                                               GdkFilterFunc function,
--                                               gpointer data);
--  GdkFilterReturn (*GdkFilterFunc)            (GdkXEvent *xevent,
--                                               GdkEvent *event,
--                                               gpointer data);
--  enum        GdkFilterReturn;
--  typedef     GdkXEvent;
--  void        gdk_window_shape_combine_mask   (GdkWindow *window,
--                                               GdkBitmap *mask,
--                                               gint x,
--                                               gint y);
--  void        gdk_window_shape_combine_region (GdkWindow *window,
--                                               GdkRegion *shape_region,
--                                               gint offset_x,
--                                               gint offset_y);
--  void        gdk_window_set_child_shapes     (GdkWindow *window);
--  void        gdk_window_merge_child_shapes   (GdkWindow *window);
--  void        gdk_window_input_shape_combine_mask
--                                              (GdkWindow *window,
--                                               GdkBitmap *mask,
--                                               gint x,
--                                               gint y);
--  void        gdk_window_input_shape_combine_region
--                                              (GdkWindow *window,
--                                               GdkRegion *shape_region,
--                                               gint offset_x,
--                                               gint offset_y);
--  void        gdk_window_set_child_input_shapes
--                                              (GdkWindow *window);
--  void        gdk_window_merge_child_input_shapes
--                                              (GdkWindow *window);
--  gboolean    gdk_window_set_static_gravities (GdkWindow *window,
--                                               gboolean use_static);
--  void        gdk_window_set_hints            (GdkWindow *window,
--                                               gint x,
--                                               gint y,
--                                               gint min_width,
--                                               gint min_height,
--                                               gint max_width,
--                                               gint max_height,
--                                               gint flags);
--  void        gdk_window_set_title            (GdkWindow *window,
--                                               const gchar *title);
--  void        gdk_window_set_background       (GdkWindow *window,
--                                               const GdkColor *color);
--  void        gdk_window_set_back_pixmap      (GdkWindow *window,
--                                               GdkPixmap *pixmap,
--                                               gboolean parent_relative);
--  #define     GDK_PARENT_RELATIVE
--  #define     gdk_window_set_colormap
--  void        gdk_window_get_user_data        (GdkWindow *window,
--                                               gpointer *data);
--  void        gdk_window_get_geometry         (GdkWindow *window,
--                                               gint *x,
--                                               gint *y,
--                                               gint *width,
--                                               gint *height,
--                                               gint *depth);
--  void        gdk_window_set_geometry_hints   (GdkWindow *window,
--                                               GdkGeometry *geometry,
--                                               GdkWindowHints geom_mask);
--  void        gdk_window_set_icon_list        (GdkWindow *window,
--                                               GList *pixbufs);
--  void        gdk_window_set_modal_hint       (GdkWindow *window,
--                                               gboolean modal);
--  void        gdk_window_set_type_hint        (GdkWindow *window,
--                                               GdkWindowTypeHint hint);
--  GdkWindowTypeHint gdk_window_get_type_hint  (GdkWindow *window);
--  void        gdk_window_set_skip_taskbar_hint
--                                              (GdkWindow *window,
--                                               gboolean skips_taskbar);
--  void        gdk_window_set_skip_pager_hint  (GdkWindow *window,
--                                               gboolean skips_pager);
--  void        gdk_window_set_urgency_hint     (GdkWindow *window,
--                                               gboolean urgent);

--  void        gdk_window_get_root_origin      (GdkWindow *window,
--                                               gint *x,
--                                               gint *y);
--  void        gdk_window_get_frame_extents    (GdkWindow *window,
--                                               GdkRectangle *rect);
--  #define     gdk_window_get_size
--  #define     gdk_window_get_visual
--  #define     gdk_window_get_colormap
--  #define     gdk_window_get_type
--  gint        gdk_window_get_origin           (GdkWindow *window,
--                                               gint *x,
--                                               gint *y);
--  gboolean    gdk_window_get_deskrelative_origin
--                                              (GdkWindow *window,
--                                               gint *x,
--                                               gint *y);
--  enum        GdkModifierType;
--  GdkWindow*  gdk_window_get_parent           (GdkWindow *window);
--  GdkWindow*  gdk_window_get_toplevel         (GdkWindow *window);

--  GList*      gdk_window_peek_children        (GdkWindow *window);
--  GdkEventMask gdk_window_get_events          (GdkWindow *window);
--  void        gdk_window_set_events           (GdkWindow *window,
--                                               GdkEventMask event_mask);
--  void        gdk_window_set_icon             (GdkWindow *window,
--                                               GdkWindow *icon_window,
--                                               GdkPixmap *pixmap,
--                                               GdkBitmap *mask);
--  void        gdk_window_set_icon_name        (GdkWindow *window,
--                                               const gchar *name);
--  void        gdk_window_set_transient_for    (GdkWindow *window,
--                                               GdkWindow *parent);
--  void        gdk_window_set_role             (GdkWindow *window,
--                                               const gchar *role);
--  void        gdk_window_set_group            (GdkWindow *window,
--                                               GdkWindow *leader);
--  GdkWindow*  gdk_window_get_group            (GdkWindow *window);
--  void        gdk_window_set_decorations      (GdkWindow *window,
--                                               GdkWMDecoration decorations);
--  gboolean    gdk_window_get_decorations      (GdkWindow *window,
--                                               GdkWMDecoration *decorations);
--  enum        GdkWMDecoration;
--  void        gdk_window_set_functions        (GdkWindow *window,
--                                               GdkWMFunction functions);
--  enum        GdkWMFunction;
--  GList*      gdk_window_get_toplevels        (void);
--  GdkWindow*  gdk_get_default_root_window     (void);

--              GdkPointerHooks;
--  GdkPointerHooks* gdk_set_pointer_hooks      (const GdkPointerHooks *new_hooks);

--    -------------------------------------------------------------------------------------------------------------

-- TODO: GdkGeometry struct

--  typedef struct {
--    gint min_width;
--    gint min_height;
--    gint max_width;
--    gint max_height;
--    gint base_width;
--    gint base_height;
--    gint width_inc;
--    gint height_inc;
--    gdouble min_aspect;
--    gdouble max_aspect;
--    GdkGravity win_gravity;
--  } GdkGeometry;

--    The GdkGeometry struct gives the window manager information about a window's geometry constraints. Normally
--    you would set these on the GTK+ level using gtk_window_set_geometry_hints(). GtkWindow then sets the hints on
--    the GdkWindow it creates.

--    gdk_window_set_geometry_hints() expects the hints to be fully valid already and simply passes them to the
--    window manager; in contrast, gtk_window_set_geometry_hints() performs some interpretation. For example,
--    GtkWindow will apply the hints to the geometry widget instead of the toplevel window, if you set a geometry
--    widget. Also, the min_width/min_height/max_width/max_height fields may be set to -1, and GtkWindow will
--    substitute the size request of the window or geometry widget. If the minimum size hint is not provided,
--    GtkWindow will use its requisition as the minimum size. If the minimum size is provided and a geometry widget
--    is set, GtkWindow will take the minimum size as the minimum size of the geometry widget rather than the
--    entire window. The base size is treated similarly.

--    The canonical use-case for gtk_window_set_geometry_hints() is to get a terminal widget to resize properly.
--    Here, the terminal text area should be the geometry widget; GtkWindow will then automatically set the base
--    size to the size of other widgets in the terminal window, such as the menubar and scrollbar. Then, the
--    width_inc and height_inc fields should be set to the size of one character in the terminal. Finally, the base
--    size should be set to the size of one character. The net effect is that the minimum size of the terminal will
--    have a 1x1 character terminal area, and only terminal sizes on the "character grid" will be allowed.

--    Here's an example of how the terminal example would be implemented, assuming a terminal area widget called
--    "terminal" and a toplevel window "toplevel":

--          GdkGeometry hints;

--          hints.base_width = terminal->char_width;
--          hints.base_height = terminal->char_height;
--          hints.min_width = terminal->char_width;
--          hints.min_height = terminal->char_height;
--          hints.width_inc = terminal->char_width;
--          hints.height_inc = terminal->char_height;

--          gtk_window_set_geometry_hints (GTK_WINDOW (toplevel),
--                                         GTK_WIDGET (terminal),
--                                         &hints,
--                                         GDK_HINT_RESIZE_INC |
--                                         GDK_HINT_MIN_SIZE |
--                                         GDK_HINT_BASE_SIZE);

--    The other useful fields are the min_aspect and max_aspect fields; these contain a width/height ratio as a
--    floating point number. If a geometry widget is set, the aspect applies to the geometry widget rather than the
--    entire window. The most common use of these hints is probably to set min_aspect and max_aspect to the same
--    value, thus forcing the window to keep a constant aspect ratio.

--    gint min_width;         minimum width of window (or -1 to use requisition, with GtkWindow only)
--    gint min_height;        minimum height of window (or -1 to use requisition, with GtkWindow only)
--    gint max_width;         maximum width of window (or -1 to use requisition, with GtkWindow only)
--    gint max_height;        maximum height of window (or -1 to use requisition, with GtkWindow only)
--    gint base_width;        allowed window widths are base_width + width_inc * N where N is any integer (-1
--                            allowed with GtkWindow)
--    gint base_height;       allowed window widths are base_height + height_inc * N where N is any integer (-1
--                            allowed with GtkWindow)
--    gint width_inc;         width resize increment
--    gint height_inc;        height resize increment
--    gdouble min_aspect;     minimum width/height ratio
--    gdouble max_aspect;     maximum width/height ratio
--    GdkGravity win_gravity; window gravity, see gtk_window_set_gravity()

	

--   enum GdkWindowTypeHint

--  typedef enum
--  {
--    GDK_WINDOW_TYPE_HINT_NORMAL,
--    GDK_WINDOW_TYPE_HINT_DIALOG,
--    GDK_WINDOW_TYPE_HINT_MENU,            /* Torn off menu */
--    GDK_WINDOW_TYPE_HINT_TOOLBAR,
--    GDK_WINDOW_TYPE_HINT_SPLASHSCREEN,
--    GDK_WINDOW_TYPE_HINT_UTILITY,
--    GDK_WINDOW_TYPE_HINT_DOCK,
--    GDK_WINDOW_TYPE_HINT_DESKTOP,
--    GDK_WINDOW_TYPE_HINT_DROPDOWN_MENU,   /* A drop down menu (from a menubar) */
--    GDK_WINDOW_TYPE_HINT_POPUP_MENU,      /* A popup menu (from right-click) */
--    GDK_WINDOW_TYPE_HINT_TOOLTIP,
--    GDK_WINDOW_TYPE_HINT_NOTIFICATION,
--    GDK_WINDOW_TYPE_HINT_COMBO,
--    GDK_WINDOW_TYPE_HINT_DND
--  } GdkWindowTypeHint;

--    These are hints for the window manager that indicate what type of function the window has. The window manager
--    can use this when determining decoration and behaviour of the window. The hint must be set before mapping the
--    window.

--    See the Extended Window Manager Hints specification for more details about window types.

--    GDK_WINDOW_TYPE_HINT_NORMAL        Normal toplevel window.
--    GDK_WINDOW_TYPE_HINT_DIALOG        Dialog window.
--    GDK_WINDOW_TYPE_HINT_MENU          Window used to implement a menu.
--    GDK_WINDOW_TYPE_HINT_TOOLBAR       Window used to implement toolbars.
--    GDK_WINDOW_TYPE_HINT_SPLASHSCREEN  Window used to display a splash screen during application startup.
--    GDK_WINDOW_TYPE_HINT_UTILITY       Utility windows which are not detached toolbars or dialogs.
--    GDK_WINDOW_TYPE_HINT_DOCK          Used for creating dock or panel windows.
--    GDK_WINDOW_TYPE_HINT_DESKTOP       Used for creating the desktop background window.
--    GDK_WINDOW_TYPE_HINT_DROPDOWN_MENU
--    GDK_WINDOW_TYPE_HINT_POPUP_MENU
--    GDK_WINDOW_TYPE_HINT_TOOLTIP
--    GDK_WINDOW_TYPE_HINT_NOTIFICATION
--    GDK_WINDOW_TYPE_HINT_COMBO
--    GDK_WINDOW_TYPE_HINT_DND

--    -------------------------------------------------------------------------------------------------------------

--   GdkWindowAttr

--  typedef struct {
--    gchar *title;
--    gint event_mask;
--    gint x, y;
--    gint width;
--    gint height;
--    GdkWindowClass wclass;
--    GdkVisual *visual;
--    GdkColormap *colormap;
--    GdkWindowType window_type;
--    GdkCursor *cursor;
--    gchar *wmclass_name;
--    gchar *wmclass_class;
--    gboolean override_redirect;
--  } GdkWindowAttr;

--    Attributes to use for a newly-created window.

--    gchar *title;               title of the window (for toplevel windows)
--    gint event_mask;            event mask (see gdk_window_set_events())
--    gint x;                     X coordinate relative to parent window (see gdk_window_move())
--    gint y;                     Y coordinate relative to parent window (see gdk_window_move())
--    gint width;                 width of window
--    gint height;                height of window
--    GdkWindowClass wclass;      GDK_INPUT_OUTPUT (normal window) or GDK_INPUT_ONLY (invisible window that
--                                receives events)
--    GdkVisual *visual;          GdkVisual for window
--    GdkColormap *colormap;      GdkColormap for window
--    GdkWindowType window_type;  type of window
--    GdkCursor *cursor;          cursor for the window (see gdk_window_set_cursor())
--    gchar *wmclass_name;        don't use (see gtk_window_set_wmclass())
--    gchar *wmclass_class;       don't use (see gtk_window_set_wmclass())
--    gboolean override_redirect; TRUE to bypass the window manager

--    -------------------------------------------------------------------------------------------------------------

--   enum GdkWindowAttributesType

--  typedef enum
--  {
--    GDK_WA_TITLE    = 1 << 1,
--    GDK_WA_X        = 1 << 2,
--    GDK_WA_Y        = 1 << 3,
--    GDK_WA_CURSOR   = 1 << 4,
--    GDK_WA_COLORMAP = 1 << 5,
--    GDK_WA_VISUAL   = 1 << 6,
--    GDK_WA_WMCLASS  = 1 << 7,
--    GDK_WA_NOREDIR  = 1 << 8
--  } GdkWindowAttributesType;

--    Used to indicate which fields in the GdkWindowAttr struct should be honored. For example, if you filled in
--    the "cursor" and "x" fields of GdkWindowAttr, pass "GDK_WA_X | GDK_WA_CURSOR" to gdk_window_new(). Fields in
--    GdkWindowAttr not covered by a bit in this enum are required; for example, the width/height, wclass, and
--    window_type fields are required, they have no corresponding flag in GdkWindowAttributesType.

--    GDK_WA_TITLE    Honor the title field
--    GDK_WA_X        Honor the X coordinate field
--    GDK_WA_Y        Honor the Y coordinate field
--    GDK_WA_CURSOR   Honor the cursor field
--    GDK_WA_COLORMAP Honor the colormap field
--    GDK_WA_VISUAL   Honor the visual field
--    GDK_WA_WMCLASS  Honor the wmclass_class and wmclass_name fields
--    GDK_WA_NOREDIR  Honor the override_redirect field

--    -------------------------------------------------------------------------------------------------------------

--   enum GdkModifierType

--  typedef enum
--  {
--    GDK_SHIFT_MASK    = 1 << 0,
--    GDK_LOCK_MASK     = 1 << 1,
--    GDK_CONTROL_MASK  = 1 << 2,
--    GDK_MOD1_MASK     = 1 << 3,
--    GDK_MOD2_MASK     = 1 << 4,
--    GDK_MOD3_MASK     = 1 << 5,
--    GDK_MOD4_MASK     = 1 << 6,
--    GDK_MOD5_MASK     = 1 << 7,
--    GDK_BUTTON1_MASK  = 1 << 8,
--    GDK_BUTTON2_MASK  = 1 << 9,
--    GDK_BUTTON3_MASK  = 1 << 10,
--    GDK_BUTTON4_MASK  = 1 << 11,
--    GDK_BUTTON5_MASK  = 1 << 12,

--    /* The next few modifiers are used by XKB, so we skip to the end.
--     * Bits 15 - 25 are currently unused. Bit 29 is used internally.
--     */

--    GDK_SUPER_MASK    = 1 << 26,
--    GDK_HYPER_MASK    = 1 << 27,
--    GDK_META_MASK     = 1 << 28,

--    GDK_RELEASE_MASK  = 1 << 30,

--    GDK_MODIFIER_MASK = 0x5c001fff
--  } GdkModifierType;

--    A set of bit-flags to indicate the state of modifier keys and mouse buttons in various event types. Typical
--    modifier keys are Shift, Control, Meta, Super, Hyper, Alt, Compose, Apple, CapsLock or ShiftLock.

--    Like the X Window System, GDK supports 8 modifier keys and 5 mouse buttons.

--    Since 2.10, GDK recognizes which of the Meta, Super or Hyper keys are mapped to Mod2 - Mod5, and indicates
--    this by setting GDK_SUPER_MASK, GDK_HYPER_MASK or GDK_META_MASK in the state field of key events.

--    GDK_SHIFT_MASK    the Shift key.
--    GDK_LOCK_MASK     a Lock key (depending on the modifier mapping of the X server this may either be CapsLock
--                      or ShiftLock).
--    GDK_CONTROL_MASK  the Control key.
--    GDK_MOD1_MASK     the fourth modifier key (it depends on the modifier mapping of the X server which key is
--                      interpreted as this modifier, but normally it is the Alt key).
--    GDK_MOD2_MASK     the fifth modifier key (it depends on the modifier mapping of the X server which key is
--                      interpreted as this modifier).
--    GDK_MOD3_MASK     the sixth modifier key (it depends on the modifier mapping of the X server which key is
--                      interpreted as this modifier).
--    GDK_MOD4_MASK     the seventh modifier key (it depends on the modifier mapping of the X server which key is
--                      interpreted as this modifier).
--    GDK_MOD5_MASK     the eighth modifier key (it depends on the modifier mapping of the X server which key is
--                      interpreted as this modifier).
--    GDK_BUTTON1_MASK  the first mouse button.
--    GDK_BUTTON2_MASK  the second mouse button.
--    GDK_BUTTON3_MASK  the third mouse button.
--    GDK_BUTTON4_MASK  the fourth mouse button.
--    GDK_BUTTON5_MASK  the fifth mouse button.
--    GDK_SUPER_MASK    the Super modifier. Since 2.10
--    GDK_HYPER_MASK    the Hyper modifier. Since 2.10
--    GDK_META_MASK     the Meta modifier. Since 2.10
--    GDK_RELEASE_MASK  not used in GDK itself. GTK+ uses it to differentiate between (keyval, modifiers) pairs
--                      from key press and release events.
--    GDK_MODIFIER_MASK a mask covering all modifier types.


--   enum GdkWMDecoration

--  typedef enum
--  {
--    GDK_DECOR_ALL         = 1 << 0,
--    GDK_DECOR_BORDER      = 1 << 1,
--    GDK_DECOR_RESIZEH     = 1 << 2,
--    GDK_DECOR_TITLE       = 1 << 3,
--    GDK_DECOR_MENU        = 1 << 4,
--    GDK_DECOR_MINIMIZE    = 1 << 5,
--    GDK_DECOR_MAXIMIZE    = 1 << 6
--  } GdkWMDecoration;

--    These are hints originally defined by the Motif toolkit. The window manager can use them when determining how
--    to decorate the window. The hint must be set before mapping the window.

--    GDK_DECOR_ALL      all decorations should be applied.
--    GDK_DECOR_BORDER   a frame should be drawn around the window.
--    GDK_DECOR_RESIZEH  the frame should have resize handles.
--    GDK_DECOR_TITLE    a titlebar should be placed above the window.
--    GDK_DECOR_MENU     a button for opening a menu should be included.
--    GDK_DECOR_MINIMIZE a minimize button should be included.
--    GDK_DECOR_MAXIMIZE a maximize button should be included.


--   enum GdkWMFunction

--  typedef enum
--  {
--    GDK_FUNC_ALL          = 1 << 0,
--    GDK_FUNC_RESIZE       = 1 << 1,
--    GDK_FUNC_MOVE         = 1 << 2,
--    GDK_FUNC_MINIMIZE     = 1 << 3,
--    GDK_FUNC_MAXIMIZE     = 1 << 4,
--    GDK_FUNC_CLOSE        = 1 << 5
--  } GdkWMFunction;

--    These are hints originally defined by the Motif toolkit. The window manager can use them when determining the
--    functions to offer for the window. The hint must be set before mapping the window.

--    GDK_FUNC_ALL      all functions should be offered.
--    GDK_FUNC_RESIZE   the window should be resizable.
--    GDK_FUNC_MOVE     the window should be movable.
--    GDK_FUNC_MINIMIZE the window should be minimizable.
--    GDK_FUNC_MAXIMIZE the window should be maximizable.
--    GDK_FUNC_CLOSE    the window should be closable.


--   GdkPointerHooks

--  typedef struct {
--    GdkWindow* (*get_pointer)       (GdkWindow       *window,
--                                     gint            *x,
--                                     gint            *y,
--                                     GdkModifierType *mask);
--    GdkWindow* (*window_at_pointer) (GdkScreen       *screen, /* unused */
--                                     gint            *win_x,
--                                     gint            *win_y);
--  } GdkPointerHooks;

--    A table of pointers to functions for getting quantities related to the current pointer position. GDK has one
--    global table of this type, which can be set using gdk_set_pointer_hooks().

--    This is only useful for such low-level tools as an event recorder. Applications should never have any reason
--    to use this facility

--    get_pointer ()       Obtains the current pointer position and modifier state. The position is given in
--                         coordinates relative to the window containing the pointer, which is returned in window.
--    window_at_pointer () Obtains the window underneath the mouse pointer, returning the location of that window
--                         in win_x, win_y. Returns NULL if the window under the mouse pointer is not known to GDK
--                         (for example, belongs to another application).


end -- class GDK_WINDOW_EXTERNALS
