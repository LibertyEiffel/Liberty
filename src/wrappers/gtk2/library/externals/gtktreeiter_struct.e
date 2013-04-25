-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEITER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktreeiter_struct_set_stamp (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for stamp field of GTKTREEITER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeiter_struct_set_stamp"
		}"
		end

	gtktreeiter_struct_set_user_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for user_data field of GTKTREEITER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeiter_struct_set_user_data"
		}"
		end

	gtktreeiter_struct_set_user_data2 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for user_data2 field of GTKTREEITER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeiter_struct_set_user_data2"
		}"
		end

	gtktreeiter_struct_set_user_data3 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for user_data3 field of GTKTREEITER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeiter_struct_set_user_data3"
		}"
		end

feature {} -- Low-level queries

	gtktreeiter_struct_get_stamp (a_structure: POINTER): INTEGER_32 is
			-- Query for stamp field of GTKTREEITER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeiter_struct_get_stamp"
		}"
		end

	gtktreeiter_struct_get_user_data (a_structure: POINTER): POINTER is
			-- Query for user_data field of GTKTREEITER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeiter_struct_get_user_data"
		}"
		end

	gtktreeiter_struct_get_user_data2 (a_structure: POINTER): POINTER is
			-- Query for user_data2 field of GTKTREEITER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeiter_struct_get_user_data2"
		}"
		end

	gtktreeiter_struct_get_user_data3 (a_structure: POINTER): POINTER is
			-- Query for user_data3 field of GTKTREEITER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeiter_struct_get_user_data3"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTreeIter"
		}"
		end

end -- class GTKTREEITER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

