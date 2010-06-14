-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTCHILD_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_child_anchor_get_deleted (an_anchor: POINTER): INTEGER_32 is
 		-- gtk_text_child_anchor_get_deleted (node at line 498)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_child_anchor_get_deleted"
		}"
		end

	gtk_text_child_anchor_get_widgets (an_anchor: POINTER): POINTER is
 		-- gtk_text_child_anchor_get_widgets (node at line 1943)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_child_anchor_get_widgets"
		}"
		end

	gtk_text_child_anchor_new: POINTER is
 		-- gtk_text_child_anchor_new (node at line 31653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_child_anchor_new()"
		}"
		end

	gtk_text_child_anchor_get_type: NATURAL_32 is
 		-- gtk_text_child_anchor_get_type (node at line 37628)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_child_anchor_get_type()"
		}"
		end


end -- class GTKTEXTCHILD_EXTERNALS
