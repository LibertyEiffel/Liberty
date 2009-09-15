-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_QUEUE_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gqueue_struct_set_head (a_structure: POINTER; a_value: POINTER) is
			-- Setter for head field of GQueue structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gqueue_struct_set_head"
		}"
		end

	gqueue_struct_set_tail (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tail field of GQueue structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gqueue_struct_set_tail"
		}"
		end

	gqueue_struct_set_length (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for length field of GQueue structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gqueue_struct_set_length"
		}"
		end

feature {} -- Low-level queries

	gqueue_struct_get_head (a_structure: POINTER): POINTER is
			-- Query for head field of GQueue structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gqueue_struct_get_head"
		}"
		end

	gqueue_struct_get_tail (a_structure: POINTER): POINTER is
			-- Query for tail field of GQueue structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gqueue_struct_get_tail"
		}"
		end

	gqueue_struct_get_length (a_structure: POINTER): NATURAL_32 is
			-- Query for length field of GQueue structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gqueue_struct_get_length"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GQueue"
		}"
		end

end
