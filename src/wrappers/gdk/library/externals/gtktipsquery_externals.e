-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTIPSQUERY_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tips_query_start_query (a_tips_query: POINTER) is
 		-- gtk_tips_query_start_query (node at line 4274)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tips_query_start_query"
		}"
		end

	gtk_tips_query_get_type: NATURAL_32 is
 		-- gtk_tips_query_get_type (node at line 8179)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tips_query_get_type()"
		}"
		end

	gtk_tips_query_set_caller (a_tips_query: POINTER; a_caller: POINTER) is
 		-- gtk_tips_query_set_caller (node at line 8803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tips_query_set_caller"
		}"
		end

	gtk_tips_query_set_labels (a_tips_query: POINTER; a_label_inactive: POINTER; a_label_no_tip: POINTER) is
 		-- gtk_tips_query_set_labels (node at line 13104)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tips_query_set_labels"
		}"
		end

	gtk_tips_query_new: POINTER is
 		-- gtk_tips_query_new (node at line 30244)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tips_query_new()"
		}"
		end

	gtk_tips_query_stop_query (a_tips_query: POINTER) is
 		-- gtk_tips_query_stop_query (node at line 30440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tips_query_stop_query"
		}"
		end


end -- class GTKTIPSQUERY_EXTERNALS
