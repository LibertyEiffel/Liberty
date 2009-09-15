-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GDIR_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_dir_rewind (a_dir: POINTER) is
 		-- g_dir_rewind
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_dir_rewind"
		}"
		end

	g_dir_close (a_dir: POINTER) is
 		-- g_dir_close
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_dir_close"
		}"
		end

	g_dir_read_name (a_dir: POINTER): POINTER is
 		-- g_dir_read_name
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_dir_read_name"
		}"
		end

	g_dir_open (a_path: POINTER; a_flags: NATURAL_32; an_error: POINTER): POINTER is
 		-- g_dir_open
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_dir_open"
		}"
		end

end
