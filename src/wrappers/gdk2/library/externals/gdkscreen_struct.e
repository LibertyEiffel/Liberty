-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKSCREEN_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkscreen_struct_set_closed (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for closed field of GDKSCREEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_set_closed"
		}"
		end

	gdkscreen_struct_set_normal_gcs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for normal_gcs field of GDKSCREEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_set_normal_gcs"
		}"
		end

	gdkscreen_struct_set_exposure_gcs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for exposure_gcs field of GDKSCREEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_set_exposure_gcs"
		}"
		end

	gdkscreen_struct_set_subwindow_gcs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for subwindow_gcs field of GDKSCREEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_set_subwindow_gcs"
		}"
		end

	gdkscreen_struct_set_font_options (a_structure: POINTER; a_value: POINTER) is
			-- Setter for font_options field of GDKSCREEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_set_font_options"
		}"
		end

	gdkscreen_struct_set_resolution (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for resolution field of GDKSCREEN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_set_resolution"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gdkscreen_struct_get_closed (a_structure: POINTER): NATURAL_32 is
			-- Query for closed field of GDKSCREEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_get_closed"
		}"
		end

	gdkscreen_struct_get_normal_gcs (a_structure: POINTER): POINTER is
			-- Query for normal_gcs field of GDKSCREEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_get_normal_gcs"
		}"
		end

	gdkscreen_struct_get_exposure_gcs (a_structure: POINTER): POINTER is
			-- Query for exposure_gcs field of GDKSCREEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_get_exposure_gcs"
		}"
		end

	gdkscreen_struct_get_subwindow_gcs (a_structure: POINTER): POINTER is
			-- Query for subwindow_gcs field of GDKSCREEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_get_subwindow_gcs"
		}"
		end

	gdkscreen_struct_get_font_options (a_structure: POINTER): POINTER is
			-- Query for font_options field of GDKSCREEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_get_font_options"
		}"
		end

	gdkscreen_struct_get_resolution (a_structure: POINTER): REAL_64 is
			-- Query for resolution field of GDKSCREEN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkscreen_struct_get_resolution"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkScreen"
		}"
		end

end -- class GDKSCREEN_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

