-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVBBOX_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_vbutton_box_set_spacing_default (a_spacing: INTEGER_32) is
 		-- gtk_vbutton_box_set_spacing_default (node at line 14160)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vbutton_box_set_spacing_default"
		}"
		end

	gtk_vbutton_box_new: POINTER is
 		-- gtk_vbutton_box_new (node at line 16221)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vbutton_box_new()"
		}"
		end

	gtk_vbutton_box_get_type: NATURAL_32 is
 		-- gtk_vbutton_box_get_type (node at line 23708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vbutton_box_get_type()"
		}"
		end

	gtk_vbutton_box_get_spacing_default: INTEGER_32 is
 		-- gtk_vbutton_box_get_spacing_default (node at line 25220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vbutton_box_get_spacing_default()"
		}"
		end

	gtk_vbutton_box_get_layout_default: INTEGER is
 		-- gtk_vbutton_box_get_layout_default (node at line 30106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vbutton_box_get_layout_default()"
		}"
		end

	-- `hidden' function _gtk_vbutton_box_get_layout_default skipped.
	gtk_vbutton_box_set_layout_default (a_layout: INTEGER) is
 		-- gtk_vbutton_box_set_layout_default (node at line 37638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vbutton_box_set_layout_default"
		}"
		end


end -- class GTKVBBOX_EXTERNALS
