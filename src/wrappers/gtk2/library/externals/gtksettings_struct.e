-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSETTINGS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtksettings_struct_set_queued_settings (a_structure: POINTER; a_value: POINTER) is
			-- Setter for queued_settings field of GTKSETTINGS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksettings_struct_set_queued_settings"
		}"
		end

	gtksettings_struct_set_property_values (a_structure: POINTER; a_value: POINTER) is
			-- Setter for property_values field of GTKSETTINGS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksettings_struct_set_property_values"
		}"
		end

	gtksettings_struct_set_rc_context (a_structure: POINTER; a_value: POINTER) is
			-- Setter for rc_context field of GTKSETTINGS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksettings_struct_set_rc_context"
		}"
		end

	gtksettings_struct_set_screen (a_structure: POINTER; a_value: POINTER) is
			-- Setter for screen field of GTKSETTINGS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksettings_struct_set_screen"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtksettings_struct_get_queued_settings (a_structure: POINTER): POINTER is
			-- Query for queued_settings field of GTKSETTINGS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksettings_struct_get_queued_settings"
		}"
		end

	gtksettings_struct_get_property_values (a_structure: POINTER): POINTER is
			-- Query for property_values field of GTKSETTINGS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksettings_struct_get_property_values"
		}"
		end

	gtksettings_struct_get_rc_context (a_structure: POINTER): POINTER is
			-- Query for rc_context field of GTKSETTINGS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksettings_struct_get_rc_context"
		}"
		end

	gtksettings_struct_get_screen (a_structure: POINTER): POINTER is
			-- Query for screen field of GTKSETTINGS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtksettings_struct_get_screen"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkSettings"
		}"
		end

end -- class GTKSETTINGS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

