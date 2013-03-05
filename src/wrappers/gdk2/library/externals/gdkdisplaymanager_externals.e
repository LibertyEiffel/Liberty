-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKDISPLAYMANAGER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_display_manager_get: POINTER is
 		-- gdk_display_manager_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_manager_get()"
		}"
		end

	gdk_display_manager_get_default_display (a_display_manager: POINTER): POINTER is
 		-- gdk_display_manager_get_default_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_manager_get_default_display"
		}"
		end

	gdk_display_manager_get_type: NATURAL_64 is
 		-- gdk_display_manager_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_manager_get_type()"
		}"
		end

	gdk_display_manager_list_displays (a_display_manager: POINTER): POINTER is
 		-- gdk_display_manager_list_displays
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_manager_list_displays"
		}"
		end

	gdk_display_manager_set_default_display (a_display_manager: POINTER; a_display: POINTER) is
 		-- gdk_display_manager_set_default_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_display_manager_set_default_display"
		}"
		end


end -- class GDKDISPLAYMANAGER_EXTERNALS
