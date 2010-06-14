-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_PREVIEW_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_preview_struct_set_buffer (a_structure: POINTER; a_value: POINTER) is
			-- Setter for buffer field of GTK_PREVIEW_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_set_buffer"
		}"
		end

	gtk_preview_struct_set_buffer_width (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for buffer_width field of GTK_PREVIEW_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_set_buffer_width"
		}"
		end

	gtk_preview_struct_set_buffer_height (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for buffer_height field of GTK_PREVIEW_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_set_buffer_height"
		}"
		end

	gtk_preview_struct_set_bpp (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for bpp field of GTK_PREVIEW_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_set_bpp"
		}"
		end

	gtk_preview_struct_set_rowstride (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for rowstride field of GTK_PREVIEW_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_set_rowstride"
		}"
		end

	gtk_preview_struct_set_dither (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for dither field of GTK_PREVIEW_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_set_dither"
		}"
		end

	gtk_preview_struct_set_type (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for type field of GTK_PREVIEW_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_set_type"
		}"
		end

	gtk_preview_struct_set_expand (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for expand field of GTK_PREVIEW_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_set_expand"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field widget.
	gtk_preview_struct_get_buffer (a_structure: POINTER): POINTER is
			-- Query for buffer field of GTK_PREVIEW_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_get_buffer"
		}"
		end

	gtk_preview_struct_get_buffer_width (a_structure: POINTER): NATURAL_16 is
			-- Query for buffer_width field of GTK_PREVIEW_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_get_buffer_width"
		}"
		end

	gtk_preview_struct_get_buffer_height (a_structure: POINTER): NATURAL_16 is
			-- Query for buffer_height field of GTK_PREVIEW_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_get_buffer_height"
		}"
		end

	gtk_preview_struct_get_bpp (a_structure: POINTER): NATURAL_16 is
			-- Query for bpp field of GTK_PREVIEW_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_get_bpp"
		}"
		end

	gtk_preview_struct_get_rowstride (a_structure: POINTER): NATURAL_16 is
			-- Query for rowstride field of GTK_PREVIEW_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_get_rowstride"
		}"
		end

	gtk_preview_struct_get_dither (a_structure: POINTER): INTEGER is
			-- Query for dither field of GTK_PREVIEW_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_get_dither"
		}"
		end

	gtk_preview_struct_get_type (a_structure: POINTER): NATURAL_32 is
			-- Query for type field of GTK_PREVIEW_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_get_type"
		}"
		end

	gtk_preview_struct_get_expand (a_structure: POINTER): NATURAL_32 is
			-- Query for expand field of GTK_PREVIEW_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_struct_get_expand"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkPreview"
		}"
		end

end -- class GTK_PREVIEW_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

