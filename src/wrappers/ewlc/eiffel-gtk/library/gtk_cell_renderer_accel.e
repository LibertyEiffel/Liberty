note
	description: "GtkCellRendererAccel -- Renders a keyboard accelerator in a cell."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "2.10.6"

class GTK_CELL_RENDERER_ACCEL
	-- GtkCellRendererAccel displays a keyboard accelerator (i.e. a key
	-- combination like <Control>-a). If the cell renderer is editable,
	-- the accelerator can be changed by simply typing the new
	-- combination.

	-- The GtkCellRendererAccel cell renderer was added in GTK+ 2.10.

inherit
	GTK_CELL_RENDERER_TEXT
		redefine make, struct_size end

insert GTK_CELL_RENDERER_ACCEL_MODE
	
create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkCellRendererAccel.
		do
			from_external_pointer(gtk_cell_renderer_accel_new)
		end
	
feature {ANY} -- Properties
	--   "accel-key"            guint                 : Read / Write
	--   "accel-mode"           GtkCellRendererAccelMode  : Read / Write
	--   "accel-mods"           GdkModifierType       : Read / Write
	--   "keycode"              guint                 : Read / Write

	--Property Details
	--
	--  The "accel-key" property
	--
	--   "accel-key"            guint                 : Read / Write
	--
	--   The keyval of the accelerator.
	--
	--   Allowed values: <= G_MAXINT
	--
	--   Default value: 0
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "accel-mode" property
	--
	--   "accel-mode"           GtkCellRendererAccelMode  : Read / Write
	--
	--   Determines if the edited accelerators are GTK+ accelerators. If they are,
	--   consumed modifiers are suppressed, only accelerators accepted by GTK+ are
	--   allowed, and the accelerators are rendered in the same way as they are in
	--   menus.
	--
	--   Default value: GTK_CELL_RENDERER_ACCEL_MODE_GTK
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "accel-mods" property
	--
	--   "accel-mods"           GdkModifierType       : Read / Write
	--
	--   The modifier mask of the accelerator.
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "keycode" property
	--
	--   "keycode"              guint                 : Read / Write
	--
	--   The hardware keycode of the accelerator. Note that the hardware keycode is
	--   only relevant if the key does not have a keyval. Normally, the keyboard
	--   configuration should assign keyvals to all keys.
	--
	--   Allowed values: <= G_MAXINT
	--
	--   Default value: 0
	--
	--   Since 2.10

feature {ANY} -- Signals

	-- "accel-cleared"
	--             void        user_function      (GtkCellRendererAccel *accel,
	--                                             gchar                *path_string,
	--                                             gpointer              user_data)        : Run last
	-- "accel-edited"
	--             void        user_function      (GtkCellRendererAccel *accel,
	--                                             gchar                *path_string,
	--                                             guint                 accel_key,
	--                                             GdkModifierType       accel_mods,
	--                                             guint                 hardware_keycode,
	--                                             gpointer              user_data)             : Run last
	--Signal Details
	--
	--  The "accel-cleared" signal
	--
	-- void        user_function                  (GtkCellRendererAccel *accel,
	--                                             gchar                *path_string,
	--                                             gpointer              user_data)        : Run last
	--
	--   Gets emitted when the user has removed the accelerator.
	--
	--   accel :       the object reveiving the signal
	--   path_string : the path identifying the row of the edited cell
	--   user_data :   user data set when the signal handler was connected.
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "accel-edited" signal
	--
	-- void        user_function                  (GtkCellRendererAccel *accel,
	--                                             gchar                *path_string,
	--                                             guint                 accel_key,
	--                                             GdkModifierType       accel_mods,
	--                                             guint                 hardware_keycode,
	--                                             gpointer              user_data)             : Run last
	--
	--   Gets emitted when the user has selected a new accelerator.
	--
	--   accel :            the object reveiving the signal
	--   path_string :      the path identifying the row of the edited cell
	--   accel_key :        the new accelerator keyval
	--   accel_mods :       the new acclerator modifier mask
	--   hardware_keycode : the keycode of the new accelerator
	--   user_data :        user data set when the signal handler was connected.
	--
	--   Since 2.10

feature {} -- External calls
	gtk_cell_renderer_accel_new: POINTER
		external "C use <gtk/gtk.h>"
		end
		
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCellRendererAccel)"
		end
end -- class GTK_CELL_RENDERER_ACCEL

