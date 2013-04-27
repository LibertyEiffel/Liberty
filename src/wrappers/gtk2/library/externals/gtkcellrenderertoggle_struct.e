-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERTOGGLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcellrenderertoggle_struct_set_active (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for active field of GTKCELLRENDERERTOGGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderertoggle_struct_set_active"
		}"
		end

	gtkcellrenderertoggle_struct_set_activatable (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for activatable field of GTKCELLRENDERERTOGGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderertoggle_struct_set_activatable"
		}"
		end

	gtkcellrenderertoggle_struct_set_radio (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for radio field of GTKCELLRENDERERTOGGLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderertoggle_struct_set_radio"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtkcellrenderertoggle_struct_get_active (a_structure: POINTER): NATURAL_32 is
			-- Query for active field of GTKCELLRENDERERTOGGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderertoggle_struct_get_active"
		}"
		end

	gtkcellrenderertoggle_struct_get_activatable (a_structure: POINTER): NATURAL_32 is
			-- Query for activatable field of GTKCELLRENDERERTOGGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderertoggle_struct_get_activatable"
		}"
		end

	gtkcellrenderertoggle_struct_get_radio (a_structure: POINTER): NATURAL_32 is
			-- Query for radio field of GTKCELLRENDERERTOGGLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderertoggle_struct_get_radio"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellRendererToggle"
		}"
		end

end -- class GTKCELLRENDERERTOGGLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

