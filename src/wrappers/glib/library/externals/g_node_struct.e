-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_NODE_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gnode_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GNode structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gnode_struct_set_data"
		}"
		end

	gnode_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of GNode structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gnode_struct_set_next"
		}"
		end

	gnode_struct_set_prev (a_structure: POINTER; a_value: POINTER) is
			-- Setter for prev field of GNode structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gnode_struct_set_prev"
		}"
		end

	gnode_struct_set_parent (a_structure: POINTER; a_value: POINTER) is
			-- Setter for parent field of GNode structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gnode_struct_set_parent"
		}"
		end

	gnode_struct_set_children (a_structure: POINTER; a_value: POINTER) is
			-- Setter for children field of GNode structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gnode_struct_set_children"
		}"
		end

feature {} -- Low-level queries

	gnode_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GNode structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gnode_struct_get_data"
		}"
		end

	gnode_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of GNode structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gnode_struct_get_next"
		}"
		end

	gnode_struct_get_prev (a_structure: POINTER): POINTER is
			-- Query for prev field of GNode structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gnode_struct_get_prev"
		}"
		end

	gnode_struct_get_parent (a_structure: POINTER): POINTER is
			-- Query for parent field of GNode structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gnode_struct_get_parent"
		}"
		end

	gnode_struct_get_children (a_structure: POINTER): POINTER is
			-- Query for children field of GNode structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gnode_struct_get_children"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GNode"
		}"
		end

end
