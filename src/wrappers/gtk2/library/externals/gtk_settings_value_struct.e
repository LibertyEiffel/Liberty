-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_SETTINGS_VALUE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_settings_value_struct_set_origin (a_structure: POINTER; a_value: POINTER) is
			-- Setter for origin field of GTK_SETTINGS_VALUE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_value_struct_set_origin"
		}"
		end

feature {} -- Low-level queries

	gtk_settings_value_struct_get_origin (a_structure: POINTER): POINTER is
			-- Query for origin field of GTK_SETTINGS_VALUE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_settings_value_struct_get_origin"
		}"
		end

	-- Unwrappable field value.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkSettingsValue"
		}"
		end

end -- class GTK_SETTINGS_VALUE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

