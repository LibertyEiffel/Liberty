-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTTAGTABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_tag_table_new: POINTER is
 		-- gtk_text_tag_table_new (node at line 792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_new()"
		}"
		end

	gtk_text_tag_table_get_size (a_table: POINTER): INTEGER_32 is
 		-- gtk_text_tag_table_get_size (node at line 6209)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_get_size"
		}"
		end

	gtk_text_tag_table_lookup (a_table: POINTER; a_name: POINTER): POINTER is
 		-- gtk_text_tag_table_lookup (node at line 8081)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_lookup"
		}"
		end

	gtk_text_tag_table_add (a_table: POINTER; a_tag: POINTER) is
 		-- gtk_text_tag_table_add (node at line 8524)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_add"
		}"
		end

	gtk_text_tag_table_remove (a_table: POINTER; a_tag: POINTER) is
 		-- gtk_text_tag_table_remove (node at line 11480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_remove"
		}"
		end

	gtk_text_tag_table_get_type: NATURAL_64 is
 		-- gtk_text_tag_table_get_type (node at line 12659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_get_type()"
		}"
		end

	gtk_text_tag_table_foreach (a_table: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- gtk_text_tag_table_foreach (node at line 17515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_foreach"
		}"
		end

	-- `hidden' function _gtk_text_tag_table_add_buffer skipped.
	-- `hidden' function _gtk_text_tag_table_remove_buffer skipped.

end -- class GTKTEXTTAGTABLE_EXTERNALS
