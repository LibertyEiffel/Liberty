-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSEPARATORTOOLITEM_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_separator_tool_item_get_draw (an_item: POINTER): INTEGER is
 		-- gtk_separator_tool_item_get_draw
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_separator_tool_item_get_draw"
		}"
		end

	gtk_separator_tool_item_get_type: like long_unsigned is
 		-- gtk_separator_tool_item_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_separator_tool_item_get_type()"
		}"
		end

	gtk_separator_tool_item_new: POINTER is
 		-- gtk_separator_tool_item_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_separator_tool_item_new()"
		}"
		end

	gtk_separator_tool_item_set_draw (an_item: POINTER; a_draw: INTEGER) is
 		-- gtk_separator_tool_item_set_draw
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_separator_tool_item_set_draw"
		}"
		end


end -- class GTKSEPARATORTOOLITEM_EXTERNALS
