-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CAIRO_TEXT_CLUSTER_T_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	CAIRO_TYPES
feature {} -- Low-level setters

	cairo_text_cluster_t_struct_set_num_bytes (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for num_bytes field of CAIRO_TEXT_CLUSTER_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_text_cluster_t_struct_set_num_bytes"
		}"
		end

	cairo_text_cluster_t_struct_set_num_glyphs (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for num_glyphs field of CAIRO_TEXT_CLUSTER_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_text_cluster_t_struct_set_num_glyphs"
		}"
		end

feature {} -- Low-level queries

	cairo_text_cluster_t_struct_get_num_bytes (a_structure: POINTER): INTEGER is
			-- Query for num_bytes field of CAIRO_TEXT_CLUSTER_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_text_cluster_t_struct_get_num_bytes"
		}"
		end

	cairo_text_cluster_t_struct_get_num_glyphs (a_structure: POINTER): INTEGER is
			-- Query for num_glyphs field of CAIRO_TEXT_CLUSTER_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_text_cluster_t_struct_get_num_glyphs"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_cairo_text_cluster_t"
		}"
		end

end -- class CAIRO_TEXT_CLUSTER_T_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

