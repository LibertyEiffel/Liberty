-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ADJUSTMENT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_adjustment_struct_set_lower (a_structure: POINTER; a_value: REAL) is
			-- Setter for lower field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_set_lower"
		}"
		end

	gtk_adjustment_struct_set_upper (a_structure: POINTER; a_value: REAL) is
			-- Setter for upper field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_set_upper"
		}"
		end

	gtk_adjustment_struct_set_value (a_structure: POINTER; a_value: REAL) is
			-- Setter for value field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_set_value"
		}"
		end

	gtk_adjustment_struct_set_step_increment (a_structure: POINTER; a_value: REAL) is
			-- Setter for step_increment field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_set_step_increment"
		}"
		end

	gtk_adjustment_struct_set_page_increment (a_structure: POINTER; a_value: REAL) is
			-- Setter for page_increment field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_set_page_increment"
		}"
		end

	gtk_adjustment_struct_set_page_size (a_structure: POINTER; a_value: REAL) is
			-- Setter for page_size field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_set_page_size"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_adjustment_struct_get_lower (a_structure: POINTER): REAL is
			-- Query for lower field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_get_lower"
		}"
		end

	gtk_adjustment_struct_get_upper (a_structure: POINTER): REAL is
			-- Query for upper field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_get_upper"
		}"
		end

	gtk_adjustment_struct_get_value (a_structure: POINTER): REAL is
			-- Query for value field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_get_value"
		}"
		end

	gtk_adjustment_struct_get_step_increment (a_structure: POINTER): REAL is
			-- Query for step_increment field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_get_step_increment"
		}"
		end

	gtk_adjustment_struct_get_page_increment (a_structure: POINTER): REAL is
			-- Query for page_increment field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_get_page_increment"
		}"
		end

	gtk_adjustment_struct_get_page_size (a_structure: POINTER): REAL is
			-- Query for page_size field of GTK_ADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_adjustment_struct_get_page_size"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAdjustment"
		}"
		end

end -- class GTK_ADJUSTMENT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

