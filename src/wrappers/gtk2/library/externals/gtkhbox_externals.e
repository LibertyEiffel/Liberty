-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHBOX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_hbox_get_type: like long_unsigned is
 		-- gtk_hbox_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbox_get_type()"
		}"
		end

	gtk_hbox_new (a_homogeneous: INTEGER; a_spacing: INTEGER): POINTER is
 		-- gtk_hbox_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hbox_new"
		}"
		end


end -- class GTKHBOX_EXTERNALS
