-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CAIRO_PATH_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

	cairo_path_struct_set_status (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for status field of CAIRO_PATH_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_path_struct_set_status"
		}"
		end

	cairo_path_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of CAIRO_PATH_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_path_struct_set_data"
		}"
		end

	cairo_path_struct_set_num_data (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for num_data field of CAIRO_PATH_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_path_struct_set_num_data"
		}"
		end

feature {} -- Low-level queries

	cairo_path_struct_get_status (a_structure: POINTER): INTEGER is
			-- Query for status field of CAIRO_PATH_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_path_struct_get_status"
		}"
		end

	cairo_path_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of CAIRO_PATH_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_path_struct_get_data"
		}"
		end

	cairo_path_struct_get_num_data (a_structure: POINTER): INTEGER is
			-- Query for num_data field of CAIRO_PATH_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_path_struct_get_num_data"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_cairo_path"
		}"
		end

end -- class CAIRO_PATH_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

