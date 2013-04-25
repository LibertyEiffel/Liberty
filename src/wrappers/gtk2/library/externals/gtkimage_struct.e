-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkimage_struct_set_storage_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for storage_type field of GTKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimage_struct_set_storage_type"
		}"
		end

	gtkimage_struct_set_mask (a_structure: POINTER; a_value: POINTER) is
			-- Setter for mask field of GTKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimage_struct_set_mask"
		}"
		end

	gtkimage_struct_set_icon_size (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for icon_size field of GTKIMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimage_struct_set_icon_size"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field misc.
	gtkimage_struct_get_storage_type (a_structure: POINTER): INTEGER is
			-- Query for storage_type field of GTKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimage_struct_get_storage_type"
		}"
		end

	-- Unwrappable field data.
	gtkimage_struct_get_mask (a_structure: POINTER): POINTER is
			-- Query for mask field of GTKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimage_struct_get_mask"
		}"
		end

	gtkimage_struct_get_icon_size (a_structure: POINTER): INTEGER is
			-- Query for icon_size field of GTKIMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimage_struct_get_icon_size"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkImage"
		}"
		end

end -- class GTKIMAGE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

