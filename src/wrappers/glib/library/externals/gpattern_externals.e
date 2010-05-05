-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPATTERN_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_pattern_spec_equal (a_pspec1: POINTER; a_pspec2: POINTER): INTEGER_32 is
 		-- g_pattern_spec_equal (node at line 209)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_pattern_spec_equal"
		}"
		end

	g_pattern_spec_free (a_pspec: POINTER) is
 		-- g_pattern_spec_free (node at line 3091)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_pattern_spec_free"
		}"
		end

	g_pattern_spec_new (a_pattern: POINTER): POINTER is
 		-- g_pattern_spec_new (node at line 4891)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_pattern_spec_new"
		}"
		end

	g_pattern_match_string (a_pspec: POINTER; a_string: POINTER): INTEGER_32 is
 		-- g_pattern_match_string (node at line 5460)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_pattern_match_string"
		}"
		end

	g_pattern_match (a_pspec: POINTER; a_string_length: NATURAL_32; a_string: POINTER; a_string_reversed: POINTER): INTEGER_32 is
 		-- g_pattern_match (node at line 5736)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_pattern_match"
		}"
		end

	g_pattern_match_simple (a_pattern: POINTER; a_string: POINTER): INTEGER_32 is
 		-- g_pattern_match_simple (node at line 5925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_pattern_match_simple"
		}"
		end


end -- class GPATTERN_EXTERNALS
