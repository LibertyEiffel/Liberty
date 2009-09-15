-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_COMPLETION_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gcompletion_struct_set_items (a_structure: POINTER; a_value: POINTER) is
			-- Setter for items field of GCompletion structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gcompletion_struct_set_items"
		}"
		end

	gcompletion_struct_set_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for func field of GCompletion structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gcompletion_struct_set_func"
		}"
		end

	gcompletion_struct_set_prefix (a_structure: POINTER; a_value: POINTER) is
			-- Setter for prefix field of GCompletion structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gcompletion_struct_set_prefix"
		}"
		end

	gcompletion_struct_set_cache (a_structure: POINTER; a_value: POINTER) is
			-- Setter for cache field of GCompletion structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gcompletion_struct_set_cache"
		}"
		end

	gcompletion_struct_set_strncmp_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for strncmp_func field of GCompletion structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gcompletion_struct_set_strncmp_func"
		}"
		end

feature {} -- Low-level queries

	gcompletion_struct_get_items (a_structure: POINTER): POINTER is
			-- Query for items field of GCompletion structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gcompletion_struct_get_items"
		}"
		end

	gcompletion_struct_get_func (a_structure: POINTER): POINTER is
			-- Query for func field of GCompletion structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gcompletion_struct_get_func"
		}"
		end

	gcompletion_struct_get_prefix (a_structure: POINTER): POINTER is
			-- Query for prefix field of GCompletion structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gcompletion_struct_get_prefix"
		}"
		end

	gcompletion_struct_get_cache (a_structure: POINTER): POINTER is
			-- Query for cache field of GCompletion structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gcompletion_struct_get_cache"
		}"
		end

	gcompletion_struct_get_strncmp_func (a_structure: POINTER): POINTER is
			-- Query for strncmp_func field of GCompletion structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gcompletion_struct_get_strncmp_func"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GCompletion"
		}"
		end

end
