-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GVARIANT_ITER_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
feature {} -- Low-level setters

	gvariant_iter_struct_set_x (a_structure: POINTER; a_value: POINTER) is
			-- Setter for x field of GVARIANT_ITER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gvariant_iter_struct_set_x"
		}"
		end

feature {} -- Low-level queries

	gvariant_iter_struct_get_x (a_structure: POINTER): POINTER is
			-- Query for x field of GVARIANT_ITER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gvariant_iter_struct_get_x"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GVariantIter"
		}"
		end

end -- class GVARIANT_ITER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

