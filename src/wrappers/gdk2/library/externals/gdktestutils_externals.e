-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKTESTUTILS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_test_render_sync (a_window: POINTER) is
 		-- gdk_test_render_sync
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_test_render_sync"
		}"
		end

	gdk_test_simulate_button (a_window: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_button: NATURAL_32; a_modifiers: INTEGER; a_button_pressrelease: INTEGER): INTEGER_32 is
 		-- gdk_test_simulate_button
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_test_simulate_button"
		}"
		end

	gdk_test_simulate_key (a_window: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_keyval: NATURAL_32; a_modifiers: INTEGER; a_key_pressrelease: INTEGER): INTEGER_32 is
 		-- gdk_test_simulate_key
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_test_simulate_key"
		}"
		end


end -- class GDKTESTUTILS_EXTERNALS
