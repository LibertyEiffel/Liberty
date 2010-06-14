-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLLAYOUT_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_layout_get_type: NATURAL_32 is
 		-- gtk_cell_layout_get_type (node at line 8981)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_get_type()"
		}"
		end

	gtk_cell_layout_get_cells (a_cell_layout: POINTER): POINTER is
 		-- gtk_cell_layout_get_cells (node at line 19732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_get_cells"
		}"
		end

	-- `hidden' function _gtk_cell_layout_buildable_custom_tag_start skipped.
	gtk_cell_layout_clear_attributes (a_cell_layout: POINTER; a_cell: POINTER) is
 		-- gtk_cell_layout_clear_attributes (node at line 23480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_clear_attributes"
		}"
		end

	gtk_cell_layout_reorder (a_cell_layout: POINTER; a_cell: POINTER; a_position: INTEGER_32) is
 		-- gtk_cell_layout_reorder (node at line 24641)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_reorder"
		}"
		end

	gtk_cell_layout_pack_end (a_cell_layout: POINTER; a_cell: POINTER; an_expand: INTEGER_32) is
 		-- gtk_cell_layout_pack_end (node at line 26715)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_pack_end"
		}"
		end

	gtk_cell_layout_clear (a_cell_layout: POINTER) is
 		-- gtk_cell_layout_clear (node at line 31263)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_clear"
		}"
		end

	-- `hidden' function _gtk_cell_layout_buildable_custom_tag_end skipped.
	gtk_cell_layout_pack_start (a_cell_layout: POINTER; a_cell: POINTER; an_expand: INTEGER_32) is
 		-- gtk_cell_layout_pack_start (node at line 31707)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_pack_start"
		}"
		end

	gtk_cell_layout_set_cell_data_func (a_cell_layout: POINTER; a_cell: POINTER; a_func: POINTER; a_func_data: POINTER; a_destroy: POINTER) is
 		-- gtk_cell_layout_set_cell_data_func (node at line 33227)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_set_cell_data_func"
		}"
		end

	gtk_cell_layout_add_attribute (a_cell_layout: POINTER; a_cell: POINTER; an_attribute_external: POINTER; a_column: INTEGER_32) is
 		-- gtk_cell_layout_add_attribute (node at line 34480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_add_attribute"
		}"
		end

	gtk_cell_layout_set_attributes (a_cell_layout: POINTER; a_cell: POINTER) is
 		-- gtk_cell_layout_set_attributes (variadic call)  (node at line 35107)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_set_attributes"
		}"
		end

	-- `hidden' function _gtk_cell_layout_buildable_add_child skipped.

end -- class GTKCELLLAYOUT_EXTERNALS
