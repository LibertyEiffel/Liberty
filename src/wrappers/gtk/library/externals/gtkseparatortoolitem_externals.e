-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSEPARATORTOOLITEM_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_separator_tool_item_new: POINTER is
 		-- gtk_separator_tool_item_new (node at line 12780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_separator_tool_item_new()"
		}"
		end

	gtk_separator_tool_item_set_draw (an_item: POINTER; a_draw: INTEGER_32) is
 		-- gtk_separator_tool_item_set_draw (node at line 16015)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_separator_tool_item_set_draw"
		}"
		end

	gtk_separator_tool_item_get_type: NATURAL_32 is
 		-- gtk_separator_tool_item_get_type (node at line 33153)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_separator_tool_item_get_type()"
		}"
		end

	gtk_separator_tool_item_get_draw (an_item: POINTER): INTEGER_32 is
 		-- gtk_separator_tool_item_get_draw (node at line 35757)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_separator_tool_item_get_draw"
		}"
		end


end -- class GTKSEPARATORTOOLITEM_EXTERNALS
