-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDIR_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_dir_rewind (a_dir: POINTER) is
 		-- g_dir_rewind (node at line 226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dir_rewind"
		}"
		end

	g_dir_close (a_dir: POINTER) is
 		-- g_dir_close (node at line 3571)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dir_close"
		}"
		end

	g_dir_read_name (a_dir: POINTER): POINTER is
 		-- g_dir_read_name (node at line 5007)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dir_read_name"
		}"
		end

	g_dir_open (a_path: POINTER; a_flags: NATURAL_32; an_error: POINTER): POINTER is
 		-- g_dir_open (node at line 6343)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dir_open"
		}"
		end


end -- class GDIR_EXTERNALS
