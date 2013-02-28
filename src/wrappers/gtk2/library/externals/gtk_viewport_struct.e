-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_VIEWPORT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_viewport_struct_set_shadow_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for shadow_type field of GTK_VIEWPORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_struct_set_shadow_type"
		}"
		end

	gtk_viewport_struct_set_view_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for view_window field of GTK_VIEWPORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_struct_set_view_window"
		}"
		end

	gtk_viewport_struct_set_bin_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for bin_window field of GTK_VIEWPORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_struct_set_bin_window"
		}"
		end

	gtk_viewport_struct_set_hadjustment (a_structure: POINTER; a_value: POINTER) is
			-- Setter for hadjustment field of GTK_VIEWPORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_struct_set_hadjustment"
		}"
		end

	gtk_viewport_struct_set_vadjustment (a_structure: POINTER; a_value: POINTER) is
			-- Setter for vadjustment field of GTK_VIEWPORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_struct_set_vadjustment"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field bin.
	gtk_viewport_struct_get_shadow_type (a_structure: POINTER): INTEGER is
			-- Query for shadow_type field of GTK_VIEWPORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_struct_get_shadow_type"
		}"
		end

	gtk_viewport_struct_get_view_window (a_structure: POINTER): POINTER is
			-- Query for view_window field of GTK_VIEWPORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_struct_get_view_window"
		}"
		end

	gtk_viewport_struct_get_bin_window (a_structure: POINTER): POINTER is
			-- Query for bin_window field of GTK_VIEWPORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_struct_get_bin_window"
		}"
		end

	gtk_viewport_struct_get_hadjustment (a_structure: POINTER): POINTER is
			-- Query for hadjustment field of GTK_VIEWPORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_struct_get_hadjustment"
		}"
		end

	gtk_viewport_struct_get_vadjustment (a_structure: POINTER): POINTER is
			-- Query for vadjustment field of GTK_VIEWPORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_viewport_struct_get_vadjustment"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkViewport"
		}"
		end

end -- class GTK_VIEWPORT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

