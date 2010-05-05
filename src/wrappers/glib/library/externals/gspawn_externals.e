-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSPAWN_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_spawn_async_with_pipes (a_working_directory: POINTER; an_argv: POINTER; an_envp: POINTER; a_flags: INTEGER; a_child_setup: POINTER; an_user_data: POINTER; a_child_pid: POINTER; a_standard_input: POINTER; a_standard_output: POINTER; a_standard_error: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_spawn_async_with_pipes (node at line 479)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_spawn_async_with_pipes"
		}"
		end

	g_spawn_command_line_sync (a_command_line: POINTER; a_standard_output: POINTER; a_standard_error: POINTER; an_exit_status: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_spawn_command_line_sync (node at line 1992)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_spawn_command_line_sync"
		}"
		end

	g_spawn_async (a_working_directory: POINTER; an_argv: POINTER; an_envp: POINTER; a_flags: INTEGER; a_child_setup: POINTER; an_user_data: POINTER; a_child_pid: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_spawn_async (node at line 2436)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_spawn_async"
		}"
		end

	g_spawn_command_line_async (a_command_line: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_spawn_command_line_async (node at line 3016)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_spawn_command_line_async"
		}"
		end

	g_spawn_close_pid (a_pid: INTEGER_32) is
 		-- g_spawn_close_pid (node at line 3241)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_spawn_close_pid"
		}"
		end

	g_spawn_sync (a_working_directory: POINTER; an_argv: POINTER; an_envp: POINTER; a_flags: INTEGER; a_child_setup: POINTER; an_user_data: POINTER; a_standard_output: POINTER; a_standard_error: POINTER; an_exit_status: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_spawn_sync (node at line 3784)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_spawn_sync"
		}"
		end

	g_spawn_error_quark: NATURAL_32 is
 		-- g_spawn_error_quark (node at line 5635)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_spawn_error_quark()"
		}"
		end


end -- class GSPAWN_EXTERNALS
