-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSLIST_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gslist_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GSLIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gslist_struct_set_data"
		}"
		end

	gslist_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of GSLIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gslist_struct_set_next"
		}"
		end

feature {} -- Low-level queries

	gslist_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GSLIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gslist_struct_get_data"
		}"
		end

	gslist_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of GSLIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gslist_struct_get_next"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GSList"
		}"
		end

end -- class GSLIST_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

