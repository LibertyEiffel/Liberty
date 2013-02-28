-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSPINNER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_spinner_stop (a_spinner: POINTER) is
 		-- gtk_spinner_stop (node at line 30607)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_stop"
		}"
		end

	gtk_spinner_new: POINTER is
 		-- gtk_spinner_new (node at line 32931)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_new()"
		}"
		end

	gtk_spinner_start (a_spinner: POINTER) is
 		-- gtk_spinner_start (node at line 34713)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_start"
		}"
		end

	gtk_spinner_get_type: NATURAL_64 is
 		-- gtk_spinner_get_type (node at line 36134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_get_type()"
		}"
		end


end -- class GTKSPINNER_EXTERNALS
