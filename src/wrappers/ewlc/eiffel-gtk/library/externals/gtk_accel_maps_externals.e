note
	description: "External calls for GTK_ACCEL_MAPS"
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ACCEL_MAPS_EXTERNALS
	
inherit ANY undefine is_equal, copy end

feature {} -- Callbacks
	-- void (*GtkAccelMapForeach) (gpointer data, const gchar
	-- *accel_path, guint accel_key, GdkModifierType accel_mods,
	-- gboolean changed);

feature {} -- External calls
	gtk_accel_map_add_entry (accel_path: POINTER; accel_key, accel_mods: INTEGER) is
		-- void gtk_accel_map_add_entry (const gchar *accel_path, guint
		-- accel_key, GdkModifierType accel_mods);
		
		-- TODO: accel_key should be a NATURAL since it is a guint
	external "C use <gtk/gtk.h>"
	end
	
	gtk_accel_map_lookup_entry (accel_path, a_key: POINTER): INTEGER is
			-- gboolean gtk_accel_map_lookup_entry (const gchar
			-- *accel_path, GtkAccelKey *key);
		external "C use <gtk/gtk.h>"
		end

	gtk_accel_map_change_entry (an_accel_path: POINTER; an_accel_key,accel_mods_guint, replace_boolean: INTEGER ): INTEGER is
			-- gboolean gtk_accel_map_change_entry (const gchar
			-- *accel_path, guint accel_key, GdkModifierType accel_mods,
			-- gboolean replace);

			-- TODO: accel_mods_guint should be NATURAL since it is a
			-- guint.
	external "C use <gtk/gtk.h>"
	end

	gtk_accel_map_load (a_file_name: POINTER) is
			-- void gtk_accel_map_load (const gchar *file_name);
		external "C use <gtk/gtk.h>"
		end

	gtk_accel_map_save (a_file_name: POINTER) is
			-- void gtk_accel_map_save (const gchar *file_name);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_accel_map_foreach (some_data, a_gtk_accelmap_foreach_func: POINTER) is
			-- void gtk_accel_map_foreach (gpointer data,
			-- GtkAccelMapForeach foreach_func);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_accel_map_load_fd (an_fd: INTEGER) is
			-- void gtk_accel_map_load_fd (gint fd);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_accel_map_save_fd (an_fd: INTEGER) is
			-- void gtk_accel_map_save_fd (gint fd);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_accel_map_load_scanner (a_scanner: POINTER) is
			-- void gtk_accel_map_load_scanner (GScanner *scanner);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_accel_map_add_filter (a_filter_pattern: POINTER) is
			-- void gtk_accel_map_add_filter (const gchar
			-- *filter_pattern);
		external "C use <gtk/gtk.h>"
		end

	gtk_accel_map_foreach_unfiltered (some_data, a_gtk_accelmap_foreach_func: POINTER) is
			-- void gtk_accel_map_foreach_unfiltered (gpointer data,
			-- GtkAccelMapForeach foreach_func);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_accel_map_get: POINTER is
			-- GtkAccelMap* gtk_accel_map_get (void);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_accel_map_lock_path (an_accel_path: POINTER) is
			-- void gtk_accel_map_lock_path (const gchar *accel_path);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_accel_map_unlock_path (an_accel_path: POINTER) is
		-- void gtk_accel_map_unlock_path (const gchar *accel_path);
		external "C use <gtk/gtk.h>"
		end
	
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkAccelMap)"
		end
end
