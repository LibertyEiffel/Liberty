note
	description: "GtkStatusIcon — Display an icon in the system tray."
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

			
class GTK_STATUS_ICON
	--The "system tray" or notification area is normally used for
	-- transient icons that indicate some special state. For example, a
	-- system tray icon might appear to tell the user that they have
	-- new mail, or have an incoming instant message, or something
	-- along those lines. The basic idea is that creating an icon in
	-- the notification area is less annoying than popping up a dialog.

	-- A GtkStatusIcon object can be used to display an icon in a
	-- "system tray". The icon can have a tooltip, and the user can
	-- interact with it by activating it or popping up a context
	-- menu. Critical information should not solely be displayed in a
	-- GtkStatusIcon, since it may not be visible (e.g. when the user
	-- doesn't have a notification area on his panel). This can be
	-- checked with `is_embedded'.
			
	-- On X11, the implementation follows the freedesktop.org "System
	-- Tray" specification. Implementations of the "tray" side of this
	-- specification can be found e.g. in the GNOME and KDE panel
	-- applications.

	-- Note that a GtkStatusIcon is not a widget, but just a
	-- GObject. Making it a widget would be impractical, since the
	-- system tray on Win32 doesn't allow to embed arbitrary widgets.

inherit G_OBJECT

insert
	GTK_IMAGE_TYPE
		--GTK_STATUS_ICON_EXTERNALS

create {ANY}
	make,
	make_from_pixbuf,
	make_from_file,
	make_from_stock,
	make_from_icon_name,
	from_external_pointer

feature {} -- Creation
	make
			-- Creates an empty status icon object.
		do
			from_external_pointer(gtk_status_icon_new)
		end

	make_from_pixbuf (a_pixbuf: GDK_PIXBUF)
			-- Creates a status icon displaying `a_pixbuf'. The image
			-- will be scaled down to fit in the available space in the
			-- notification area, if necessary.
		require
			pixbuf_not_void: a_pixbuf /= Void
		do
			from_external_pointer(gtk_status_icon_new_from_pixbuf(a_pixbuf.handle))
		end
	
	make_from_file (a_filename: STRING)
			-- Creates a status icon displaying the file
			-- `a_filename'. The image will be scaled down to fit in the
			-- available space in the notification area, if necessary.
		require
			filename_not_void: a_filename /= Void
		do
			from_external_pointer(gtk_status_icon_new_from_file(a_filename.to_external))
		end

	make_from_stock (a_stock_id: STRING)
			-- Creates a status icon displaying a stock icon. Sample
			-- stock icon names are GTK_STOCK_OPEN, GTK_STOCK_QUIT. You
			-- can register your own stock icon names, see
			-- `GTK_ICON_FACTORY.add_default' and `GTK_ICON_FACTORY.add'.
		require stock_id_not_void: a_stock_id /= Void
		do
			from_external_pointer(gtk_status_icon_new_from_stock(a_stock_id.to_external))
		end

	make_from_icon_name (an_icon_name: STRING)
			-- Creates a status icon displaying an icon from the current
			-- icon theme. If the current icon theme is changed, the icon
			-- will be updated appropriately.
		require icon_name_not_void: an_icon_name /= Void
		do
			from_external_pointer(gtk_status_icon_new_from_icon_name(an_icon_name.to_external))
		end

feature {ANY}
	set_from_pixbuf (a_pixbuf: GDK_PIXBUF)
			-- Display `a_pixbuf' See `make_from_pixbuf' for details.
		require pixbuf_not_void: a_pixbuf /= Void
		do
			gtk_status_icon_set_from_pixbuf (handle, a_pixbuf.handle)
		end
	
	unset_pixbuf
		do
			gtk_status_icon_set_from_pixbuf (handle, default_pointer)
		end
	
	set_from_file (a_file_name: STRING)
			-- Makes Current status icon display the file
			-- `a_file_name'. See `make_from_file' for details.
		require filename_not_void: a_file_name /= Void
		do
			gtk_status_icon_set_from_file (handle, a_file_name.to_external)
		end

	set_from_stock (a_stock_id: STRING)
			-- Makes status icon display `a_stock_icon'. See
			-- `make_from_stock' for details.
		require stock_not_void: a_stock_id /= Void
		do
			gtk_status_icon_set_from_stock  (handle, a_stock_id.to_external)
		end

	set_from_icon_name (an_icon_name: STRING)
			-- Makes status icon display the icon named `an_icon_name'
			-- from the current icon theme. See `make_from_icon_name' for
			-- details.
		require name_not_void: an_icon_name /= Void
		do
			gtk_status_icon_set_from_icon_name (handle, an_icon_name.to_external)
		end


	storage_type: INTEGER
			-- the type of representation being used by the GtkStatusIcon
			-- to store image data. If the GtkStatusIcon has no image
			-- data, the return value will be `gtk_image_empty'.
		do
			Result := gtk_status_icon_get_storage_type (handle)
		ensure valid_type: is_valid_gtk_image_type (Result)
		end


	pixbuf: GDK_PIXBUF
			-- the displayed pixbuf, or Void if the image is
			-- empty. `storage_type' of the status icon must be
			-- `gtk_image_empty' or `gtk_image_pixbuf' (see
			-- `storage_type').
		local ptr: POINTER
		do
			ptr:=gtk_status_icon_get_pixbuf(handle)
			-- The caller of this function does not own a reference to
			-- the returned pixbuf.
		end

	stock_id: STRING
			-- the id of the stock icon being displayed by the status
			-- icon. Void if the image is empty.
		require
			valid_storage_type: ((storage_type = gtk_image_empty) or
										(storage_type = gtk_image_stock))
		local p: POINTER 
		do
			p := gtk_status_icon_get_stock (handle)
			if p.is_not_null then
				create {CONST_STRING} Result.from_external(p)
			end
		end
	
	icon_name: STRING
			-- the name of the icon being displayed by the status
			-- icon. Void if the image is empty.
		require
			valid_storage_type: ((storage_type = gtk_image_empty) or
										(storage_type = gtk_image_icon_name))
		local ptr: POINTER
		do
			ptr := gtk_status_icon_get_icon_name (handle)
			if ptr.is_not_null then
				create {CONST_STRING} Result.from_external(ptr)
			end
		end

	size: INTEGER
			-- the size in pixels that is available for the image. Stock
			-- icons and named icons adapt their size automatically if
			-- the size of the notification area changes. For other
			-- storage types, the "size-changed" signal can be used to
			-- react to size changes.
		do
			Result := gtk_status_icon_get_size(handle)
		end

	set_tooltip (a_tooltip_text: STRING)
			-- Sets the tooltip of the status icon.
		require text_not_void: a_tooltip_text /= Void
		do
			gtk_status_icon_set_tooltip (handle, a_tooltip_text.to_external)
		end

	unset_tooltip
			-- Unsets the tooltip of the status icon.
		do
			gtk_status_icon_set_tooltip (handle, default_pointer)
		end

	set_visible (a_setting: INTEGER)
			-- Shows or hides a status icon. `a_setting' is True to show
			-- the status icon, False to hide it
		do
			gtk_status_icon_set_visible (handle, a_setting)
		end

	is_visible: BOOLEAN
			-- Is the status icon visible? Note that being visible does
			-- not guarantee that the user can actually see the icon, see
			-- also `is_embedded'.
		do
			Result:=gtk_status_icon_get_visible(handle).to_boolean
		end

	set_blinking (a_setting: BOOLEAN)
			-- Makes the status icon start or stop blinking; `a_setting'
			-- is True to turn blinking on, False to turn it off. Note
			-- that blinking user interface elements may be problematic
			-- for some users, and thus may be turned off, in which case
			-- this setting has no effect.
		do
			gtk_status_icon_set_blinking (handle, a_setting.to_integer)
		end

	is_blinking: BOOLEAN
			-- Is icon blinking? See also `set_blinking'.
		do
			Result := gtk_status_icon_get_blinking(handle).to_boolean
		end

	is_embedded: BOOLEAN
			-- Is the status icon embedded in a notification area?
		do
			Result := gtk_status_icon_is_embedded(handle).to_boolean
		end

	-- TODO: menu_position: TUPLE [INTEGER,INTEGER,BOOLEAN] is local
	--an_x, an_y, a_push_in_bool: INTEGER do
	--gtk_status_icon_position_menu (GtkMenu *menu, gint *x, gint *y,
	--gboolean *push_in, gpointer user_data);
	
	-- Menu positioning function to use with gtk_menu_popup() to position menu aligned to the status icon user_data.
	
	-- menu : the GtkMenu x : return location for the x position y :
	-- return location for the y position push_in : return location for
	-- whether the menu should be pushed in to be completely inside the
	-- screen instead of just clamped to the size to the screen.
	-- user_data : the status icon to position the menu on

	-- TODO: gtk_status_icon_get_geometry ()
	
	-- gboolean gtk_status_icon_get_geometry (GtkStatusIcon
	-- *status_icon, GdkScreen **screen, GdkRectangle *area,
	-- GtkOrientation *orientation);

	-- Obtains information about the location of the status icon on
	-- screen. This information can be used to e.g. position popups
	-- like notification bubbles.
	
	-- See gtk_status_icon_position_menu() for a more convenient
	-- alternative for positioning menus.
	
	-- Note that some platforms do not allow GTK+ to provide this
	-- information, and even on platforms that do allow it, the
	-- information is not reliable unless the status icon is embedded
	-- in a notification area, see gtk_status_icon_is_embedded().
	
	-- status_icon : 	a GtkStatusIcon
	-- screen : 	return location for the screen, or NULL if the information is not needed
	-- area : 	return location for the area occupied by the status icon, or NULL
	-- orientation : 	return location for the orientation of the panel in which the status icon is embedded, or NULL. A panel at the top or bottom of the screen is horizontal, a panel at the left or right is vertical.
	-- Returns : 	TRUE if the location information has been filled in

feature {ANY} -- TODO: Signals
-- The "activate" signal

-- void        user_function                  (GtkStatusIcon *status_icon,
--                                             gpointer       user_data)        : Run first / Action

-- Gets emitted when the user activates the status icon. If and how status icons can activated is platform-dependent.

-- status_icon : 	the object which received the signal
-- user_data : 	user data set when the signal handler was connected.

-- Since 2.10
-- The "popup-menu" signal

-- void        user_function                  (GtkStatusIcon *status_icon,
--                                             guint          button,
--                                             guint          activate_time,
--                                             gpointer       user_data)          : Run first / Action

-- Gets emitted when the user brings up the context menu of the status icon. Whether status icons can have context menus and how these are activated is platform-dependent.

-- The button and activate_timeout parameters should be passed as the last to arguments to gtk_menu_popup().

-- status_icon : 	the object which received the signal
-- button : 	the button that was pressed, or 0 if the signal is not emitted in response to a button press event
-- activate_time : 	the timestamp of the event that triggered the signal emission
-- user_data : 	user data set when the signal handler was connected.

-- Since 2.10
-- The "size-changed" signal

-- gboolean    user_function                  (GtkStatusIcon *status_icon,
--                                             gint           size,
--                                             gpointer       user_data)        : Run last

-- Gets emitted when the size available for the image changes, e.g. because the notification area got resized.

-- status_icon : 	the object which received the signal
-- size : 	the new size
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	TRUE if the icon was updated for the new size. Otherwise, GTK+ will scale the icon as necessary.

	-- Properties

--   "blinking"             gboolean              : Read / Write
--   "file"                 gchararray            : Write
--   "icon-name"            gchararray            : Read / Write
--   "pixbuf"               GdkPixbuf             : Read / Write
--   "size"                 gint                  : Read
--   "stock"                gchararray            : Read / Write
--   "storage-type"         GtkImageType          : Read
--   "visible"              gboolean              : Read / Write

-- Signals

-- "activate"  void        user_function      (GtkStatusIcon *status_icon,
--                                             gpointer       user_data)        : Run first / Action
-- "popup-menu"
--             void        user_function      (GtkStatusIcon *status_icon,
--                                             guint          button,
--                                             guint          activate_time,
--                                             gpointer       user_data)          : Run first / Action
-- "size-changed"
--             gboolean    user_function      (GtkStatusIcon *status_icon,
--                                             gint           size,
--                                             gpointer       user_data)        : Run last

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkStatusIcon)"
		end

	

feature {} -- External calls
	gtk_status_icon_new: POINTER
			-- GtkStatusIcon* gtk_status_icon_new (void);
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_new_from_pixbuf (a_pixbuf: POINTER): POINTER
			-- GtkStatusIcon* gtk_status_icon_new_from_pixbuf (GdkPixbuf *pixbuf)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_status_icon_new_from_file (a_filename: POINTER): POINTER
			-- GtkStatusIcon* gtk_status_icon_new_from_file (const gchar *filename)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_new_from_stock (a_stock_id: POINTER): POINTER
			-- GtkStatusIcon* gtk_status_icon_new_from_stock (const gchar *stock_id)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_new_from_icon_name (an_icon_name: POINTER): POINTER
			-- GtkStatusIcon* gtk_status_icon_new_from_icon_name (const gchar *icon_name)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_set_from_pixbuf (a_status_icon, a_pixbuf: POINTER)
			-- void gtk_status_icon_set_from_pixbuf (GtkStatusIcon *status_icon, GdkPixbuf *pixbuf)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_status_icon_set_from_file (a_status_icon, a_filename: POINTER)
			-- void gtk_status_icon_set_from_file (GtkStatusIcon *status_icon, const gchar *filename)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_set_from_stock (a_status_icon, a_stock_id: POINTER)
			-- void gtk_status_icon_set_from_stock (GtkStatusIcon *status_icon, const gchar *stock_id)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_status_icon_set_from_icon_name (a_status_icon, an_icon_name: POINTER)
			-- void gtk_status_icon_set_from_icon_name (GtkStatusIcon *status_icon, const gchar *icon_name)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_get_storage_type (a_status_icon: POINTER): INTEGER
			-- GtkImageType gtk_status_icon_get_storage_type (GtkStatusIcon *status_icon)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_get_pixbuf (a_status_icon: POINTER): POINTER
			-- GdkPixbuf* gtk_status_icon_get_pixbuf (GtkStatusIcon *status_icon)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_get_stock (a_status_icon: POINTER): POINTER
			-- const gchar* gtk_status_icon_get_stock (GtkStatusIcon *status_icon)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_get_icon_name (a_status_icon: POINTER): POINTER
			-- const gchar* gtk_status_icon_get_icon_name (GtkStatusIcon *status_icon)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_get_size (a_status_icon: POINTER): INTEGER
			-- gint gtk_status_icon_get_size (GtkStatusIcon *status_icon)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_set_tooltip (a_status_icon, a_tooltip_text: POINTER)
			-- void gtk_status_icon_set_tooltip (GtkStatusIcon *status_icon, const gchar *tooltip_text)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_set_visible (a_status_icon: POINTER; visible_bool: INTEGER)
			-- void gtk_status_icon_set_visible (GtkStatusIcon *status_icon, gboolean visible)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_get_visible (a_status_icon: POINTER): INTEGER
			-- gboolean gtk_status_icon_get_visible (GtkStatusIcon *status_icon)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_set_blinking (a_status_icon: POINTER; blinking_bool: INTEGER)
			-- void gtk_status_icon_set_blinking (GtkStatusIcon *status_icon, gboolean blinking)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_get_blinking (a_status_icon: POINTER): INTEGER
			-- gboolean gtk_status_icon_get_blinking (GtkStatusIcon *status_icon)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_is_embedded (a_status_icon: POINTER): INTEGER
			-- gboolean gtk_status_icon_is_embedded (GtkStatusIcon *status_icon)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_position_menu (a_menu, an_x, a_y, a_push_in_bool, user_data: POINTER)
			-- void gtk_status_icon_position_menu (GtkMenu *menu, gint
			-- *x, gint *y, gboolean *push_in, gpointer user_data)
		external "C use <gtk/gtk.h>"
		end

	gtk_status_icon_get_geometry (a_status_icon, a_screen_ref, a_gdkrectangle_area, a_gtk_orientation: POINTER): INTEGER
			-- gboolean gtk_status_icon_get_geometry (GtkStatusIcon
			-- *status_icon, GdkScreen **screen, GdkRectangle *area,
			-- GtkOrientation *orientation)
		external "C use <gtk/gtk.h>"
		end
end -- class GTK_STATUS_ICON
