-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVOLUMEBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_volume_button_get_type: NATURAL_64 is
 		-- gtk_volume_button_get_type (node at line 23821)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_volume_button_get_type()"
		}"
		end

	gtk_volume_button_new: POINTER is
 		-- gtk_volume_button_new (node at line 26238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_volume_button_new()"
		}"
		end


end -- class GTKVOLUMEBUTTON_EXTERNALS
