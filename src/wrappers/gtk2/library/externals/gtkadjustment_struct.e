-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKADJUSTMENT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkadjustment_struct_set_lower (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for lower field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_set_lower"
		}"
		end

	gtkadjustment_struct_set_upper (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for upper field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_set_upper"
		}"
		end

	gtkadjustment_struct_set_value (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for value field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_set_value"
		}"
		end

	gtkadjustment_struct_set_step_increment (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for step_increment field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_set_step_increment"
		}"
		end

	gtkadjustment_struct_set_page_increment (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for page_increment field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_set_page_increment"
		}"
		end

	gtkadjustment_struct_set_page_size (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for page_size field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_set_page_size"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtkadjustment_struct_get_lower (a_structure: POINTER): REAL_64 is
			-- Query for lower field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_get_lower"
		}"
		end

	gtkadjustment_struct_get_upper (a_structure: POINTER): REAL_64 is
			-- Query for upper field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_get_upper"
		}"
		end

	gtkadjustment_struct_get_value (a_structure: POINTER): REAL_64 is
			-- Query for value field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_get_value"
		}"
		end

	gtkadjustment_struct_get_step_increment (a_structure: POINTER): REAL_64 is
			-- Query for step_increment field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_get_step_increment"
		}"
		end

	gtkadjustment_struct_get_page_increment (a_structure: POINTER): REAL_64 is
			-- Query for page_increment field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_get_page_increment"
		}"
		end

	gtkadjustment_struct_get_page_size (a_structure: POINTER): REAL_64 is
			-- Query for page_size field of GTKADJUSTMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustment_struct_get_page_size"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAdjustment"
		}"
		end

end -- class GTKADJUSTMENT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

