-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_CONTEXT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_context_load_fontset (a_context: POINTER; a_desc: POINTER; a_language: POINTER): POINTER is
 		-- pango_context_load_fontset (node at line 266)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_load_fontset"
		}"
		end

	pango_context_list_families (a_context: POINTER; a_families: POINTER; a_n_families: POINTER) is
 		-- pango_context_list_families (node at line 433)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_list_families"
		}"
		end

	pango_context_set_language (a_context: POINTER; a_language: POINTER) is
 		-- pango_context_set_language (node at line 592)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_set_language"
		}"
		end

	pango_context_get_font_map (a_context: POINTER): POINTER is
 		-- pango_context_get_font_map (node at line 1001)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_get_font_map"
		}"
		end

	pango_context_get_language (a_context: POINTER): POINTER is
 		-- pango_context_get_language (node at line 1044)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_get_language"
		}"
		end

	pango_context_get_gravity (a_context: POINTER): INTEGER is
 		-- pango_context_get_gravity (node at line 1399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_get_gravity"
		}"
		end

	pango_context_set_gravity_hint (a_context: POINTER; a_hint: INTEGER) is
 		-- pango_context_set_gravity_hint (node at line 2897)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_set_gravity_hint"
		}"
		end

	pango_context_set_matrix (a_context: POINTER; a_matrix: POINTER) is
 		-- pango_context_set_matrix (node at line 3753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_set_matrix"
		}"
		end

	pango_context_new: POINTER is
 		-- pango_context_new (node at line 4014)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_new()"
		}"
		end

	pango_context_get_base_gravity (a_context: POINTER): INTEGER is
 		-- pango_context_get_base_gravity (node at line 4040)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_get_base_gravity"
		}"
		end

	pango_context_set_font_description (a_context: POINTER; a_desc: POINTER) is
 		-- pango_context_set_font_description (node at line 5015)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_set_font_description"
		}"
		end

	pango_context_get_matrix (a_context: POINTER): POINTER is
 		-- pango_context_get_matrix (node at line 6054)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_get_matrix"
		}"
		end

	pango_itemize_with_base_dir (a_context: POINTER; a_base_dir: INTEGER; a_text: POINTER; a_start_index: INTEGER_32; a_length: INTEGER_32; an_attrs: POINTER; a_cached_iter: POINTER): POINTER is
 		-- pango_itemize_with_base_dir (node at line 7275)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_itemize_with_base_dir"
		}"
		end

	pango_context_get_metrics (a_context: POINTER; a_desc: POINTER; a_language: POINTER): POINTER is
 		-- pango_context_get_metrics (node at line 7591)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_get_metrics"
		}"
		end

	pango_context_load_font (a_context: POINTER; a_desc: POINTER): POINTER is
 		-- pango_context_load_font (node at line 8080)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_load_font"
		}"
		end

	pango_context_get_type: NATURAL_64 is
 		-- pango_context_get_type (node at line 8665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_get_type()"
		}"
		end

	pango_context_get_font_description (a_context: POINTER): POINTER is
 		-- pango_context_get_font_description (node at line 8816)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_get_font_description"
		}"
		end

	pango_itemize (a_context: POINTER; a_text: POINTER; a_start_index: INTEGER_32; a_length: INTEGER_32; an_attrs: POINTER; a_cached_iter: POINTER): POINTER is
 		-- pango_itemize (node at line 9001)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_itemize"
		}"
		end

	pango_context_set_base_gravity (a_context: POINTER; a_gravity: INTEGER) is
 		-- pango_context_set_base_gravity (node at line 9793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_set_base_gravity"
		}"
		end

	pango_context_set_font_map (a_context: POINTER; a_font_map: POINTER) is
 		-- pango_context_set_font_map (node at line 9837)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_set_font_map"
		}"
		end

	pango_context_get_base_dir (a_context: POINTER): INTEGER is
 		-- pango_context_get_base_dir (node at line 10043)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_get_base_dir"
		}"
		end

	pango_context_get_gravity_hint (a_context: POINTER): INTEGER is
 		-- pango_context_get_gravity_hint (node at line 10724)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_get_gravity_hint"
		}"
		end

	pango_context_set_base_dir (a_context: POINTER; a_direction: INTEGER) is
 		-- pango_context_set_base_dir (node at line 10908)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_context_set_base_dir"
		}"
		end


end -- class PANGO_CONTEXT_EXTERNALS
