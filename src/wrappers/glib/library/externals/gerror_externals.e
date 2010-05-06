-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GERROR_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_error_new_literal (a_domain: NATURAL_32; a_code: INTEGER_32; a_message: POINTER): POINTER is
 		-- g_error_new_literal (node at line 864)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_error_new_literal"
		}"
		end

	g_set_error_literal (an_err: POINTER; a_domain: NATURAL_32; a_code: INTEGER_32; a_message: POINTER) is
 		-- g_set_error_literal (node at line 1014)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_set_error_literal"
		}"
		end

	g_propagate_error (a_dest: POINTER; a_src: POINTER) is
 		-- g_propagate_error (node at line 1199)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_propagate_error"
		}"
		end

	-- function g_set_error (at line 70 in file /usr/include/glib-2.0/glib/gerror.h is not wrappable
	-- function g_prefix_error (at line 88 in file /usr/include/glib-2.0/glib/gerror.h is not wrappable
	g_error_matches (an_error: POINTER; a_domain: NATURAL_32; a_code: INTEGER_32): INTEGER_32 is
 		-- g_error_matches (node at line 4479)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_error_matches"
		}"
		end

	-- function g_error_new (at line 46 in file /usr/include/glib-2.0/glib/gerror.h is not wrappable
	g_error_free (an_error: POINTER) is
 		-- g_error_free (node at line 5001)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_error_free"
		}"
		end

	g_clear_error (an_err: POINTER) is
 		-- g_clear_error (node at line 5226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_clear_error"
		}"
		end

	g_error_copy (an_error: POINTER): POINTER is
 		-- g_error_copy (node at line 6162)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_error_copy"
		}"
		end

	g_error_new_valist (a_domain: NATURAL_32; a_code: INTEGER_32; a_format: POINTER; an_args: POINTER): POINTER is
 		-- g_error_new_valist (node at line 6655)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_error_new_valist"
		}"
		end

	-- function g_propagate_prefixed_error (at line 94 in file /usr/include/glib-2.0/glib/gerror.h is not wrappable

end -- class GERROR_EXTERNALS
