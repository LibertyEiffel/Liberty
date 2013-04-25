-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERCOMBO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcellrenderercombo_struct_set_model (a_structure: POINTER; a_value: POINTER) is
			-- Setter for model field of GTKCELLRENDERERCOMBO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderercombo_struct_set_model"
		}"
		end

	gtkcellrenderercombo_struct_set_text_column (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for text_column field of GTKCELLRENDERERCOMBO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderercombo_struct_set_text_column"
		}"
		end

	gtkcellrenderercombo_struct_set_has_entry (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for has_entry field of GTKCELLRENDERERCOMBO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderercombo_struct_set_has_entry"
		}"
		end

	gtkcellrenderercombo_struct_set_focus_out_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for focus_out_id field of GTKCELLRENDERERCOMBO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderercombo_struct_set_focus_out_id"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtkcellrenderercombo_struct_get_model (a_structure: POINTER): POINTER is
			-- Query for model field of GTKCELLRENDERERCOMBO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderercombo_struct_get_model"
		}"
		end

	gtkcellrenderercombo_struct_get_text_column (a_structure: POINTER): INTEGER_32 is
			-- Query for text_column field of GTKCELLRENDERERCOMBO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderercombo_struct_get_text_column"
		}"
		end

	gtkcellrenderercombo_struct_get_has_entry (a_structure: POINTER): INTEGER_32 is
			-- Query for has_entry field of GTKCELLRENDERERCOMBO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderercombo_struct_get_has_entry"
		}"
		end

	gtkcellrenderercombo_struct_get_focus_out_id (a_structure: POINTER): NATURAL_32 is
			-- Query for focus_out_id field of GTKCELLRENDERERCOMBO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrenderercombo_struct_get_focus_out_id"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellRendererCombo"
		}"
		end

end -- class GTKCELLRENDERERCOMBO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

