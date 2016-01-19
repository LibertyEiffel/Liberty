-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPATTERN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_pattern_match (a_pspec: POINTER; a_string_length: NATURAL; a_string: POINTER; a_string_reversed: POINTER): INTEGER 
               -- g_pattern_match
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_pattern_match"
               }"
               end

	g_pattern_match_simple (a_pattern: POINTER; a_string: POINTER): INTEGER 
               -- g_pattern_match_simple
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_pattern_match_simple"
               }"
               end

	g_pattern_match_string (a_pspec: POINTER; a_string: POINTER): INTEGER 
               -- g_pattern_match_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_pattern_match_string"
               }"
               end

	g_pattern_spec_equal (a_pspec1: POINTER; a_pspec2: POINTER): INTEGER 
               -- g_pattern_spec_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_pattern_spec_equal"
               }"
               end

	g_pattern_spec_free (a_pspec: POINTER) 
               -- g_pattern_spec_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_pattern_spec_free"
               }"
               end

	g_pattern_spec_new (a_pattern: POINTER): POINTER 
               -- g_pattern_spec_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_pattern_spec_new"
               }"
               end


end -- class GPATTERN_EXTERNALS
