-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKGC_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkgc_struct_set_clip_x_origin (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for clip_x_origin field of GDKGC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkgc_struct_set_clip_x_origin"
		}"
		end

	gdkgc_struct_set_clip_y_origin (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for clip_y_origin field of GDKGC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkgc_struct_set_clip_y_origin"
		}"
		end

	gdkgc_struct_set_ts_x_origin (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for ts_x_origin field of GDKGC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkgc_struct_set_ts_x_origin"
		}"
		end

	gdkgc_struct_set_ts_y_origin (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for ts_y_origin field of GDKGC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkgc_struct_set_ts_y_origin"
		}"
		end

	gdkgc_struct_set_colormap (a_structure: POINTER; a_value: POINTER) is
			-- Setter for colormap field of GDKGC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkgc_struct_set_colormap"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gdkgc_struct_get_clip_x_origin (a_structure: POINTER): INTEGER_32 is
			-- Query for clip_x_origin field of GDKGC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkgc_struct_get_clip_x_origin"
		}"
		end

	gdkgc_struct_get_clip_y_origin (a_structure: POINTER): INTEGER_32 is
			-- Query for clip_y_origin field of GDKGC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkgc_struct_get_clip_y_origin"
		}"
		end

	gdkgc_struct_get_ts_x_origin (a_structure: POINTER): INTEGER_32 is
			-- Query for ts_x_origin field of GDKGC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkgc_struct_get_ts_x_origin"
		}"
		end

	gdkgc_struct_get_ts_y_origin (a_structure: POINTER): INTEGER_32 is
			-- Query for ts_y_origin field of GDKGC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkgc_struct_get_ts_y_origin"
		}"
		end

	gdkgc_struct_get_colormap (a_structure: POINTER): POINTER is
			-- Query for colormap field of GDKGC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkgc_struct_get_colormap"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkGC"
		}"
		end

end -- class GDKGC_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

