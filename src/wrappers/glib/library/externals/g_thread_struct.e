-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_THREAD_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gthread_struct_set_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for func field of GThread structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthread_struct_set_func"
		}"
		end

	gthread_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GThread structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthread_struct_set_data"
		}"
		end

	gthread_struct_set_joinable (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for joinable field of GThread structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthread_struct_set_joinable"
		}"
		end

	gthread_struct_set_priority (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for priority field of GThread structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthread_struct_set_priority"
		}"
		end

feature {} -- Low-level queries

	gthread_struct_get_func (a_structure: POINTER): POINTER is
			-- Query for func field of GThread structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthread_struct_get_func"
		}"
		end

	gthread_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GThread structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthread_struct_get_data"
		}"
		end

	gthread_struct_get_joinable (a_structure: POINTER): INTEGER_32 is
			-- Query for joinable field of GThread structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthread_struct_get_joinable"
		}"
		end

	gthread_struct_get_priority (a_structure: POINTER): INTEGER_32 is
			-- Query for priority field of GThread structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gthread_struct_get_priority"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GThread"
		}"
		end

end
