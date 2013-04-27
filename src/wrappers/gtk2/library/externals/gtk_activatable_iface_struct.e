-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ACTIVATABLE_IFACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_activatable_iface_struct_set_update (a_structure: POINTER; a_value: POINTER) is
			-- Setter for update field of GTK_ACTIVATABLE_IFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_iface_struct_set_update"
		}"
		end

	gtk_activatable_iface_struct_set_sync_action_properties (a_structure: POINTER; a_value: POINTER) is
			-- Setter for sync_action_properties field of GTK_ACTIVATABLE_IFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_iface_struct_set_sync_action_properties"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_iface.
	gtk_activatable_iface_struct_get_update (a_structure: POINTER): POINTER is
			-- Query for update field of GTK_ACTIVATABLE_IFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_iface_struct_get_update"
		}"
		end

	gtk_activatable_iface_struct_get_sync_action_properties (a_structure: POINTER): POINTER is
			-- Query for sync_action_properties field of GTK_ACTIVATABLE_IFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_iface_struct_get_sync_action_properties"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkActivatableIface"
		}"
		end

end -- class GTK_ACTIVATABLE_IFACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

