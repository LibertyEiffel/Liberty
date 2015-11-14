-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSHELL_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_shell_error_quark: NATURAL 
               -- g_shell_error_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_shell_error_quark"
               }"
               end

	g_shell_parse_argv (a_command_line: POINTER; an_argcp: POINTER; an_argvp: POINTER; an_error: POINTER): INTEGER 
               -- g_shell_parse_argv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_shell_parse_argv"
               }"
               end

	g_shell_quote (an_unquoted_string: POINTER): POINTER 
               -- g_shell_quote
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_shell_quote"
               }"
               end

	g_shell_unquote (a_quoted_string: POINTER; an_error: POINTER): POINTER 
               -- g_shell_unquote
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_shell_unquote"
               }"
               end


end -- class GSHELL_EXTERNALS
