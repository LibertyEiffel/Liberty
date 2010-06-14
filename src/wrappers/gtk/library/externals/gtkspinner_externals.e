-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSPINNER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_spinner_start (a_spinner: POINTER) is
 		-- gtk_spinner_start (node at line 2039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_start"
		}"
		end

	gtk_spinner_stop (a_spinner: POINTER) is
 		-- gtk_spinner_stop (node at line 27729)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_stop"
		}"
		end

	gtk_spinner_new: POINTER is
 		-- gtk_spinner_new (node at line 29872)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_new()"
		}"
		end

	gtk_spinner_get_type: NATURAL_32 is
 		-- gtk_spinner_get_type (node at line 35619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_spinner_get_type()"
		}"
		end


end -- class GTKSPINNER_EXTERNALS
