-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHBBOX_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_hbutton_box_get_layout_default: INTEGER is
 		-- gtk_hbutton_box_get_layout_default (node at line 9820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbutton_box_get_layout_default()"
		}"
		end

	-- `hidden' function _gtk_hbutton_box_get_layout_default skipped.
	gtk_hbutton_box_get_spacing_default: INTEGER_32 is
 		-- gtk_hbutton_box_get_spacing_default (node at line 16991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbutton_box_get_spacing_default()"
		}"
		end

	gtk_hbutton_box_get_type: NATURAL_32 is
 		-- gtk_hbutton_box_get_type (node at line 17530)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbutton_box_get_type()"
		}"
		end

	gtk_hbutton_box_set_layout_default (a_layout: INTEGER) is
 		-- gtk_hbutton_box_set_layout_default (node at line 18147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbutton_box_set_layout_default"
		}"
		end

	gtk_hbutton_box_new: POINTER is
 		-- gtk_hbutton_box_new (node at line 24662)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbutton_box_new()"
		}"
		end

	gtk_hbutton_box_set_spacing_default (a_spacing: INTEGER_32) is
 		-- gtk_hbutton_box_set_spacing_default (node at line 31774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbutton_box_set_spacing_default"
		}"
		end


end -- class GTKHBBOX_EXTERNALS
