-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GDIR_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_dir_close (a_dir: POINTER) 
               -- g_dir_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dir_close"
               }"
               end

	g_dir_open (a_path: POINTER; a_flags: NATURAL; an_error: POINTER): POINTER 
               -- g_dir_open
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dir_open"
               }"
               end

	g_dir_read_name (a_dir: POINTER): POINTER 
               -- g_dir_read_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dir_read_name"
               }"
               end

	g_dir_rewind (a_dir: POINTER) 
               -- g_dir_rewind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dir_rewind"
               }"
               end


end -- class GDIR_EXTERNALS
