-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_PREVIEW_INFO_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_preview_info_struct_set_lookup (a_structure: POINTER; a_value: POINTER) is
			-- Setter for lookup field of GTK_PREVIEW_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_info_struct_set_lookup"
		}"
		end

	gtk_preview_info_struct_set_gamma (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for gamma field of GTK_PREVIEW_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_info_struct_set_gamma"
		}"
		end

feature {} -- Low-level queries

	gtk_preview_info_struct_get_lookup (a_structure: POINTER): POINTER is
			-- Query for lookup field of GTK_PREVIEW_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_info_struct_get_lookup"
		}"
		end

	gtk_preview_info_struct_get_gamma (a_structure: POINTER): REAL_64 is
			-- Query for gamma field of GTK_PREVIEW_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_info_struct_get_gamma"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkPreviewInfo"
		}"
		end

end -- class GTK_PREVIEW_INFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

