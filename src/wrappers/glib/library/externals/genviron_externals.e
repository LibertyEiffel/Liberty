-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GENVIRON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_environ_getenv (an_envp: POINTER; a_variable: POINTER): POINTER is
 		-- g_environ_getenv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_environ_getenv"
		}"
		end

	g_environ_setenv (an_envp: POINTER; a_variable: POINTER; a_value: POINTER; an_overwrite: INTEGER_32): POINTER is
 		-- g_environ_setenv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_environ_setenv"
		}"
		end

	g_environ_unsetenv (an_envp: POINTER; a_variable: POINTER): POINTER is
 		-- g_environ_unsetenv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_environ_unsetenv"
		}"
		end

	g_get_environ: POINTER is
 		-- g_get_environ
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_environ()"
		}"
		end

	g_getenv (a_variable: POINTER): POINTER is
 		-- g_getenv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_getenv"
		}"
		end

	g_listenv: POINTER is
 		-- g_listenv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_listenv()"
		}"
		end

	g_setenv (a_variable: POINTER; a_value: POINTER; an_overwrite: INTEGER_32): INTEGER_32 is
 		-- g_setenv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_setenv"
		}"
		end

	g_unsetenv (a_variable: POINTER) is
 		-- g_unsetenv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_unsetenv"
		}"
		end


end -- class GENVIRON_EXTERNALS
