-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_FONTMAP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_font_map_load_font (a_fontmap: POINTER; a_context: POINTER; a_desc: POINTER): POINTER is
 		-- pango_font_map_load_font (node at line 98)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_map_load_font"
		}"
		end

	pango_font_map_get_type: NATURAL_64 is
 		-- pango_font_map_get_type (node at line 1022)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_map_get_type()"
		}"
		end

	pango_font_map_create_context (a_fontmap: POINTER): POINTER is
 		-- pango_font_map_create_context (node at line 3020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_map_create_context"
		}"
		end

	pango_font_map_list_families (a_fontmap: POINTER; a_families: POINTER; a_n_families: POINTER) is
 		-- pango_font_map_list_families (node at line 7791)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_map_list_families"
		}"
		end

	pango_font_map_load_fontset (a_fontmap: POINTER; a_context: POINTER; a_desc: POINTER; a_language: POINTER): POINTER is
 		-- pango_font_map_load_fontset (node at line 8029)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_map_load_fontset"
		}"
		end


end -- class PANGO_FONTMAP_EXTERNALS
