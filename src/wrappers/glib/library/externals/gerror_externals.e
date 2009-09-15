-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GERROR_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_error_new_literal (a_domain: NATURAL_32; a_code: INTEGER_32; a_message: POINTER): POINTER is
 		-- g_error_new_literal
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_error_new_literal"
		}"
		end

	g_set_error_literal (an_err: POINTER; a_domain: NATURAL_32; a_code: INTEGER_32; a_message: POINTER) is
 		-- g_set_error_literal
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_set_error_literal"
		}"
		end

	g_propagate_error (a_dest: POINTER; a_src: POINTER) is
 		-- g_propagate_error
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_propagate_error"
		}"
		end

	g_set_error (an_err: POINTER; a_domain: NATURAL_32; a_code: INTEGER_32; a_format: POINTER; ) is
 		-- g_set_error			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_set_error"
		}"
		end

	g_prefix_error (an_err: POINTER; a_format: POINTER; ) is
 		-- g_prefix_error			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_prefix_error"
		}"
		end

	g_error_matches (an_error: POINTER; a_domain: NATURAL_32; a_code: INTEGER_32): INTEGER_32 is
 		-- g_error_matches
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_error_matches"
		}"
		end

	g_error_new (a_domain: NATURAL_32; a_code: INTEGER_32; a_format: POINTER; ): POINTER is
 		-- g_error_new			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_error_new"
		}"
		end

	g_error_free (an_error: POINTER) is
 		-- g_error_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_error_free"
		}"
		end

	g_clear_error (an_err: POINTER) is
 		-- g_clear_error
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_clear_error"
		}"
		end

	g_error_copy (an_error: POINTER): POINTER is
 		-- g_error_copy
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_error_copy"
		}"
		end

	g_error_new_valist (a_domain: NATURAL_32; a_code: INTEGER_32; a_format: POINTER; an_args: POINTER): POINTER is
 		-- g_error_new_valist
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_error_new_valist"
		}"
		end

	g_propagate_prefixed_error (a_dest: POINTER; a_src: POINTER; a_format: POINTER; ) is
 		-- g_propagate_prefixed_error			-- Variadic call

		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_propagate_prefixed_error"
		}"
		end

end
