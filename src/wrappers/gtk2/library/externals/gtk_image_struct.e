-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_IMAGE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_image_struct_set_storage_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for storage_type field of GTK_IMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_struct_set_storage_type"
		}"
		end

	gtk_image_struct_set_mask (a_structure: POINTER; a_value: POINTER) is
			-- Setter for mask field of GTK_IMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_struct_set_mask"
		}"
		end

	gtk_image_struct_set_icon_size (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for icon_size field of GTK_IMAGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_struct_set_icon_size"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field misc.
	gtk_image_struct_get_storage_type (a_structure: POINTER): INTEGER is
			-- Query for storage_type field of GTK_IMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_struct_get_storage_type"
		}"
		end

	-- Unwrappable field data.
	gtk_image_struct_get_mask (a_structure: POINTER): POINTER is
			-- Query for mask field of GTK_IMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_struct_get_mask"
		}"
		end

	gtk_image_struct_get_icon_size (a_structure: POINTER): INTEGER is
			-- Query for icon_size field of GTK_IMAGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_struct_get_icon_size"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkImage"
		}"
		end

end -- class GTK_IMAGE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

