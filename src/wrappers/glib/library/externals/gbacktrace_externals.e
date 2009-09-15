-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GBACKTRACE_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_on_error_stack_trace (a_prg_name: POINTER) is
 		-- g_on_error_stack_trace
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_on_error_stack_trace"
		}"
		end

	g_on_error_query (a_prg_name: POINTER) is
 		-- g_on_error_query
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_on_error_query"
		}"
		end

end
