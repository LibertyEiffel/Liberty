-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLLAYOUT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_layout_add_attribute (a_cell_layout: POINTER; a_cell: POINTER; an_attribute_external: POINTER; a_column: INTEGER) is
 		-- gtk_cell_layout_add_attribute
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_add_attribute"
		}"
		end

	-- `hidden' function _gtk_cell_layout_buildable_add_child skipped.
	-- `hidden' function _gtk_cell_layout_buildable_custom_tag_end skipped.
	-- `hidden' function _gtk_cell_layout_buildable_custom_tag_start skipped.
	gtk_cell_layout_clear (a_cell_layout: POINTER) is
 		-- gtk_cell_layout_clear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_clear"
		}"
		end

	gtk_cell_layout_clear_attributes (a_cell_layout: POINTER; a_cell: POINTER) is
 		-- gtk_cell_layout_clear_attributes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_clear_attributes"
		}"
		end

	gtk_cell_layout_get_cells (a_cell_layout: POINTER): POINTER is
 		-- gtk_cell_layout_get_cells
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_get_cells"
		}"
		end

	gtk_cell_layout_get_type: like long_unsigned is
 		-- gtk_cell_layout_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_get_type()"
		}"
		end

	gtk_cell_layout_pack_end (a_cell_layout: POINTER; a_cell: POINTER; an_expand: INTEGER) is
 		-- gtk_cell_layout_pack_end
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_pack_end"
		}"
		end

	gtk_cell_layout_pack_start (a_cell_layout: POINTER; a_cell: POINTER; an_expand: INTEGER) is
 		-- gtk_cell_layout_pack_start
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_pack_start"
		}"
		end

	gtk_cell_layout_reorder (a_cell_layout: POINTER; a_cell: POINTER; a_position: INTEGER) is
 		-- gtk_cell_layout_reorder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_reorder"
		}"
		end

	gtk_cell_layout_set_attributes (a_cell_layout: POINTER; a_cell: POINTER) is
 		-- gtk_cell_layout_set_attributes (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_set_attributes"
		}"
		end

	gtk_cell_layout_set_cell_data_func (a_cell_layout: POINTER; a_cell: POINTER; a_func: POINTER; a_func_data: POINTER; a_destroy: POINTER) is
 		-- gtk_cell_layout_set_cell_data_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_layout_set_cell_data_func"
		}"
		end


end -- class GTKCELLLAYOUT_EXTERNALS
