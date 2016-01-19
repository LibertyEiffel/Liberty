-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GBACKTRACE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_on_error_query (a_prg_name: POINTER) 
               -- g_on_error_query
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_on_error_query"
               }"
               end

	g_on_error_stack_trace (a_prg_name: POINTER) 
               -- g_on_error_stack_trace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_on_error_stack_trace"
               }"
               end


end -- class GBACKTRACE_EXTERNALS
