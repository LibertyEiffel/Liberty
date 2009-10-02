-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_STATIC_PRIVATE_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gstaticprivate_struct_set_index (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for index field of GStaticPrivate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticprivate_struct_set_index"
		}"
		end

feature {} -- Low-level queries

	gstaticprivate_struct_get_index (a_structure: POINTER): NATURAL_32 is
			-- Query for index field of GStaticPrivate structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gstaticprivate_struct_get_index"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GStaticPrivate"
		}"
		end

end
