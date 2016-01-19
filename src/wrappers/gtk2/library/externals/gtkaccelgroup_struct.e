-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCELGROUP_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkaccelgroup_struct_set_lock_count (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for lock_count field of GTKACCELGROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroup_struct_set_lock_count"
		}"
		end

	gtkaccelgroup_struct_set_modifier_mask (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for modifier_mask field of GTKACCELGROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroup_struct_set_modifier_mask"
		}"
		end

	gtkaccelgroup_struct_set_acceleratables (a_structure: POINTER; a_value: POINTER) is
			-- Setter for acceleratables field of GTKACCELGROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroup_struct_set_acceleratables"
		}"
		end

	gtkaccelgroup_struct_set_n_accels (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for n_accels field of GTKACCELGROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroup_struct_set_n_accels"
		}"
		end

	gtkaccelgroup_struct_set_priv_accels (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv_accels field of GTKACCELGROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroup_struct_set_priv_accels"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtkaccelgroup_struct_get_lock_count (a_structure: POINTER): NATURAL_32 is
			-- Query for lock_count field of GTKACCELGROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroup_struct_get_lock_count"
		}"
		end

	gtkaccelgroup_struct_get_modifier_mask (a_structure: POINTER): INTEGER is
			-- Query for modifier_mask field of GTKACCELGROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroup_struct_get_modifier_mask"
		}"
		end

	gtkaccelgroup_struct_get_acceleratables (a_structure: POINTER): POINTER is
			-- Query for acceleratables field of GTKACCELGROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroup_struct_get_acceleratables"
		}"
		end

	gtkaccelgroup_struct_get_n_accels (a_structure: POINTER): NATURAL_32 is
			-- Query for n_accels field of GTKACCELGROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroup_struct_get_n_accels"
		}"
		end

	gtkaccelgroup_struct_get_priv_accels (a_structure: POINTER): POINTER is
			-- Query for priv_accels field of GTKACCELGROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelgroup_struct_get_priv_accels"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAccelGroup"
		}"
		end

end -- class GTKACCELGROUP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

