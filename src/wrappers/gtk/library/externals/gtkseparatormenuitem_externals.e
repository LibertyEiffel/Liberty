-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSEPARATORMENUITEM_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_separator_menu_item_new: POINTER is
 		-- gtk_separator_menu_item_new (node at line 11576)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_separator_menu_item_new()"
		}"
		end

	gtk_separator_menu_item_get_type: NATURAL_32 is
 		-- gtk_separator_menu_item_get_type (node at line 23758)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_separator_menu_item_get_type()"
		}"
		end


end -- class GTKSEPARATORMENUITEM_EXTERNALS
