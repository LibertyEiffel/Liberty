-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_GLYPH_ITEM_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_glyph_item_split (an_orig: POINTER; a_text: POINTER; a_split_index: INTEGER_32): POINTER is
 		-- pango_glyph_item_split (node at line 216)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_split"
		}"
		end

	pango_glyph_item_copy (an_orig: POINTER): POINTER is
 		-- pango_glyph_item_copy (node at line 225)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_copy"
		}"
		end

	pango_glyph_item_iter_copy (an_orig: POINTER): POINTER is
 		-- pango_glyph_item_iter_copy (node at line 2246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_iter_copy"
		}"
		end

	pango_glyph_item_get_type: NATURAL_64 is
 		-- pango_glyph_item_get_type (node at line 2803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_get_type()"
		}"
		end

	pango_glyph_item_apply_attrs (a_glyph_item: POINTER; a_text: POINTER; a_list: POINTER): POINTER is
 		-- pango_glyph_item_apply_attrs (node at line 2974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_apply_attrs"
		}"
		end

	pango_glyph_item_iter_init_end (an_iter: POINTER; a_glyph_item: POINTER; a_text: POINTER): INTEGER_32 is
 		-- pango_glyph_item_iter_init_end (node at line 4235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_iter_init_end"
		}"
		end

	pango_glyph_item_iter_init_start (an_iter: POINTER; a_glyph_item: POINTER; a_text: POINTER): INTEGER_32 is
 		-- pango_glyph_item_iter_init_start (node at line 5446)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_iter_init_start"
		}"
		end

	pango_glyph_item_iter_get_type: NATURAL_64 is
 		-- pango_glyph_item_iter_get_type (node at line 5496)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_iter_get_type()"
		}"
		end

	pango_glyph_item_letter_space (a_glyph_item: POINTER; a_text: POINTER; a_log_attrs: POINTER; a_letter_spacing: INTEGER_32) is
 		-- pango_glyph_item_letter_space (node at line 5994)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_letter_space"
		}"
		end

	pango_glyph_item_iter_free (an_iter: POINTER) is
 		-- pango_glyph_item_iter_free (node at line 7198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_iter_free"
		}"
		end

	pango_glyph_item_iter_prev_cluster (an_iter: POINTER): INTEGER_32 is
 		-- pango_glyph_item_iter_prev_cluster (node at line 7379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_iter_prev_cluster"
		}"
		end

	pango_glyph_item_iter_next_cluster (an_iter: POINTER): INTEGER_32 is
 		-- pango_glyph_item_iter_next_cluster (node at line 7529)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_iter_next_cluster"
		}"
		end

	pango_glyph_item_free (a_glyph_item: POINTER) is
 		-- pango_glyph_item_free (node at line 7642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_free"
		}"
		end

	pango_glyph_item_get_logical_widths (a_glyph_item: POINTER; a_text: POINTER; a_logical_widths: POINTER) is
 		-- pango_glyph_item_get_logical_widths (node at line 8231)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_glyph_item_get_logical_widths"
		}"
		end


end -- class PANGO_GLYPH_ITEM_EXTERNALS
