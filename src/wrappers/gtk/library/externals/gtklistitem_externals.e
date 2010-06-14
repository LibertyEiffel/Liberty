-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLISTITEM_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_list_item_new_with_label (a_label: POINTER): POINTER is
 		-- gtk_list_item_new_with_label (node at line 12592)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_item_new_with_label"
		}"
		end

	gtk_list_item_select (a_list_item: POINTER) is
 		-- gtk_list_item_select (node at line 17869)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_item_select"
		}"
		end

	gtk_list_item_deselect (a_list_item: POINTER) is
 		-- gtk_list_item_deselect (node at line 23216)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_item_deselect"
		}"
		end

	gtk_list_item_get_type: NATURAL_32 is
 		-- gtk_list_item_get_type (node at line 27193)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_item_get_type()"
		}"
		end

	gtk_list_item_new: POINTER is
 		-- gtk_list_item_new (node at line 33366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_list_item_new()"
		}"
		end


end -- class GTKLISTITEM_EXTERNALS
