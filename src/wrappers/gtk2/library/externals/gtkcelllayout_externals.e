-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLLAYOUT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_layout_get_type: NATURAL_64 is
 		-- gtk_cell_layout_get_type (node at line 9736)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_get_type()"
		}"
		end

	gtk_cell_layout_get_cells (a_cell_layout: POINTER): POINTER is
 		-- gtk_cell_layout_get_cells (node at line 21666)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_get_cells"
		}"
		end

	gtk_cell_layout_clear_attributes (a_cell_layout: POINTER; a_cell: POINTER) is
 		-- gtk_cell_layout_clear_attributes (node at line 25837)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_clear_attributes"
		}"
		end

	gtk_cell_layout_reorder (a_cell_layout: POINTER; a_cell: POINTER; a_position: INTEGER_32) is
 		-- gtk_cell_layout_reorder (node at line 27201)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_reorder"
		}"
		end

	gtk_cell_layout_pack_end (a_cell_layout: POINTER; a_cell: POINTER; an_expand: INTEGER_32) is
 		-- gtk_cell_layout_pack_end (node at line 29508)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_pack_end"
		}"
		end

	gtk_cell_layout_clear (a_cell_layout: POINTER) is
 		-- gtk_cell_layout_clear (node at line 34559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_clear"
		}"
		end

	-- `hidden' function _gtk_cell_layout_buildable_custom_tag_start skipped.
	-- `hidden' function _gtk_cell_layout_buildable_custom_tag_end skipped.
	gtk_cell_layout_pack_start (a_cell_layout: POINTER; a_cell: POINTER; an_expand: INTEGER_32) is
 		-- gtk_cell_layout_pack_start (node at line 35086)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_pack_start"
		}"
		end

	gtk_cell_layout_set_cell_data_func (a_cell_layout: POINTER; a_cell: POINTER; a_func: POINTER; a_func_data: POINTER; a_destroy: POINTER) is
 		-- gtk_cell_layout_set_cell_data_func (node at line 36673)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_set_cell_data_func"
		}"
		end

	gtk_cell_layout_add_attribute (a_cell_layout: POINTER; a_cell: POINTER; an_attribute_external: POINTER; a_column: INTEGER_32) is
 		-- gtk_cell_layout_add_attribute (node at line 37978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_add_attribute"
		}"
		end

	gtk_cell_layout_set_attributes (a_cell_layout: POINTER; a_cell: POINTER) is
 		-- gtk_cell_layout_set_attributes (variadic call)  (node at line 38722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_set_attributes"
		}"
		end

	-- `hidden' function _gtk_cell_layout_buildable_add_child skipped.

end -- class GTKCELLLAYOUT_EXTERNALS
