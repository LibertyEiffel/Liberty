-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTTAGTABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_tag_table_add (a_table: POINTER; a_tag: POINTER) is
 		-- gtk_text_tag_table_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_add"
		}"
		end

	-- `hidden' function _gtk_text_tag_table_add_buffer skipped.
	gtk_text_tag_table_foreach (a_table: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gtk_text_tag_table_foreach
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_foreach"
		}"
		end

	gtk_text_tag_table_get_size (a_table: POINTER): INTEGER is
 		-- gtk_text_tag_table_get_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_get_size"
		}"
		end

	gtk_text_tag_table_get_type: like long_unsigned is
 		-- gtk_text_tag_table_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_get_type()"
		}"
		end

	gtk_text_tag_table_lookup (a_table: POINTER; a_name: POINTER): POINTER is
 		-- gtk_text_tag_table_lookup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_lookup"
		}"
		end

	gtk_text_tag_table_new: POINTER is
 		-- gtk_text_tag_table_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_new()"
		}"
		end

	gtk_text_tag_table_remove (a_table: POINTER; a_tag: POINTER) is
 		-- gtk_text_tag_table_remove
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_remove"
		}"
		end

	-- `hidden' function _gtk_text_tag_table_remove_buffer skipped.

end -- class GTKTEXTTAGTABLE_EXTERNALS
