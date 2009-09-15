-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_THREAD_POOL_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gthreadpool_struct_set_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for func field of GThreadPool structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthreadpool_struct_set_func"
		}"
		end

	gthreadpool_struct_set_user_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for user_data field of GThreadPool structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthreadpool_struct_set_user_data"
		}"
		end

	gthreadpool_struct_set_exclusive (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for exclusive field of GThreadPool structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthreadpool_struct_set_exclusive"
		}"
		end

feature {} -- Low-level queries

	gthreadpool_struct_get_func (a_structure: POINTER): POINTER is
			-- Query for func field of GThreadPool structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthreadpool_struct_get_func"
		}"
		end

	gthreadpool_struct_get_user_data (a_structure: POINTER): POINTER is
			-- Query for user_data field of GThreadPool structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthreadpool_struct_get_user_data"
		}"
		end

	gthreadpool_struct_get_exclusive (a_structure: POINTER): INTEGER_32 is
			-- Query for exclusive field of GThreadPool structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthreadpool_struct_get_exclusive"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GThreadPool"
		}"
		end

end
