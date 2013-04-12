-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKCOLORMAP_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkcolormap_struct_set_size (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for size field of GDKCOLORMAP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcolormap_struct_set_size"
		}"
		end

	gdkcolormap_struct_set_colors (a_structure: POINTER; a_value: POINTER) is
			-- Setter for colors field of GDKCOLORMAP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcolormap_struct_set_colors"
		}"
		end

	gdkcolormap_struct_set_visual (a_structure: POINTER; a_value: POINTER) is
			-- Setter for visual field of GDKCOLORMAP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcolormap_struct_set_visual"
		}"
		end

	gdkcolormap_struct_set_windowing_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for windowing_data field of GDKCOLORMAP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcolormap_struct_set_windowing_data"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gdkcolormap_struct_get_size (a_structure: POINTER): INTEGER_32 is
			-- Query for size field of GDKCOLORMAP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcolormap_struct_get_size"
		}"
		end

	gdkcolormap_struct_get_colors (a_structure: POINTER): POINTER is
			-- Query for colors field of GDKCOLORMAP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcolormap_struct_get_colors"
		}"
		end

	gdkcolormap_struct_get_visual (a_structure: POINTER): POINTER is
			-- Query for visual field of GDKCOLORMAP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcolormap_struct_get_visual"
		}"
		end

	gdkcolormap_struct_get_windowing_data (a_structure: POINTER): POINTER is
			-- Query for windowing_data field of GDKCOLORMAP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkcolormap_struct_get_windowing_data"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkColormap"
		}"
		end

end -- class GDKCOLORMAP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

