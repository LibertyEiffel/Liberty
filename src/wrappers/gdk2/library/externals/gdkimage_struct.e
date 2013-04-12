-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKIMAGE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkimage_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_type"
		}"
		end

	gdkimage_struct_set_visual (a_structure: POINTER; a_value: POINTER) is
			-- Setter for visual field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_visual"
		}"
		end

	gdkimage_struct_set_byte_order (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for byte_order field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_byte_order"
		}"
		end

	gdkimage_struct_set_width (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for width field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_width"
		}"
		end

	gdkimage_struct_set_height (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for height field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_height"
		}"
		end

	gdkimage_struct_set_depth (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for depth field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_depth"
		}"
		end

	gdkimage_struct_set_bpp (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for bpp field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_bpp"
		}"
		end

	gdkimage_struct_set_bpl (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for bpl field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_bpl"
		}"
		end

	gdkimage_struct_set_bits_per_pixel (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for bits_per_pixel field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_bits_per_pixel"
		}"
		end

	gdkimage_struct_set_mem (a_structure: POINTER; a_value: POINTER) is
			-- Setter for mem field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_mem"
		}"
		end

	gdkimage_struct_set_colormap (a_structure: POINTER; a_value: POINTER) is
			-- Setter for colormap field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_colormap"
		}"
		end

	gdkimage_struct_set_windowing_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for windowing_data field of GDKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_set_windowing_data"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gdkimage_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_type"
		}"
		end

	gdkimage_struct_get_visual (a_structure: POINTER): POINTER is
			-- Query for visual field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_visual"
		}"
		end

	gdkimage_struct_get_byte_order (a_structure: POINTER): INTEGER is
			-- Query for byte_order field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_byte_order"
		}"
		end

	gdkimage_struct_get_width (a_structure: POINTER): INTEGER_32 is
			-- Query for width field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_width"
		}"
		end

	gdkimage_struct_get_height (a_structure: POINTER): INTEGER_32 is
			-- Query for height field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_height"
		}"
		end

	gdkimage_struct_get_depth (a_structure: POINTER): NATURAL_16 is
			-- Query for depth field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_depth"
		}"
		end

	gdkimage_struct_get_bpp (a_structure: POINTER): NATURAL_16 is
			-- Query for bpp field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_bpp"
		}"
		end

	gdkimage_struct_get_bpl (a_structure: POINTER): NATURAL_16 is
			-- Query for bpl field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_bpl"
		}"
		end

	gdkimage_struct_get_bits_per_pixel (a_structure: POINTER): NATURAL_16 is
			-- Query for bits_per_pixel field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_bits_per_pixel"
		}"
		end

	gdkimage_struct_get_mem (a_structure: POINTER): POINTER is
			-- Query for mem field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_mem"
		}"
		end

	gdkimage_struct_get_colormap (a_structure: POINTER): POINTER is
			-- Query for colormap field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_colormap"
		}"
		end

	gdkimage_struct_get_windowing_data (a_structure: POINTER): POINTER is
			-- Query for windowing_data field of GDKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkimage_struct_get_windowing_data"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GdkImage"
		}"
		end

end -- class GDKIMAGE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

