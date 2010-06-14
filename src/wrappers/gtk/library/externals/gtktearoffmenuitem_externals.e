-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEAROFFMENUITEM_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tearoff_menu_item_new: POINTER is
 		-- gtk_tearoff_menu_item_new (node at line 362)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tearoff_menu_item_new()"
		}"
		end

	gtk_tearoff_menu_item_get_type: NATURAL_32 is
 		-- gtk_tearoff_menu_item_get_type (node at line 15443)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tearoff_menu_item_get_type()"
		}"
		end


end -- class GTKTEAROFFMENUITEM_EXTERNALS
