-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKAPPLAUNCHCONTEXT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_app_launch_context_get_type: NATURAL_64 is
 		-- gdk_app_launch_context_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_app_launch_context_get_type()"
		}"
		end

	gdk_app_launch_context_new: POINTER is
 		-- gdk_app_launch_context_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_app_launch_context_new()"
		}"
		end

	gdk_app_launch_context_set_desktop (a_context: POINTER; a_desktop: INTEGER_32) is
 		-- gdk_app_launch_context_set_desktop
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_app_launch_context_set_desktop"
		}"
		end

	gdk_app_launch_context_set_display (a_context: POINTER; a_display: POINTER) is
 		-- gdk_app_launch_context_set_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_app_launch_context_set_display"
		}"
		end

	gdk_app_launch_context_set_icon (a_context: POINTER; an_icon: POINTER) is
 		-- gdk_app_launch_context_set_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_app_launch_context_set_icon"
		}"
		end

	gdk_app_launch_context_set_icon_name (a_context: POINTER; an_icon_name: POINTER) is
 		-- gdk_app_launch_context_set_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_app_launch_context_set_icon_name"
		}"
		end

	gdk_app_launch_context_set_screen (a_context: POINTER; a_screen: POINTER) is
 		-- gdk_app_launch_context_set_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_app_launch_context_set_screen"
		}"
		end

	gdk_app_launch_context_set_timestamp (a_context: POINTER; a_timestamp: NATURAL_32) is
 		-- gdk_app_launch_context_set_timestamp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_app_launch_context_set_timestamp"
		}"
		end


end -- class GDKAPPLAUNCHCONTEXT_EXTERNALS
