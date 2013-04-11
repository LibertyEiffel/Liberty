-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCELGROUPENTRY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkaccelgroupentry_struct_set_closure (a_structure: POINTER; a_value: POINTER) is
			-- Setter for closure field of GTKACCELGROUPENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroupentry_struct_set_closure"
		}"
		end

	gtkaccelgroupentry_struct_set_accel_path_quark (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for accel_path_quark field of GTKACCELGROUPENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroupentry_struct_set_accel_path_quark"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field key.
	gtkaccelgroupentry_struct_get_closure (a_structure: POINTER): POINTER is
			-- Query for closure field of GTKACCELGROUPENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroupentry_struct_get_closure"
		}"
		end

	gtkaccelgroupentry_struct_get_accel_path_quark (a_structure: POINTER): NATURAL_32 is
			-- Query for accel_path_quark field of GTKACCELGROUPENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroupentry_struct_get_accel_path_quark"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAccelGroupEntry"
		}"
		end

end -- class GTKACCELGROUPENTRY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

