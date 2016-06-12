note
	description: "GdkScreen -- Object representing a physical screen."
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

			-- GdkScreen objects are the GDK representation of a physical
			-- screen. It is used throughout GDK and GTK+ to specify
			-- which screen the top level windows are to be displayed
			-- on. It is also used to query the screen specification and
			-- default settings such as the default colormap
			-- (`default_colormap'), the screen width (`width'), etc.
			
			-- Note that a screen may consist of multiple monitors which
			-- are merged to form a large screen area.

class GDK_SCREEN

inherit G_OBJECT 

insert
	EXCEPTIONS
		undefine copy, is_equal end
	
create {ANY} make, from_external_pointer

feature {} -- Creation
	make is
			-- the default screen for the default display. (See
			-- `GDK_DISPLAY.default')
		
			-- Note: if there is no default display then a
			-- "NoDefaultDisplay" exception is raised.
		do
			from_external_pointer(gdk_screen_get_default)
		end

feature {ANY}
	--	default_colormap: GDK_COLORMAP is
			-- the default colormap for screen.
-- 		do
-- 			create Result.from_external_pointer
-- 			(gdk_screen_get_default_colormap(handle))
-- 		end

-- 	set_default_colormap (a_colormap: GDK_COLORMAP)

--  void        gdk_screen_set_default_colormap (GdkScreen *screen,
--                                               GdkColormap *colormap);

--    Sets the default colormap for screen.

--    screen :   a GdkScreen
--    colormap : a GdkColormap

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_system_colormap ()

--  GdkColormap* gdk_screen_get_system_colormap (GdkScreen *screen);

--    Gets the system's default colormap for screen

--    screen :  a GdkScreen
--    Returns : the default colormap for screen.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_system_visual ()

--  GdkVisual*  gdk_screen_get_system_visual    (GdkScreen *screen);

--    Get the system's default visual for screen. This is the visual for the
--    root window of the display. The return value should not be freed.

--    screen :  a GdkScreen.
--    Returns : the system visual

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_rgb_colormap ()

--  GdkColormap* gdk_screen_get_rgb_colormap    (GdkScreen *screen);

--    Gets the preferred colormap for rendering image data on screen. Not a very
--    useful function; historically, GDK could only render RGB image data to one
--    colormap and visual, but in the current version it can render to any
--    colormap and visual. So there's no need to call this function.

--    screen :  a GdkScreen.
--    Returns : the preferred colormap

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_rgb_visual ()

--  GdkVisual*  gdk_screen_get_rgb_visual       (GdkScreen *screen);

--    Gets a "preferred visual" chosen by GdkRGB for rendering image data on
--    screen. In previous versions of GDK, this was the only visual GdkRGB could
--    use for rendering. In current versions, it's simply the visual GdkRGB
--    would have chosen as the optimal one in those previous versions. GdkRGB
--    can now render to drawables with any visual.

--    screen :  a GdkScreen
--    Returns : The GdkVisual chosen by GdkRGB.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_rgba_colormap ()

--  GdkColormap* gdk_screen_get_rgba_colormap   (GdkScreen *screen);

--    Gets a colormap to use for creating windows or pixmaps with an alpha
--    channel. The windowing system on which GTK+ is running may not support
--    this capability, in which case NULL will be returned. Even if a non-NULL
--    value is returned, its possible that the window's alpha channel won't be
--    honored when displaying the window on the screen: in particular, for X an
--    appropriate windowing manager and compositing manager must be running to
--    provide appropriate display.

--    screen :  a GdkScreen.
--    Returns : a colormap to use for windows with an alpha channel or NULL if
--              the capability is not available.

--    Since 2.8

--    --------------------------------------------------------------------------

--   gdk_screen_get_rgba_visual ()

--  GdkVisual*  gdk_screen_get_rgba_visual      (GdkScreen *screen);

--    Gets a visual to use for creating windows or pixmaps with an alpha
--    channel. See the docs for gdk_screen_get_rgba_colormap() for caveats.

--    screen :  a GdkScreen
--    Returns : a visual to use for windows with an alpha channel or NULL if the
--              capability is not available.

--    Since 2.8

--    --------------------------------------------------------------------------

--   gdk_screen_is_composited ()

--  gboolean    gdk_screen_is_composited        (GdkScreen *screen);

--    Returns whether windows with an RGBA visual can reasonably be expected to
--    have their alpha channel drawn correctly on the screen.

--    On X11 this function returns whether a compositing manager is compositing
--    screen.

--    screen :  a GdkScreen
--    Returns : Whether windows with RGBA visuals can reasonably be expected to
--              have their alpha channels drawn correctly on the screen.

--    Since 2.10

--    --------------------------------------------------------------------------

--   gdk_screen_get_root_window ()

--  GdkWindow*  gdk_screen_get_root_window      (GdkScreen *screen);

--    Gets the root window of screen.

--    screen :  a GdkScreen
--    Returns : the root window

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_display ()

--  GdkDisplay* gdk_screen_get_display          (GdkScreen *screen);

--    Gets the display to which the screen belongs.

--    screen :  a GdkScreen
--    Returns : the display to which screen belongs

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_number ()

--  gint        gdk_screen_get_number           (GdkScreen *screen);

--    Gets the index of screen among the screens in the display to which it
--    belongs. (See gdk_screen_get_display())

--    screen :  a GdkScreen
--    Returns : the index

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_width ()

--  gint        gdk_screen_get_width            (GdkScreen *screen);

--    Gets the width of screen in pixels

--    screen :  a GdkScreen
--    Returns : the width of screen in pixels.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_height ()

--  gint        gdk_screen_get_height           (GdkScreen *screen);

--    Gets the height of screen in pixels

--    screen :  a GdkScreen
--    Returns : the height of screen in pixels.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_width_mm ()

--  gint        gdk_screen_get_width_mm         (GdkScreen *screen);

--    Gets the width of screen in millimeters. Note that on some X servers this
--    value will not be correct.

--    screen :  a GdkScreen
--    Returns : the width of screen in millimeters.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_height_mm ()

--  gint        gdk_screen_get_height_mm        (GdkScreen *screen);

--    Returns the height of screen in millimeters. Note that on some X servers
--    this value will not be correct.

--    screen :  a GdkScreen
--    Returns : the heigth of screen in millimeters.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_list_visuals ()

--  GList*      gdk_screen_list_visuals         (GdkScreen *screen);

--    Lists the available visuals for the specified screen. A visual describes a
--    hardware image data format. For example, a visual might support 24-bit
--    color, or 8-bit color, and might expect pixels to be in a certain format.

--    Call g_list_free() on the return value when you're finished with it.

--    screen :  the relevant GdkScreen.
--    Returns : a list of visuals; the list must be freed, but not its contents

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_toplevel_windows ()

--  GList*      gdk_screen_get_toplevel_windows (GdkScreen *screen);

--    Obtains a list of all toplevel windows known to GDK on the screen screen.
--    A toplevel window is a child of the root window (see
--    gdk_get_default_root_window()).

--    The returned list should be freed with g_list_free(), but its elements
--    need not be freed.

--    screen :  The GdkScreen where the toplevels are located.
--    Returns : list of toplevel windows, free with g_list_free()

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_make_display_name ()

--  gchar*      gdk_screen_make_display_name    (GdkScreen *screen);

--    Determines the name to pass to gdk_display_open() to get a GdkDisplay with
--    this screen as the default screen.

--    screen :  a GdkScreen
--    Returns : a newly allocated string, free with g_free()

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_n_monitors ()

--  gint        gdk_screen_get_n_monitors       (GdkScreen *screen);

--    Returns the number of monitors which screen consists of.

--    screen :  a GdkScreen.
--    Returns : number of monitors which screen consists of.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_monitor_geometry ()

--  void        gdk_screen_get_monitor_geometry (GdkScreen *screen,
--                                               gint monitor_num,
--                                               GdkRectangle *dest);

--    Retrieves the GdkRectangle representing the size and position of the
--    individual monitor within the entire screen area.

--    Note that the size of the entire screen area can be retrieved via
--    gdk_screen_get_width() and gdk_screen_get_height().

--    screen :      a GdkScreen.
--    monitor_num : the monitor number.
--    dest :        a GdkRectangle to be filled with the monitor geometry

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_monitor_at_point ()

--  gint        gdk_screen_get_monitor_at_point (GdkScreen *screen,
--                                               gint x,
--                                               gint y);

--    Returns the monitor number in which the point (x,y) is located.

--    screen :  a GdkScreen.
--    x :       the x coordinate in the virtual screen.
--    y :       the y coordinate in the virtual screen.
--    Returns : the monitor number in which the point (x,y) lies, or a monitor
--              close to (x,y) if the point is not in any monitor.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_monitor_at_window ()

--  gint        gdk_screen_get_monitor_at_window
--                                              (GdkScreen *screen,
--                                               GdkWindow *window);

--    Returns the number of the monitor in which the largest area of the
--    bounding rectangle of window resides.

--    screen :  a GdkScreen.
--    window :  a GdkWindow
--    Returns : the monitor number in which most of window is located, or if
--              window does not intersect any monitors, a monitor, close to
--              window.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_broadcast_client_message ()

--  void        gdk_screen_broadcast_client_message
--                                              (GdkScreen *screen,
--                                               GdkEvent *event);

--    On X11, sends an X ClientMessage event to all toplevel windows on screen.

--    Toplevel windows are determined by checking for the WM_STATE property, as
--    described in the Inter-Client Communication Conventions Manual (ICCCM). If
--    no windows are found with the WM_STATE property set, the message is sent
--    to all children of the root window.

--    On Windows, broadcasts a message registered with the name
--    GDK_WIN32_CLIENT_MESSAGE to all top-level windows. The amount of data is
--    limited to one long, i.e. four bytes.

--    screen : the GdkScreen where the event will be broadcasted.
--    event :  the GdkEvent.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_setting ()

--  gboolean    gdk_screen_get_setting          (GdkScreen *screen,
--                                               const gchar *name,
--                                               GValue *value);

--    Retrieves a desktop-wide setting such as double-click time for the
--    GdkScreen screen.

--    FIXME needs a list of valid settings here, or a link to more information.

--    screen :  the GdkScreen where the setting is located
--    name :    the name of the setting
--    value :   location to store the value of the setting
--    Returns : TRUE if the setting existed and a value was stored in value,
--              FALSE otherwise.

--    Since 2.2

--    --------------------------------------------------------------------------

--   gdk_screen_get_font_options ()

--  const cairo_font_options_t* gdk_screen_get_font_options
--                                              (GdkScreen *screen);

--    Gets any options previously set with gdk_screen_set_font_options().

--    screen :  a GdkScreen
--    Returns : the current font options, or NULL if no default font options
--              have been set.

--    Since 2.10

--    --------------------------------------------------------------------------

--   gdk_screen_set_font_options ()

--  void        gdk_screen_set_font_options     (GdkScreen *screen,
--                                               const cairo_font_options_t *options);

--    Sets the default font options for the screen. These options will be set on
--    any PangoContext's newly created with gdk_pango_context_get_for_screen().
--    Changing the default set of font options does not affect contexts that
--    have already been created.

--    screen :  a GdkScreen
--    options : a cairo_font_options_t, or NULL to unset any previously set
--              default font options.

--    Since 2.10

--    --------------------------------------------------------------------------

--   gdk_screen_get_resolution ()

--  gdouble     gdk_screen_get_resolution       (GdkScreen *screen);

--    Gets the resolution for font handling on the screen; see
--    gdk_screen_set_resolution() for full details.

--    screen :  a GdkScreen
--    Returns : the current resolution, or -1 if no resolution has been set.

--    Since 2.10

--    --------------------------------------------------------------------------

--   gdk_screen_set_resolution ()

--  void        gdk_screen_set_resolution       (GdkScreen *screen,
--                                               gdouble dpi);

--    Sets the resolution for font handling on the screen. This is a scale
--    factor between points specified in a PangoFontDescription and cairo units.
--    The default value is 96, meaning that a 10 point font will be 13 units
--    high. (10 * 96. / 72. = 13.3).

--    screen : a GdkScreen
--    dpi :    the resolution in "dots per inch". (Physical inches aren't
--             actually involved; the terminology is conventional.)

--    Since 2.10

--    --------------------------------------------------------------------------

--   gdk_screen_get_active_window ()

--  GdkWindow*  gdk_screen_get_active_window    (GdkScreen *screen);

--    Returns the screen's currently active window.

--    On X11, this is done by inspecting the _NET_ACTIVE_WINDOW property on the
--    root window, as described in the Extended Window Manager Hints. If there
--    is no currently currently active window, or the window manager does not
--    support the _NET_ACTIVE_WINDOW hint, this function returns NULL.

--    On other platforms, this function may return NULL, depending on whether it
--    is implementable on that platform.

--    The returned window should be unrefed using g_object_unref() when no
--    longer needed.

--    screen :  a GdkScreen
--    Returns : the currently active window, or NULL.

--    Since 2.10

--    --------------------------------------------------------------------------

--   gdk_screen_get_window_stack ()

--  GList*      gdk_screen_get_window_stack     (GdkScreen *screen);

--    Returns a GList of GdkWindows representing the current window stack.

--    On X11, this is done by inspecting the _NET_CLIENT_LIST_STACKING property
--    on the root window, as described in the Extended Window Manager Hints. If
--    the window manager does not support the _NET_CLIENT_LIST_STACKING hint,
--    this function returns NULL.

--    On other platforms, this function may return NULL, depending on whether it
--    is implementable on that platform.

--    The returned list is newly allocated and owns references to the windows it
--    contains, so it should be freed using g_list_free() and its windows
--    unrefed using g_object_unref() when no longer needed.

--    screen :  a GdkScreen
--    Returns : a list of GdkWindows for the current window stack, or NULL.

--    Since 2.10

--    --------------------------------------------------------------------------

--   gdk_spawn_on_screen ()

--  gboolean    gdk_spawn_on_screen             (GdkScreen *screen,
--                                               const gchar *working_directory,
--                                               gchar **argv,
--                                               gchar **envp,
--                                               GSpawnFlags flags,
--                                               GSpawnChildSetupFunc child_setup,
--                                               gpointer user_data,
--                                               gint *child_pid,
--                                               GError **error);

--    Like g_spawn_async(), except the child process is spawned in such an
--    environment that on calling gdk_display_open() it would be returned a
--    GdkDisplay with screen as the default screen.

--    This is useful for applications which wish to launch an application on a
--    specific screen.

--    screen :            a GdkScreen
--    working_directory : child's current working directory, or NULL to inherit
--                        parent's
--    argv :              child's argument vector
--    envp :              child's environment, or NULL to inherit parent's
--    flags :             flags from GSpawnFlags
--    child_setup :       function to run in the child just before exec()
--    user_data :         user data for child_setup
--    child_pid :         return location for child process ID, or NULL
--    error :             return location for error
--    Returns :           TRUE on success, FALSE if error is set

--    Since 2.4

--    --------------------------------------------------------------------------

--   gdk_spawn_on_screen_with_pipes ()

--  gboolean    gdk_spawn_on_screen_with_pipes  (GdkScreen *screen,
--                                               const gchar *working_directory,
--                                               gchar **argv,
--                                               gchar **envp,
--                                               GSpawnFlags flags,
--                                               GSpawnChildSetupFunc child_setup,
--                                               gpointer user_data,
--                                               gint *child_pid,
--                                               gint *standard_input,
--                                               gint *standard_output,
--                                               gint *standard_error,
--                                               GError **error);

--    Like g_spawn_async_with_pipes(), except the child process is spawned in
--    such an environment that on calling gdk_display_open() it would be
--    returned a GdkDisplay with screen as the default screen.

--    This is useful for applications which wish to launch an application on a
--    specific screen.

--    screen :            a GdkScreen
--    working_directory : child's current working directory, or NULL to inherit
--                        parent's
--    argv :              child's argument vector
--    envp :              child's environment, or NULL to inherit parent's
--    flags :             flags from GSpawnFlags
--    child_setup :       function to run in the child just before exec()
--    user_data :         user data for child_setup
--    child_pid :         return location for child process ID, or NULL
--    standard_input :    return location for file descriptor to write to
--                        child's stdin, or NULL
--    standard_output :   return location for file descriptor to read child's
--                        stdout, or NULL
--    standard_error :    return location for file descriptor to read child's
--                        stderr, or NULL
--    error :             return location for error
--    Returns :           TRUE on success, FALSE if an error was set

--    Since 2.4

--    --------------------------------------------------------------------------

--   gdk_spawn_command_line_on_screen ()

--  gboolean    gdk_spawn_command_line_on_screen
--                                              (GdkScreen *screen,
--                                               const gchar *command_line,
--                                               GError **error);

--    Like g_spawn_command_line_async(), except the child process is spawned in
--    such an environment that on calling gdk_display_open() it would be
--    returned a GdkDisplay with screen as the default screen.

--    This is useful for applications which wish to launch an application on a
--    specific screen.

--    screen :       a GdkScreen
--    command_line : a command line
--    error :        return location for errors
--    Returns :      TRUE on success, FALSE if error is set.

--    Since 2.4
-- Properties


--    "font-options"         gpointer              : Read / Write
--    "resolution"           gdouble               : Read / Write



-- Property Details

--   The "font-options" property

--    "font-options"         gpointer              : Read / Write

--    The default font options for the screen.

--    --------------------------------------------------------------------------

--   The "resolution" property

--    "resolution"           gdouble               : Read / Write

--    The resolution for fonts on the screen.

--    Default value: -1

-- Signals


--  "composited-changed"
--              void        user_function      (GdkScreen *screen,
--                                              gpointer   user_data)      : Run last
--  "size-changed"
--              void        user_function      (GdkScreen *screen,
--                                              gpointer   user_data)      : Run last


-- Signal Details

--   The "composited-changed" signal

--  void        user_function                  (GdkScreen *screen,
--                                              gpointer   user_data)      : Run last

--    The ::composited_changed signal is emitted when the composited status of
--    the screen changes

--    screen :    the object on which the signal is emitted
--    user_data : user data set when the signal handler was connected.

--    Since 2.10

--    --------------------------------------------------------------------------

--   The "size-changed" signal

--  void        user_function                  (GdkScreen *screen,
--                                              gpointer   user_data)      : Run last

--    The ::size_changed signal is emitted when the pixel width or height of a
--    screen changes.

--    screen :    the object on which the signal is emitted
--    user_data : user data set when the signal handler was connected.


feature {ANY} 
	struct_size: INTEGER is
		external "C inline use <gdk/gdk.h>"
		alias "sizeof(GdkScreen)"
		end

feature {} -- External calls
	 gdk_screen_get_default: POINTER is
			--  GdkScreen* gdk_screen_get_default (void);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_default_colormap (a_screen: POINTER): POINTER is
			--  GdkColormap* gdk_screen_get_default_colormap (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_set_default_colormap (a_screen, a_colormap: POINTER) is
			--  void gdk_screen_set_default_colormap (GdkScreen *screen, GdkColormap *colormap);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_system_colormap (a_screen: POINTER): POINTER is
			--  GdkColormap* gdk_screen_get_system_colormap (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_system_visual (a_screen: POINTER): POINTER is
			--  GdkVisual* gdk_screen_get_system_visual (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_rgb_colormap (a_screen: POINTER): POINTER is
			--  GdkColormap* gdk_screen_get_rgb_colormap (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_rgb_visual (a_screen: POINTER): POINTER is
			--  GdkVisual* gdk_screen_get_rgb_visual (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_rgba_colormap (a_screen: POINTER): POINTER is
			--  GdkColormap* gdk_screen_get_rgba_colormap (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_rgba_visual (a_screen: POINTER): POINTER is
			--  GdkVisual* gdk_screen_get_rgba_visual (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_is_composited (a_screen: POINTER): INTEGER is
			--  gboolean gdk_screen_is_composited (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_root_window (a_screen: POINTER): POINTER is
			--  GdkWindow* gdk_screen_get_root_window (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_display (a_screen: POINTER): POINTER is
			--  GdkDisplay* gdk_screen_get_display (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_number (a_screen: POINTER): INTEGER is
			--  gint gdk_screen_get_number (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_width (a_screen: POINTER): INTEGER is
			--  gint gdk_screen_get_width (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_height (a_screen: POINTER): INTEGER is
			--  gint gdk_screen_get_height (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_width_mm (a_screen: POINTER): INTEGER is
			--  gint gdk_screen_get_width_mm (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_height_mm (a_screen: POINTER): INTEGER is
			--  gint gdk_screen_get_height_mm (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_list_visuals (a_screen: POINTER): POINTER is
			--  GList* gdk_screen_list_visuals (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_toplevel_windows (a_screen: POINTER): POINTER is
			--  GList* gdk_screen_get_toplevel_windows (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_make_display_name (a_screen: POINTER): POINTER is
			--  gchar* gdk_screen_make_display_name (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_n_monitors (a_screen: POINTER): INTEGER is
			--  gint gdk_screen_get_n_monitors (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_monitor_geometry (a_screen: POINTER; a_monitor_num: INTEGER; a_dest: POINTER) is
			--  void gdk_screen_get_monitor_geometry (a_screen: POINTER, gint monitor_num, a_dest: POINTER);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_monitor_at_point (a_screen: POINTER; an_x, an_y: INTEGER): INTEGER is
			--  gint gdk_screen_get_monitor_at_point (a_screen: POINTER, gint x, gint y);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_monitor_at_window (a_screen, a_window: POINTER): INTEGER is
			--  gint gdk_screen_get_monitor_at_window (GdkScreen *screen, GdkWindow *window);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_broadcast_client_message (a_screen, a_event: POINTER) is
			--  void gdk_screen_broadcast_client_message (GdkScreen *screen, GdkEvent *event);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_setting (a_screen, a_name, a_value: POINTER): INTEGER is
			--  gboolean gdk_screen_get_setting (GdkScreen *screen, const gchar *name, GValue *value);
		external "C use <gtk/gtk.h>"
		end

	gdk_screen_get_font_options (a_screen: POINTER): POINTER is
			--  const cairo_font_options_t* gdk_screen_get_font_options (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_set_font_options (a_screen, some_options: POINTER) is
			--  void gdk_screen_set_font_options (GdkScreen *screen, const cairo_font_options_t *options);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_resolution (a_screen: POINTER): REAL is
			--  gdouble gdk_screen_get_resolution (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_set_resolution (a_screen: POINTER; some_dpi: REAL) is
			--  void gdk_screen_set_resolution (GdkScreen *screen, gdouble dpi);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_active_window (a_screen: POINTER): POINTER is
			--  GdkWindow* gdk_screen_get_active_window (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	 gdk_screen_get_window_stack (a_screen: POINTER): POINTER is
			--  GList* gdk_screen_get_window_stack (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end


	gdk_spawn_on_screen (a_screen, a_working_directory, an_argv, an_envp: POINTER; some_flags: INTEGER; a_child_setup_function, some_data, a_child_pid, an_error: POINTER): INTEGER is
			-- gboolean gdk_spawn_on_screen (GdkScreen *screen, const
			-- gchar *working_directory, gchar **argv, gchar **envp,
			-- GSpawnFlags flags, GSpawnChildSetupFunc child_setup,
			-- gpointer user_data, gint *child_pid, GError **error);
		external "C use <gtk/gtk.h>"
		end

	gdk_spawn_on_screen_with_pipes (a_screen, a_working_directory, an_argv, an_envp: POINTER; some_flags: INTEGER; a_gspawn_child_setup_func, some_data, a_child_pid, a_standard_input, a_standard_output, a_standard_error, an_error: POINTER): INTEGER is
			-- gboolean gdk_spawn_on_screen_with_pipes (GdkScreen
			-- *screen, const gchar *working_directory, gchar **argv,
			-- gchar **envp, GSpawnFlags flags, GSpawnChildSetupFunc
			-- child_setup, gpointer user_data, gint *child_pid, gint
			-- *standard_input, gint *standard_output, gint
			-- *standard_error, GError **error);
		external "C use <gtk/gtk.h>"
		end

	gdk_spawn_command_line_on_screen (a_screen, a_command_line, a_error: POINTER): INTEGER is
			-- gboolean gdk_spawn_command_line_on_screen (GdkScreen
			-- *screen, const gchar *command_line, GError **error);
		external "C use <gtk/gtk.h>"
		end
end -- class GDK_SCREEN
