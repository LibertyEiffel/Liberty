-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEAROFFMENUITEM_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tearoff_menu_item_get_type: like long_unsigned is
 		-- gtk_tearoff_menu_item_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tearoff_menu_item_get_type()"
		}"
		end

	gtk_tearoff_menu_item_new: POINTER is
 		-- gtk_tearoff_menu_item_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tearoff_menu_item_new()"
		}"
		end


end -- class GTKTEAROFFMENUITEM_EXTERNALS
