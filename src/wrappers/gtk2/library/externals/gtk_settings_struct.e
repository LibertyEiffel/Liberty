-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_SETTINGS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_settings_struct_set_queued_settings (a_structure: POINTER; a_value: POINTER) is
			-- Setter for queued_settings field of GTK_SETTINGS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_struct_set_queued_settings"
		}"
		end

	gtk_settings_struct_set_property_values (a_structure: POINTER; a_value: POINTER) is
			-- Setter for property_values field of GTK_SETTINGS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_struct_set_property_values"
		}"
		end

	gtk_settings_struct_set_rc_context (a_structure: POINTER; a_value: POINTER) is
			-- Setter for rc_context field of GTK_SETTINGS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_struct_set_rc_context"
		}"
		end

	gtk_settings_struct_set_screen (a_structure: POINTER; a_value: POINTER) is
			-- Setter for screen field of GTK_SETTINGS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_struct_set_screen"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_settings_struct_get_queued_settings (a_structure: POINTER): POINTER is
			-- Query for queued_settings field of GTK_SETTINGS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_struct_get_queued_settings"
		}"
		end

	gtk_settings_struct_get_property_values (a_structure: POINTER): POINTER is
			-- Query for property_values field of GTK_SETTINGS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_struct_get_property_values"
		}"
		end

	gtk_settings_struct_get_rc_context (a_structure: POINTER): POINTER is
			-- Query for rc_context field of GTK_SETTINGS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_struct_get_rc_context"
		}"
		end

	gtk_settings_struct_get_screen (a_structure: POINTER): POINTER is
			-- Query for screen field of GTK_SETTINGS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_struct_get_screen"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkSettings"
		}"
		end

end -- class GTK_SETTINGS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

