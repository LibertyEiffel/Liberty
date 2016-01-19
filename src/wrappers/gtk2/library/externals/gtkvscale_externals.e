-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKVSCALE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_vscale_get_type: like long_unsigned is
 		-- gtk_vscale_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vscale_get_type()"
		}"
		end

	gtk_vscale_new (an_adjustment: POINTER): POINTER is
 		-- gtk_vscale_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vscale_new"
		}"
		end

	gtk_vscale_new_with_range (a_min: REAL; a_max: REAL; a_step: REAL): POINTER is
 		-- gtk_vscale_new_with_range
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_vscale_new_with_range"
		}"
		end


end -- class GTKVSCALE_EXTERNALS
