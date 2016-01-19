-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHBBOX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_hbutton_box_get_layout_default skipped.
	gtk_hbutton_box_get_type: like long_unsigned is
 		-- gtk_hbutton_box_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbutton_box_get_type()"
		}"
		end

	gtk_hbutton_box_new: POINTER is
 		-- gtk_hbutton_box_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbutton_box_new()"
		}"
		end


end -- class GTKHBBOX_EXTERNALS
