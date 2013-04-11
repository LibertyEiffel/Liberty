-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERACCEL_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcellrendereraccel_struct_set_accel_key (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for accel_key field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_set_accel_key"
		}"
		end

	gtkcellrendereraccel_struct_set_accel_mods (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for accel_mods field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_set_accel_mods"
		}"
		end

	gtkcellrendereraccel_struct_set_keycode (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for keycode field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_set_keycode"
		}"
		end

	gtkcellrendereraccel_struct_set_accel_mode (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for accel_mode field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_set_accel_mode"
		}"
		end

	gtkcellrendereraccel_struct_set_edit_widget (a_structure: POINTER; a_value: POINTER) is
			-- Setter for edit_widget field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_set_edit_widget"
		}"
		end

	gtkcellrendereraccel_struct_set_grab_widget (a_structure: POINTER; a_value: POINTER) is
			-- Setter for grab_widget field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_set_grab_widget"
		}"
		end

	gtkcellrendereraccel_struct_set_sizing_label (a_structure: POINTER; a_value: POINTER) is
			-- Setter for sizing_label field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_set_sizing_label"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtkcellrendereraccel_struct_get_accel_key (a_structure: POINTER): NATURAL_32 is
			-- Query for accel_key field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_get_accel_key"
		}"
		end

	gtkcellrendereraccel_struct_get_accel_mods (a_structure: POINTER): INTEGER is
			-- Query for accel_mods field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_get_accel_mods"
		}"
		end

	gtkcellrendereraccel_struct_get_keycode (a_structure: POINTER): NATURAL_32 is
			-- Query for keycode field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_get_keycode"
		}"
		end

	gtkcellrendereraccel_struct_get_accel_mode (a_structure: POINTER): INTEGER is
			-- Query for accel_mode field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_get_accel_mode"
		}"
		end

	gtkcellrendereraccel_struct_get_edit_widget (a_structure: POINTER): POINTER is
			-- Query for edit_widget field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_get_edit_widget"
		}"
		end

	gtkcellrendereraccel_struct_get_grab_widget (a_structure: POINTER): POINTER is
			-- Query for grab_widget field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_get_grab_widget"
		}"
		end

	gtkcellrendereraccel_struct_get_sizing_label (a_structure: POINTER): POINTER is
			-- Query for sizing_label field of GTKCELLRENDERERACCEL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendereraccel_struct_get_sizing_label"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellRendererAccel"
		}"
		end

end -- class GTKCELLRENDERERACCEL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

