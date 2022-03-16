note
	description: "Accelerator Maps -- Loadable keyboard accelerator specifications."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GTK+ team
					
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

class GTK_ACCELERATOR_MAP

inherit 
	C_STRUCT 
		redefine default_create 
		end
	
	C_OWNED
		redefine default_create
		end

	SINGLETON 
		undefine copy,is_equal 
		redefine default_create
		end

insert 
		GTK_ACCEL_MAPS_EXTERNALS redefine default_create end

create {ANY} default_create

feature {ANY} 
	default_create
		-- Create the singleton global GTK_ACCELERATOR_MAP object. This object
		-- is useful only for notification of changes to the accelerator map
		-- via the ::changed signal; it isn't a parameter to the other
		-- accelerator map functions.

	do
		from_external_pointer (gtk_accel_map_get)

	end

feature {} -- Unwrapped code

	--add_entry ()
	--
	-- void        gtk_accel_map_add_entry         (const gchar *accel_path,
	--                                              guint accel_key,
	--                                              GdkModifierType accel_mods);
	--
	--   Registers a new accelerator with the global accelerator map. This function
	--   should only be called once per accel_path with the canonical accel_key and
	--   accel_mods for this path. To change the accelerator during runtime
	--   programatically, use gtk_accel_map_change_entry(). The accelerator path
	--   must consist of "<WINDOWTYPE>/Category1/Category2/.../Action", where
	--   <WINDOWTYPE> should be a unique application-specific identifier, that
	--   corresponds to the kind of window the accelerator is being used in, e.g.
	--   "Gimp-Image", "Abiword-Document" or "Gnumeric-Settings". The
	--   Category1/.../Action portion is most appropriately chosen by the action
	--   the accelerator triggers, i.e. for accelerators on menu items, choose the
	--   item's menu path, e.g. "File/Save As", "Image/View/Zoom" or "Edit/Select
	--   All". So a full valid accelerator path may look like:
	--   "<Gimp-Toolbox>/File/Dialogs/Tool Options...".
	--
	--   accel_path : valid accelerator path
	--   accel_key :  the accelerator key
	--   accel_mods : the accelerator modifiers

	--  gtk_accel_map_lookup_entry ()
	--
	-- gboolean    gtk_accel_map_lookup_entry      (const gchar *accel_path,
	--                                              GtkAccelKey *key);
	--
	--   Looks up the accelerator entry for accel_path and fills in key.
	--
	--   accel_path : a valid accelerator path
	--   key :        the accelerator key to be filled in (optional)
	--   Returns :    TRUE if accel_path is known, FALSE otherwise

	--  gtk_accel_map_change_entry ()

	-- gboolean gtk_accel_map_change_entry (const gchar *accel_path,
	-- guint accel_key, GdkModifierType accel_mods, gboolean replace);

	--   Changes the accel_key and accel_mods currently associated with accel_path.
	--   Due to conflicts with other accelerators, a change may not always be
	--   possible, replace indicates whether other accelerators may be deleted to
	--   resolve such conflicts. A change will only occur if all conflicts could be
	--   resolved (which might not be the case if conflicting accelerators are
	--   locked). Successful changes are indicated by a TRUE return value.
	--
	--   accel_path : a valid accelerator path
	--   accel_key :  the new accelerator key
	--   accel_mods : the new accelerator modifiers
	--   replace :    TRUE if other accelerators may be deleted upon conflicts
	--   Returns :    TRUE if the accelerator could be changed, FALSE otherwise

	--  gtk_accel_map_load ()

	-- void        gtk_accel_map_load              (const gchar *file_name);
	--
	--   Parses a file previously saved with gtk_accel_map_save() for accelerator
	--   specifications, and propagates them accordingly.
	--
	--   file_name : a file containing accelerator specifications, in the GLib file
	--               name encoding

	--  gtk_accel_map_save ()
	--
	-- void        gtk_accel_map_save              (const gchar *file_name);
	--
	--   Saves current accelerator specifications (accelerator path, key and
	--   modifiers) to file_name. The file is written in a format suitable to be
	--   read back in by gtk_accel_map_load().
	--
	--   file_name : the name of the file to contain accelerator specifications, in
	--               the GLib file name encoding

	--  gtk_accel_map_foreach ()
	--
	-- void        gtk_accel_map_foreach           (gpointer data,
	--                                              GtkAccelMapForeach foreach_func);
	--
	--   Loops over the entries in the accelerator map whose accel path doesn't
	--   match any of the filters added with gtk_accel_map_add_filter(), and
	--   execute foreach_func on each. The signature of foreach_func is that of
	--   GtkAccelMapForeach, the changed parameter indicates whether this
	--   accelerator was changed during runtime (thus, would need saving during an
	--   accelerator map dump).
	--
	--   data :         data to be passed into foreach_func
	--   foreach_func : function to be executed for each accel map entry which is
	--                  not filtered out

	--  gtk_accel_map_load_fd ()
	--
	-- void        gtk_accel_map_load_fd           (gint fd);
	--
	--   Filedescriptor variant of gtk_accel_map_load().
	--
	--   Note that the file descriptor will not be closed by this function.
	--
	--   fd : a valid readable file descriptor

	--  gtk_accel_map_save_fd ()
	--
	-- void        gtk_accel_map_save_fd           (gint fd);
	--
	--   Filedescriptor variant of gtk_accel_map_save().
	--
	--   Note that the file descriptor will not be closed by this function.
	--
	--   fd : a valid writable file descriptor

	--  gtk_accel_map_load_scanner ()
	--
	-- void        gtk_accel_map_load_scanner      (GScanner *scanner);
	--
	--   GScanner variant of gtk_accel_map_load().
	--
	--   scanner : a GScanner which has already been provided with an input file

	--  gtk_accel_map_add_filter ()
	--
	-- void        gtk_accel_map_add_filter        (const gchar *filter_pattern);
	--
	--   Adds a filter to the global list of accel path filters.
	--
	--   Accel map entries whose accel path matches one of the filters are skipped
	--   by gtk_accel_map_foreach().
	--
	--   This function is intended for GTK+ modules that create their own menus,
	--   but don't want them to be saved into the applications accelerator map
	--   dump.
	--
	--   filter_pattern : a pattern (see GPatternSpec)

	--  gtk_accel_map_foreach_unfiltered ()
	--
	-- void        gtk_accel_map_foreach_unfiltered
	--                                             (gpointer data,
	--                                              GtkAccelMapForeach foreach_func);
	--
	--   Loops over all entries in the accelerator map, and execute foreach_func on
	--   each. The signature of foreach_func is that of GtkAccelMapForeach, the
	--   changed parameter indicates whether this accelerator was changed during
	--   runtime (thus, would need saving during an accelerator map dump).
	--
	--   data :         data to be passed into foreach_func
	--   foreach_func : function to be executed for each accel map entry

	--  gtk_accel_map_lock_path ()
	--
	-- void        gtk_accel_map_lock_path         (const gchar *accel_path);
	--
	--   Locks the given accelerator path. If the accelerator map doesn't yet
	--   contain an entry for accel_path, a new one is created.
	--
	--   Locking an accelerator path prevents its accelerator from being changed
	--   during runtime. A locked accelerator path can be unlocked by
	--   gtk_accel_map_unlock_path(). Refer to gtk_accel_map_change_entry() for
	--   information about runtime accelerator changes.
	--
	--   If called more than once, accel_path remains locked until
	--   gtk_accel_map_unlock_path() has been called an equivalent number of times.
	--
	--   Note that locking of individual accelerator paths is independent from
	--   locking the GtkAccelGroup containing them. For runtime accelerator changes
	--   to be possible both the accelerator path and its GtkAccelGroup have to be
	--   unlocked.
	--
	--   accel_path : a valid accelerator path
	--
	--   Since 2.4

	--  gtk_accel_map_unlock_path ()
	--
	-- void        gtk_accel_map_unlock_path       (const gchar *accel_path);
	--
	--   Undoes the last call to gtk_accel_map_lock_path() on this accel_path.
	--   Refer to gtk_accel_map_lock_path() for information about accelerator path
	--   locking.
	--
	--   accel_path : a valid accelerator path
	--
	--   Since 2.4
	--
	--Signals
	--
	-- "changed"   void        user_function      (GtkAccelMap    *object,
	--                                             gchar          *accel_path,
	--                                             guint           accel_key,
	--                                             GdkModifierType accel_mods,
	--                                             gpointer        user_data)       : Run last / Has 
	--                                             details
	--Signal Details
	--
	--  The "changed" signal
	--
	-- void        user_function                  (GtkAccelMap    *object,
	--                                             gchar          *accel_path,
	--                                             guint           accel_key,
	--                                             GdkModifierType accel_mods,
	--                                             gpointer        user_data)       : Run last / Has details
	--
	--   Notifies of a change in the global accelerator map. The path is also used
	--   as the detail for the signal, so it is possible to connect to
	--   changed::accel_path.
	--
	--   object :     the global accel map object
	--   accel_path : the path of the accelerator that changed
	--   accel_key :  the key value for the new accelerator
	--   accel_mods : the modifier mask for the new accelerator
	--   user_data :  user data set when the signal handler was connected.
	--
	--   Since 2.4

	--  GtkAccelMapForeach ()
	--
	-- void        (*GtkAccelMapForeach)           (gpointer data,
	--                                              const gchar *accel_path,
	--                                              guint accel_key,
	--                                              GdkModifierType accel_mods,
	--                                              gboolean changed);
	--
	--   data :
	--   accel_path :
	--   accel_key :
	--   accel_mods :
	--   changed :


end -- class GTK_ACCELERATOR_MAP
