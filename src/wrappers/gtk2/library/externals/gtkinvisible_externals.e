-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKINVISIBLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_invisible_get_screen (an_invisible: POINTER): POINTER is
 		-- gtk_invisible_get_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_invisible_get_screen"
		}"
		end

	gtk_invisible_get_type: like long_unsigned is
 		-- gtk_invisible_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_invisible_get_type()"
		}"
		end

	gtk_invisible_new: POINTER is
 		-- gtk_invisible_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_invisible_new()"
		}"
		end

	gtk_invisible_new_for_screen (a_screen: POINTER): POINTER is
 		-- gtk_invisible_new_for_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_invisible_new_for_screen"
		}"
		end

	gtk_invisible_set_screen (an_invisible: POINTER; a_screen: POINTER) is
 		-- gtk_invisible_set_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_invisible_set_screen"
		}"
		end


end -- class GTKINVISIBLE_EXTERNALS
