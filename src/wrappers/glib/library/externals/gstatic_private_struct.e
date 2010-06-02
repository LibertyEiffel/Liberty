-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSTATIC_PRIVATE_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
feature {} -- Low-level setters

	gstatic_private_struct_set_index (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for index field of GSTATIC_PRIVATE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_private_struct_set_index"
		}"
		end

feature {} -- Low-level queries

	gstatic_private_struct_get_index (a_structure: POINTER): NATURAL_32 is
			-- Query for index field of GSTATIC_PRIVATE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gstatic_private_struct_get_index"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GStaticPrivate"
		}"
		end

end -- class GSTATIC_PRIVATE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

