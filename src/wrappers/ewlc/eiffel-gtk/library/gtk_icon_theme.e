note
	description: "GtkIconTheme -- Looking up icons by name."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, GTK+ team
					
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

class GTK_ICON_THEME
	-- GtkIconTheme provides a facility for looking up icons by name
	-- and size.  The main reason for using a name rather than simply
	-- providing a filename is to allow different icons to be used
	-- depending on what icon theme is selecetd by the user. The
	-- operation of icon themes on Linux and Unix follows the Icon
	-- Theme Specification. There is a default icon theme, named
	-- hicolor where applications should install their icons, but more
	-- additional application themes can be installed as operating
	-- system vendors and users choose.

	-- Named icons are similar to the Themeable Stock Images(3)
	-- facility, and the distinction between the two may be a bit
	-- confusing. A few things to keep in mind:
			
	-- o Stock images usually are used in conjunction with Stock
	-- Items(3)., such as GTK_STOCK_OK or GTK_STOCK_OPEN. Named icons
	-- are easier to set up and therefore are more useful for new icons
	-- that an application wants to add, such as application icons or
	-- window icons.

	-- o Stock images can only be loaded at the symbolic sizes defined
	-- by the GtkIconSize enumeration, or by custom sizes defined by
	-- gtk_icon_size_register(), while named icons are more flexible
	-- and any pixel size can be specified.

	-- o Because stock images are closely tied to stock items, and thus
	-- to actions in the user interface, stock images may come in
	-- multiple variants for different widget states or writing
	-- directions.
			
	-- A good rule of thumb is that if there is a stock image for what
	-- you want to use, use it, otherwise use a named icon. It turns
	-- out that internally stock images are generally defined in terms
	-- of one or more named icons.  (An example of the more than one
	-- case is icons that depend on writing direction;
	-- GTK_STOCK_GO_FORWARD uses the two themed icons
	-- "gtk-stock-go-forward-ltr" and "gtk-stock-go-forward-rtl".)

	-- In many cases, named themes are used indirectly, via GtkImage or
	-- stock items, rather than directly, but looking up icons directly
	-- is also simple.  The GtkIconTheme object acts as a database of
	-- all the icons in the current theme. You can create new
	-- GtkIconTheme objects, but its much more efficient to use the
	-- standard icon theme for the GdkScreen so that the icon
	-- information is shared with other people looking up icons. In the
	-- case where the default screen is being used, looking up an icon
	-- can be as simple as: (TODO: Eiffelize example)
			
	--  GError *error = NULL;
	--  GtkIconTheme *icon_theme;
	--  GdkPixbuf *pixbuf;

	-- icon_theme = gtk_icon_theme_get_default(); pixbuf =
	-- gtk_icon_theme_load_icon (icon_theme, "my-icon-name", /*
	-- icon name */ 48, /* size */ 0, /* flags */ &error); if
	-- (!pixbuf) { g_warning ("Couldn't load icon: %s",
	-- error->message); g_error_free (error); } else { /* Use the
	-- pixbuf */ g_object_unref (pixbuf); }

inherit
	G_OBJECT

insert 
	GTK_ICON_LOOKUP_FLAGS
		
		-- TODO: enum        GtkIconThemeError;
	
create {ANY} make, from_external_pointer

feature {} -- Creation

	make
			-- Creates a new icon theme object. Icon theme objects are
			-- used to lookup up an icon by name in a particular icon
			-- theme. Usually, you'll want to use `default' or
			-- `from_screen' rather than creating a new icon theme object
			-- for scratch.
		do
			from_external_pointer(gtk_icon_theme_new)
		end

	from_screen (a_screen: GDK_SCREEN)
			-- the icon theme object associated with `a_screen'; if this
			-- function has not previously been called for the given
			-- screen, a new icon theme object will be created and
			-- associated with the screen. Icon theme objects are fairly
			-- expensive to create, so using this function is usually a
			-- better choice than calling than `make' and setting the
			-- screen yourself; by using this function a single icon
			-- theme object will be shared between users.

			-- A unique GtkIconTheme associated with the given
			-- screen. This icon theme is associated with the screen and
			-- can be used as long as the screen is open. Do not ref or
			-- unref it.
		require screen_not_void: a_screen /= Void
		do
			handle := gtk_icon_theme_get_for_screen (a_screen.handle)
			store_eiffel_wrapper		
		end

feature {ANY}
	set_screen (a_screen: GDK_SCREEN)
			-- Sets `a_screen' for an icon theme; the screen is used to
			-- track the user's currently configured icon theme, which
			-- might be different for different screens.
		require screen_not_void: a_screen /= Void
		do
			gtk_icon_theme_set_screen (handle, a_screen.handle)
		end

	set_search_path (some_path: STRING_ARRAY)
			-- Sets the search path for the icon theme object. When
			-- looking for an icon theme, GTK+ will search for a
			-- subdirectory of one or more of the directories in path
			-- with the same name as the icon theme. (Themes from
			-- multiple of the path elements are combined to allow themes
			-- to be extended by adding icons in the user's home
			-- directory.)
		
			-- In addition if an icon found isn't found either in the
			-- current icon theme or the default icon theme, and an image
			-- file with the right name is found directly in one of the
			-- elements of path, then that image will be used for the
			-- icon name. (This is legacy feature, and new icons should
			-- be put into the default icon theme, which is called
			-- DEFAULT_THEME_NAME, rather than directly on the icon
			-- path.)

			-- `some_path': array of directories that are searched for
			-- icon themes
		do
			gtk_icon_theme_set_search_path  (handle, some_path.storage.to_pointer, some_path.count)
		end

	-- search_path: 

--  void        gtk_icon_theme_get_search_path  (GtkIconTheme *icon_theme,
--                                               gchar **path[],
--                                               gint *n_elements);

--    Gets the current search path. See gtk_icon_theme_set_search_path().

--    icon_theme : a GtkIconTheme
--    path :       location to store a list of icon theme path directories or
--                 NULL The stored value should be freed with g_strfreev().
--    n_elements : location to store number of elements in path, or NULL

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_theme_append_search_path ()

--  void        gtk_icon_theme_append_search_path
--                                              (GtkIconTheme *icon_theme,
--                                               const gchar *path);

--    Appends a directory to the search path. See
--    gtk_icon_theme_set_search_path().

--    icon_theme : a GtkIconTheme
--    path :       directory name to append to the icon path

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_theme_prepend_search_path ()

--  void        gtk_icon_theme_prepend_search_path
--                                              (GtkIconTheme *icon_theme,
--                                               const gchar *path);

--    Prepends a directory to the search path. See
--    gtk_icon_theme_set_search_path().

--    icon_theme : a GtkIconTheme
--    path :       directory name to prepend to the icon path

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_theme_set_custom_theme ()

--  void        gtk_icon_theme_set_custom_theme (GtkIconTheme *icon_theme,
--                                               const gchar *theme_name);

--    Sets the name of the icon theme that the GtkIconTheme object uses
--    overriding system configuration. This function cannot be called on the
--    icon theme objects returned from gtk_icon_theme_get_default() and
--    gtk_icon_theme_get_for_screen().

--    icon_theme : a GtkIconTheme
--    theme_name : name of icon theme to use instead of configured theme, or
--                 NULL to unset a previously set custom theme

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_theme_has_icon ()

--  gboolean    gtk_icon_theme_has_icon         (GtkIconTheme *icon_theme,
--                                               const gchar *icon_name);

--    Checks whether an icon theme includes an icon for a particular name.

--    icon_theme : a GtkIconTheme
--    icon_name :  the name of an icon
--    Returns :    TRUE if icon_theme includes an icon for icon_name.

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_theme_lookup_icon ()

--  GtkIconInfo* gtk_icon_theme_lookup_icon     (GtkIconTheme *icon_theme,
--                                               const gchar *icon_name,
--                                               gint size,
--                                               GtkIconLookupFlags flags);

--    Looks up a named icon and returns a structure containing information such
--    as the filename of the icon. The icon can then be rendered into a pixbuf
--    using gtk_icon_info_load_icon(). (gtk_icon_theme_load_icon() combines
--    these two steps if all you need is the pixbuf.)

--    icon_theme : a GtkIconTheme
--    icon_name :  the name of the icon to lookup
--    size :       desired icon size
--    flags :      flags modifying the behavior of the icon lookup
--    Returns :    a GtkIconInfo structure containing information about the
--                 icon, or NULL if the icon wasn't found. Free with
--                 gtk_icon_info_free()

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_theme_load_icon ()

--  GdkPixbuf*  gtk_icon_theme_load_icon        (GtkIconTheme *icon_theme,
--                                               const gchar *icon_name,
--                                               gint size,
--                                               GtkIconLookupFlags flags,
--                                               GError **error);

--    Looks up an icon in an icon theme, scales it to the given size and renders
--    it into a pixbuf. This is a convenience function; if more details about
--    the icon are needed, use gtk_icon_theme_lookup_icon() followed by
--    gtk_icon_info_load_icon().

--    Note that you probably want to listen for icon theme changes and update
--    the icon. This is usually done by connecting to the GtkWidget::style-set
--    signal. If for some reason you do not want to update the icon when the
--    icon theme changes, you should consider using gdk_pixbuf_copy() to make a
--    private copy of the pixbuf returned by this function. Otherwise GTK+ may
--    need to keep the old icon theme loaded, which would be a waste of memory.

--    icon_theme : a GtkIconTheme
--    icon_name :  the name of the icon to lookup
--    size :       the desired icon size. The resulting icon may not be exactly
--                 this size; see gtk_icon_info_load_icon().
--    flags :      flags modifying the behavior of the icon lookup
--    error :      Location to store error information on failure, or NULL.
--    Returns :    the rendered icon; this may be a newly created icon or a new
--                 reference to an internal icon, so you must not modify the
--                 icon. Use g_object_unref() to release your reference to the
--                 icon. NULL if the icon isn't found.

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_theme_list_icons ()

--  GList*      gtk_icon_theme_list_icons       (GtkIconTheme *icon_theme,
--                                               const gchar *context);

--    Lists the icons in the current icon theme. Only a subset of the icons can
--    be listed by providing a context string. The set of values for the context
--    string is system dependent, but will typically include such values as
--    "Applications" and "MimeTypes".

--    icon_theme : a GtkIconTheme
--    context :    a string identifying a particular type of icon, or NULL to
--                 list all icons.
--    Returns :    a GList list holding the names of all the icons in the theme.
--                 You must first free each element in the list with g_free(),
--                 then free the list itself with g_list_free().

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_theme_get_icon_sizes ()

--  gint*       gtk_icon_theme_get_icon_sizes   (GtkIconTheme *icon_theme,
--                                               const gchar *icon_name);

--    Returns an array of integers describing the sizes at which the icon is
--    available without scaling. A size of -1 means that the icon is available
--    in a scalable format. The array is zero-terminated.

--    icon_theme : a GtkIconTheme
--    icon_name :  the name of an icon
--    Returns :    An newly allocated array describing the sizes at which the
--                 icon is available. The array should be freed with g_free()
--                 when it is no longer needed.

--    Since 2.6

--    --------------------------------------------------------------------------

--   gtk_icon_theme_get_example_icon_name ()

--  char*       gtk_icon_theme_get_example_icon_name
--                                              (GtkIconTheme *icon_theme);

--    Gets the name of an icon that is representative of the current theme (for
--    instance, to use when presenting a list of themes to the user.)

--    icon_theme : a GtkIconTheme
--    Returns :    the name of an example icon or NULL. Free with g_free().

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_theme_rescan_if_needed ()

--  gboolean    gtk_icon_theme_rescan_if_needed (GtkIconTheme *icon_theme);

--    Checks to see if the icon theme has changed; if it has, any currently
--    cached information is discarded and will be reloaded next time icon_theme
--    is accessed.

--    icon_theme : a GtkIconTheme
--    Returns :    TRUE if the icon theme has changed and needed to be reloaded.

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_theme_add_builtin_icon ()

--  void        gtk_icon_theme_add_builtin_icon (const gchar *icon_name,
--                                               gint size,
--                                               GdkPixbuf *pixbuf);

--    Registers a built-in icon for icon theme lookups. The idea of built-in
--    icons is to allow an application or library that uses themed icons to
--    function requiring files to be present in the file system. For instance,
--    the default images for all of GTK+'s stock icons are registered as
--    built-icons.

--    In general, if you use gtk_icon_theme_add_builtin_icon() you should also
--    install the icon in the icon theme, so that the icon is generally
--    available.

--    This function will generally be used with pixbufs loaded via
--    gdk_pixbuf_new_from_inline().

--    icon_name : the name of the icon to register
--    size :      the size at which to register the icon (different images can
--                be registered for the same icon name at different sizes.)
--    pixbuf :    GdkPixbuf that contains the image to use for icon_name.

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_info_copy ()

--  GtkIconInfo* gtk_icon_info_copy             (GtkIconInfo *icon_info);

--    Make a copy of a GtkIconInfo.

--    icon_info : a GtkIconInfo
--    Returns :   the new GtkIconInfo

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_info_free ()

--  void        gtk_icon_info_free              (GtkIconInfo *icon_info);

--    Free a GtkIconInfo and associated information

--    icon_info : a GtkIconInfo

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_info_get_base_size ()

--  gint        gtk_icon_info_get_base_size     (GtkIconInfo *icon_info);

--    Gets the base size for the icon. The base size is a size for the icon that
--    was specified by the icon theme creator. This may be different than the
--    actual size of image; an example of this is small emblem icons that can be
--    attached to a larger icon. These icons will be given the same base size as
--    the larger icons to which they are attached.

--    icon_info : a GtkIconInfo
--    Returns :   the base size, or 0, if no base size is known for the icon.

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_info_get_filename ()

--  const gchar* gtk_icon_info_get_filename     (GtkIconInfo *icon_info);

--    Gets the filename for the icon. If the GTK_ICON_LOOKUP_USE_BUILTIN flag
--    was passed to gtk_icon_theme_lookup_icon(), there may be no filename if a
--    builtin icon is returned; in this case, you should use
--    gtk_icon_info_get_builtin_pixbuf().

--    icon_info : a GtkIconInfo
--    Returns :   the filename for the icon, or NULL if
--                gtk_icon_info_get_builtin_pixbuf() should be used instead. The
--                return value is owned by GTK+ and should not be modified or
--                freed.

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_info_get_builtin_pixbuf ()

--  GdkPixbuf*  gtk_icon_info_get_builtin_pixbuf
--                                              (GtkIconInfo *icon_info);

--    Gets the built-in image for this icon, if any. To allow GTK+ to use built
--    in icon images, you must pass the GTK_ICON_LOOKUP_USE_BUILTIN to
--    gtk_icon_theme_lookup_icon().

--    icon_info : a GtkIconInfo structure
--    Returns :   the built-in image pixbuf, or NULL. No extra reference is
--                added to the returned pixbuf, so if you want to keep it
--                around, you must use g_object_ref(). The returned image must
--                not be modified.

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_info_load_icon ()

--  GdkPixbuf*  gtk_icon_info_load_icon         (GtkIconInfo *icon_info,
--                                               GError **error);

--    Renders an icon previously looked up in an icon theme using
--    gtk_icon_theme_lookup_icon(); the size will be based on the size passed to
--    gtk_icon_theme_lookup_icon(). Note that the resulting pixbuf may not be
--    exactly this size; an icon theme may have icons that differ slightly from
--    their nominal sizes, and in addition GTK+ will avoid scaling icons that it
--    considers sufficiently close to the requested size or for which the source
--    image would have to be scaled up too far. (This maintains sharpness.)

--    icon_info : a GtkIconInfo structure from gtk_icon_theme_lookup_icon()
--    error :     location to store error information on failure, or NULL.
--    Returns :   the rendered icon; this may be a newly created icon or a new
--                reference to an internal icon, so you must not modify the
--                icon. Use g_object_unref() to release your reference to the
--                icon.

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_info_set_raw_coordinates ()

--  void        gtk_icon_info_set_raw_coordinates
--                                              (GtkIconInfo *icon_info,
--                                               gboolean raw_coordinates);

--    Sets whether the coordinates returned by gtk_icon_info_get_embedded_rect()
--    and gtk_icon_info_get_attach_points() should be returned in their original
--    form as specified in the icon theme, instead of scaled appropriately for
--    the pixbuf returned by gtk_icon_info_load_icon().

--    Raw coordinates are somewhat strange; they are specified to be with
--    respect to the unscaled pixmap for PNG and XPM icons, but for SVG icons,
--    they are in a 1000x1000 coordinate space that is scaled to the final size
--    of the icon. You can determine if the icon is an SVG icon by using
--    gtk_icon_info_get_filename(), and seeing if it is non-NULL and ends in
--    '.svg'.

--    This function is provided primarily to allow compatibility wrappers for
--    older API's, and is not expected to be useful for applications.

--    icon_info :       a GtkIconInfo
--    raw_coordinates : whether the coordinates of embedded rectangles and
--                      attached points should be returned in their original
--                      (unscaled) form.

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_info_get_embedded_rect ()

--  gboolean    gtk_icon_info_get_embedded_rect (GtkIconInfo *icon_info,
--                                               GdkRectangle *rectangle);

--    Gets the coordinates of a rectangle within the icon that can be used for
--    display of information such as a preview of the contents of a text file.
--    See gtk_icon_info_set_raw_coordinates() for further information about the
--    coordinate system.

--    icon_info : a GtkIconInfo
--    rectangle : GdkRectangle in which to store embedded rectangle coordinates;
--                coordinates are only stored when this function returns TRUE.
--    Returns :   TRUE if the icon has an embedded rectangle

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_info_get_attach_points ()

--  gboolean    gtk_icon_info_get_attach_points (GtkIconInfo *icon_info,
--                                               GdkPoint **points,
--                                               gint *n_points);

--    Fetches the set of attach points for an icon. An attach point is a
--    location in the icon that can be used as anchor points for attaching
--    emblems or overlays to the icon.

--    icon_info : a GtkIconInfo
--    points :    location to store pointer to an array of points, or NULL free
--                the array of points with g_free().
--    n_points :  location to store the number of points in points, or NULL
--    Returns :   TRUE if there are any attach points for the icon.

--    Since 2.4

--    --------------------------------------------------------------------------

--   gtk_icon_info_get_display_name ()

--  const gchar* gtk_icon_info_get_display_name (GtkIconInfo *icon_info);

--    Gets the display name for an icon. A display name is a string to be used
--    in place of the icon name in a user visible context like a list of icons.

--    icon_info : a GtkIconInfo
--    Returns :   the display name for the icon or NULL, if the icon doesn't
--                have a specified display name. This value is owned icon_info
--                and must not be modified or free.

--    Since 2.4

feature {ANY} --   The "changed" signal

--  void        user_function                  (GtkIconTheme *icon_theme,
--                                              gpointer      user_data)       : Run last

--    Emitted when the current icon theme is switched or GTK+ detects that a
--    change has occurred in the contents of the current icon theme.

--    icon_theme : the icon theme

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkIconTheme)"
		end

feature {} -- External calls
	gtk_icon_theme_error: INTEGER
			--    The GQuark used for GtkIconThemeError errors.
		external "C macro <gtk/gtk.h>"
		alias "GTK_ICON_THEME_ERROR"
		end

	gtk_icon_theme_new: POINTER
			-- GtkIconTheme* gtk_icon_theme_new (void);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_get_for_screen (a_screen: POINTER): POINTER
			-- GtkIconTheme* gtk_icon_theme_get_for_screen (GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_set_screen (an_icon_theme, a_screen: POINTER)
			-- void gtk_icon_theme_set_screen (GtkIconTheme *icon_theme, GdkScreen *screen);
		external "C use <gtk/gtk.h>"
		end
													  
	gtk_icon_theme_set_search_path (an_icon_theme, a_path: POINTER; an_elements_n: INTEGER)
			-- void gtk_icon_theme_set_search_path (GtkIconTheme
			-- *icon_theme, const gchar *path[], gint n_elements);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_get_search_path (an_icon_theme, some_paths, a_n_element: POINTER)
			-- void gtk_icon_theme_get_search_path (GtkIconTheme
			-- *icon_theme, gchar **path[], gint *n_elements);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_append_search_path (an_icon_theme, a_path: POINTER)
			-- void gtk_icon_theme_append_search_path (GtkIconTheme *icon_theme, const gchar *path);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_prepend_search_path (an_icon_theme, a_path: POINTER)
			-- void gtk_icon_theme_prepend_search_path (GtkIconTheme
			-- *icon_theme, const gchar *path);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_set_custom_theme (an_icon_theme, a_theme_name: POINTER)
			-- void gtk_icon_theme_set_custom_theme (GtkIconTheme
			-- *icon_theme, const gchar *theme_name);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_has_icon (an_icon_theme, an_icon_name: POINTER): INTEGER
			-- gboolean gtk_icon_theme_has_icon (GtkIconTheme *icon_theme, const gchar *icon_name);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_lookup_icon (an_icon_theme, an_icon_name: POINTER; a_size, some_flags: INTEGER): POINTER
			-- GtkIconInfo* gtk_icon_theme_lookup_icon (GtkIconTheme *icon_theme, const gchar *icon_name, gint size, GtkIconLookupFlags flags);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_load_icon (an_icon_theme, an_icon_name: POINTER; a_size, some_flags: INTEGER; error_handle: POINTER): POINTER
			-- GdkPixbuf* gtk_icon_theme_load_icon (GtkIconTheme *icon_theme, const gchar *icon_name, gint size, GtkIconLookupFlags flags, GError **error);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_icon_theme_list_icons (an_icon_theme, a_context: POINTER): POINTER
			-- GList* gtk_icon_theme_list_icons (GtkIconTheme *icon_theme, const gchar *context);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_get_icon_sizes (an_icon_theme, an_icon_name: POINTER): POINTER
			-- gint* gtk_icon_theme_get_icon_sizes (GtkIconTheme
			-- *icon_theme, const gchar *icon_name);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_get_example_icon_name (an_icon_theme: POINTER): POINTER
			-- char* gtk_icon_theme_get_example_icon_name (GtkIconTheme *icon_theme);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_rescan_if_needed (an_icon_theme: POINTER): INTEGER
			-- gboolean gtk_icon_theme_rescan_if_needed (GtkIconTheme *icon_theme);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_theme_add_builtin_icon (an_icon_name: POINTER; a_size: INTEGER; a_pixbuf: POINTER)
			-- void gtk_icon_theme_add_builtin_icon (const gchar
			-- *icon_name, gint size, GdkPixbuf *pixbuf);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_info_copy (an_icon_info: POINTER): POINTER
			-- GtkIconInfo* gtk_icon_info_copy (GtkIconInfo *icon_info);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_info_free (a_icon_info: POINTER)
			-- void gtk_icon_info_free (GtkIconInfo *icon_info);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_info_get_base_size (a_icon_info: POINTER): INTEGER
			-- gint gtk_icon_info_get_base_size (GtkIconInfo *icon_info);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_info_get_filename (a_icon_info: POINTER): POINTER
			-- const gchar* gtk_icon_info_get_filename (GtkIconInfo *icon_info);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_info_get_builtin_pixbuf (a_icon_info: POINTER): POINTER
			-- GdkPixbuf* gtk_icon_info_get_builtin_pixbuf (GtkIconInfo *icon_info);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_info_load_icon (a_icon_info, an_error_handle: POINTER): POINTER
			-- GdkPixbuf* gtk_icon_info_load_icon (GtkIconInfo *icon_info, GError **error);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_info_set_raw_coordinates (a_icon_info: POINTER; raw_coordinates_bool: INTEGER)
			-- void gtk_icon_info_set_raw_coordinates (GtkIconInfo
			-- *icon_info, gboolean raw_coordinates);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_info_get_embedded_rect (a_icon_info, a_rectangle: POINTER): INTEGER
			-- gboolean gtk_icon_info_get_embedded_rect (GtkIconInfo *icon_info, GdkRectangle *rectangle);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_info_get_attach_points (a_icon_info, a_points_handle, a_n_points: POINTER): INTEGER
			-- gboolean gtk_icon_info_get_attach_points (GtkIconInfo *icon_info, GdkPoint **points, gint *n_points);
		external "C use <gtk/gtk.h>"
		end

	gtk_icon_info_get_display_name (a_icon_info: POINTER): POINTER
			-- const gchar* gtk_icon_info_get_display_name (GtkIconInfo *icon_info);
		external "C use <gtk/gtk.h>"
		end
end
