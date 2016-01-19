-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTHREADPOOL_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gthreadpool_struct_set_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for func field of GTHREADPOOL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthreadpool_struct_set_func"
		}"
		end

	gthreadpool_struct_set_user_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for user_data field of GTHREADPOOL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthreadpool_struct_set_user_data"
		}"
		end

	gthreadpool_struct_set_exclusive (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for exclusive field of GTHREADPOOL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthreadpool_struct_set_exclusive"
		}"
		end

feature {} -- Low-level queries

	gthreadpool_struct_get_func (a_structure: POINTER): POINTER is
			-- Query for func field of GTHREADPOOL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthreadpool_struct_get_func"
		}"
		end

	gthreadpool_struct_get_user_data (a_structure: POINTER): POINTER is
			-- Query for user_data field of GTHREADPOOL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthreadpool_struct_get_user_data"
		}"
		end

	gthreadpool_struct_get_exclusive (a_structure: POINTER): INTEGER_32 is
			-- Query for exclusive field of GTHREADPOOL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthreadpool_struct_get_exclusive"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GThreadPool"
		}"
		end

end -- class GTHREADPOOL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

