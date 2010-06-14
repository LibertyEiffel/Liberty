-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKITEM_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_item_toggle (an_item: POINTER) is
 		-- gtk_item_toggle (node at line 8230)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_toggle"
		}"
		end

	gtk_item_deselect (an_item: POINTER) is
 		-- gtk_item_deselect (node at line 33394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_deselect"
		}"
		end

	gtk_item_select (an_item: POINTER) is
 		-- gtk_item_select (node at line 36410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_select"
		}"
		end

	gtk_item_get_type: NATURAL_32 is
 		-- gtk_item_get_type (node at line 36566)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_item_get_type()"
		}"
		end


end -- class GTKITEM_EXTERNALS
