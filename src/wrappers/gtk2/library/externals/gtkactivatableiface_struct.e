-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACTIVATABLEIFACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkactivatableiface_struct_set_update (a_structure: POINTER; a_value: POINTER) is
			-- Setter for update field of GTKACTIVATABLEIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactivatableiface_struct_set_update"
		}"
		end

	gtkactivatableiface_struct_set_sync_action_properties (a_structure: POINTER; a_value: POINTER) is
			-- Setter for sync_action_properties field of GTKACTIVATABLEIFACE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactivatableiface_struct_set_sync_action_properties"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_iface.
	gtkactivatableiface_struct_get_update (a_structure: POINTER): POINTER is
			-- Query for update field of GTKACTIVATABLEIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactivatableiface_struct_get_update"
		}"
		end

	gtkactivatableiface_struct_get_sync_action_properties (a_structure: POINTER): POINTER is
			-- Query for sync_action_properties field of GTKACTIVATABLEIFACE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkactivatableiface_struct_get_sync_action_properties"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkActivatableIface"
		}"
		end

end -- class GTKACTIVATABLEIFACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

