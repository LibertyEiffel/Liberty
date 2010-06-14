-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKINVISIBLE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_invisible_new: POINTER is
 		-- gtk_invisible_new (node at line 238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_invisible_new()"
		}"
		end

	gtk_invisible_set_screen (an_invisible: POINTER; a_screen: POINTER) is
 		-- gtk_invisible_set_screen (node at line 11448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_invisible_set_screen"
		}"
		end

	gtk_invisible_get_screen (an_invisible: POINTER): POINTER is
 		-- gtk_invisible_get_screen (node at line 26823)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_invisible_get_screen"
		}"
		end

	gtk_invisible_new_for_screen (a_screen: POINTER): POINTER is
 		-- gtk_invisible_new_for_screen (node at line 27651)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_invisible_new_for_screen"
		}"
		end

	gtk_invisible_get_type: NATURAL_32 is
 		-- gtk_invisible_get_type (node at line 31793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_invisible_get_type()"
		}"
		end


end -- class GTKINVISIBLE_EXTERNALS
