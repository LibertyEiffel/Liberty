-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_TABS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_tab_array_copy (a_src: POINTER): POINTER is
 		-- pango_tab_array_copy (node at line 620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_tab_array_copy"
		}"
		end

	pango_tab_array_new (an_initial_size: INTEGER_32; a_positions_in_pixels: INTEGER_32): POINTER is
 		-- pango_tab_array_new (node at line 1240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_tab_array_new"
		}"
		end

	pango_tab_array_get_tabs (a_tab_array: POINTER; an_alignments: POINTER; a_locations: POINTER) is
 		-- pango_tab_array_get_tabs (node at line 1377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_tab_array_get_tabs"
		}"
		end

	pango_tab_array_get_size (a_tab_array: POINTER): INTEGER_32 is
 		-- pango_tab_array_get_size (node at line 3354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_tab_array_get_size"
		}"
		end

	pango_tab_array_free (a_tab_array: POINTER) is
 		-- pango_tab_array_free (node at line 3552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_tab_array_free"
		}"
		end

	pango_tab_array_get_positions_in_pixels (a_tab_array: POINTER): INTEGER_32 is
 		-- pango_tab_array_get_positions_in_pixels (node at line 3767)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_tab_array_get_positions_in_pixels"
		}"
		end

	pango_tab_array_set_tab (a_tab_array: POINTER; a_tab_index: INTEGER_32; an_alignment: INTEGER; a_location: INTEGER_32) is
 		-- pango_tab_array_set_tab (node at line 5601)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_tab_array_set_tab"
		}"
		end

	pango_tab_array_get_tab (a_tab_array: POINTER; a_tab_index: INTEGER_32; an_alignment: POINTER; a_location: POINTER) is
 		-- pango_tab_array_get_tab (node at line 6945)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_tab_array_get_tab"
		}"
		end

	pango_tab_array_new_with_positions (a_size: INTEGER_32; a_positions_in_pixels: INTEGER_32; a_first_alignment: INTEGER; a_first_position: INTEGER_32): POINTER is
 		-- pango_tab_array_new_with_positions (variadic call)  (node at line 7904)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_tab_array_new_with_positions"
		}"
		end

	pango_tab_array_get_type: NATURAL_64 is
 		-- pango_tab_array_get_type (node at line 8319)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_tab_array_get_type()"
		}"
		end

	pango_tab_array_resize (a_tab_array: POINTER; a_new_size: INTEGER_32) is
 		-- pango_tab_array_resize (node at line 10734)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_tab_array_resize"
		}"
		end


end -- class PANGO_TABS_EXTERNALS
