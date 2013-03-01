-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVBBOX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_vbutton_box_new: POINTER is
 		-- gtk_vbutton_box_new (node at line 3358)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vbutton_box_new()"
		}"
		end

	gtk_vbutton_box_get_type: NATURAL_64 is
 		-- gtk_vbutton_box_get_type (node at line 26155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vbutton_box_get_type()"
		}"
		end

	-- `hidden' function _gtk_vbutton_box_get_layout_default skipped.

end -- class GTKVBBOX_EXTERNALS
