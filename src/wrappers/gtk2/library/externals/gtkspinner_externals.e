-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSPINNER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_spinner_get_type: like long_unsigned is
 		-- gtk_spinner_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_get_type()"
		}"
		end

	gtk_spinner_new: POINTER is
 		-- gtk_spinner_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_new()"
		}"
		end

	gtk_spinner_start (a_spinner: POINTER) is
 		-- gtk_spinner_start
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_start"
		}"
		end

	gtk_spinner_stop (a_spinner: POINTER) is
 		-- gtk_spinner_stop
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_stop"
		}"
		end


end -- class GTKSPINNER_EXTERNALS
