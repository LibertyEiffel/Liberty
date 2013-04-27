-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPLUG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkplug_struct_set_socket_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for socket_window field of GTKPLUG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplug_struct_set_socket_window"
		}"
		end

	gtkplug_struct_set_modality_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for modality_window field of GTKPLUG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplug_struct_set_modality_window"
		}"
		end

	gtkplug_struct_set_modality_group (a_structure: POINTER; a_value: POINTER) is
			-- Setter for modality_group field of GTKPLUG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplug_struct_set_modality_group"
		}"
		end

	gtkplug_struct_set_grabbed_keys (a_structure: POINTER; a_value: POINTER) is
			-- Setter for grabbed_keys field of GTKPLUG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplug_struct_set_grabbed_keys"
		}"
		end

	gtkplug_struct_set_same_app (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for same_app field of GTKPLUG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplug_struct_set_same_app"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field window.
	gtkplug_struct_get_socket_window (a_structure: POINTER): POINTER is
			-- Query for socket_window field of GTKPLUG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplug_struct_get_socket_window"
		}"
		end

	gtkplug_struct_get_modality_window (a_structure: POINTER): POINTER is
			-- Query for modality_window field of GTKPLUG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplug_struct_get_modality_window"
		}"
		end

	gtkplug_struct_get_modality_group (a_structure: POINTER): POINTER is
			-- Query for modality_group field of GTKPLUG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplug_struct_get_modality_group"
		}"
		end

	gtkplug_struct_get_grabbed_keys (a_structure: POINTER): POINTER is
			-- Query for grabbed_keys field of GTKPLUG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplug_struct_get_grabbed_keys"
		}"
		end

	gtkplug_struct_get_same_app (a_structure: POINTER): NATURAL_32 is
			-- Query for same_app field of GTKPLUG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkplug_struct_get_same_app"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkPlug"
		}"
		end

end -- class GTKPLUG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

