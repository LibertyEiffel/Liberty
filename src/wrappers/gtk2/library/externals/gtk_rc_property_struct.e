-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_RC_PROPERTY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_rc_property_struct_set_type_name (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for type_name field of GTK_RC_PROPERTY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_property_struct_set_type_name"
		}"
		end

	gtk_rc_property_struct_set_property_name (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for property_name field of GTK_RC_PROPERTY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_property_struct_set_property_name"
		}"
		end

	gtk_rc_property_struct_set_origin (a_structure: POINTER; a_value: POINTER) is
			-- Setter for origin field of GTK_RC_PROPERTY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_property_struct_set_origin"
		}"
		end

feature {} -- Low-level queries

	gtk_rc_property_struct_get_type_name (a_structure: POINTER): NATURAL is
			-- Query for type_name field of GTK_RC_PROPERTY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_property_struct_get_type_name"
		}"
		end

	gtk_rc_property_struct_get_property_name (a_structure: POINTER): NATURAL is
			-- Query for property_name field of GTK_RC_PROPERTY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_property_struct_get_property_name"
		}"
		end

	gtk_rc_property_struct_get_origin (a_structure: POINTER): POINTER is
			-- Query for origin field of GTK_RC_PROPERTY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rc_property_struct_get_origin"
		}"
		end

	-- Unwrappable field value.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRcProperty"
		}"
		end

end -- class GTK_RC_PROPERTY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

