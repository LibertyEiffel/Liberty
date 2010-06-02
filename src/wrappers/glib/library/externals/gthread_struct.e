-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTHREAD_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
feature {} -- Low-level setters

	gthread_struct_set_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for func field of GTHREAD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthread_struct_set_func"
		}"
		end

	gthread_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GTHREAD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthread_struct_set_data"
		}"
		end

	gthread_struct_set_joinable (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for joinable field of GTHREAD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthread_struct_set_joinable"
		}"
		end

	gthread_struct_set_priority (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for priority field of GTHREAD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthread_struct_set_priority"
		}"
		end

feature {} -- Low-level queries

	gthread_struct_get_func (a_structure: POINTER): POINTER is
			-- Query for func field of GTHREAD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthread_struct_get_func"
		}"
		end

	gthread_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GTHREAD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthread_struct_get_data"
		}"
		end

	gthread_struct_get_joinable (a_structure: POINTER): INTEGER_32 is
			-- Query for joinable field of GTHREAD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthread_struct_get_joinable"
		}"
		end

	gthread_struct_get_priority (a_structure: POINTER): INTEGER is
			-- Query for priority field of GTHREAD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gthread_struct_get_priority"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GThread"
		}"
		end

end -- class GTHREAD_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

