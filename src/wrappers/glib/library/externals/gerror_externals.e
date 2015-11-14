-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GERROR_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_clear_error (an_err: POINTER) 
               -- g_clear_error
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_clear_error"
               }"
               end

	g_error_copy (an_error: POINTER): POINTER 
               -- g_error_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_error_copy"
               }"
               end

	g_error_free (an_error: POINTER) 
               -- g_error_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_error_free"
               }"
               end

	g_error_matches (an_error: POINTER; a_domain: NATURAL; a_code: INTEGER): INTEGER 
               -- g_error_matches
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_error_matches"
               }"
               end

	g_error_new (a_domain: NATURAL; a_code: INTEGER; a_format: POINTER): POINTER 
               -- g_error_new (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_error_new"
               }"
               end

	g_error_new_literal (a_domain: NATURAL; a_code: INTEGER; a_message: POINTER): POINTER 
               -- g_error_new_literal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_error_new_literal"
               }"
               end

	g_error_new_valist (a_domain: NATURAL; a_code: INTEGER; a_format: POINTER; an_args: POINTER): POINTER 
               -- g_error_new_valist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_error_new_valist"
               }"
               end

	g_prefix_error (an_err: POINTER; a_format: POINTER) 
               -- g_prefix_error (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_prefix_error"
               }"
               end

	g_propagate_error (a_dest: POINTER; a_src: POINTER) 
               -- g_propagate_error
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_propagate_error"
               }"
               end

	g_propagate_prefixed_error (a_dest: POINTER; a_src: POINTER; a_format: POINTER) 
               -- g_propagate_prefixed_error (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_propagate_prefixed_error"
               }"
               end

	g_set_error (an_err: POINTER; a_domain: NATURAL; a_code: INTEGER; a_format: POINTER) 
               -- g_set_error (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_set_error"
               }"
               end

	g_set_error_literal (an_err: POINTER; a_domain: NATURAL; a_code: INTEGER; a_message: POINTER) 
               -- g_set_error_literal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_set_error_literal"
               }"
               end


end -- class GERROR_EXTERNALS
