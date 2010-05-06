-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GBACKTRACE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_on_error_stack_trace (a_prg_name: POINTER) is
 		-- g_on_error_stack_trace (node at line 1049)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_on_error_stack_trace"
		}"
		end

	g_on_error_query (a_prg_name: POINTER) is
 		-- g_on_error_query (node at line 6732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_on_error_query"
		}"
		end


end -- class GBACKTRACE_EXTERNALS
