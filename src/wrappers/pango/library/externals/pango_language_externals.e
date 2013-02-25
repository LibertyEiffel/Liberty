-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_LANGUAGE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_language_to_string (a_language: POINTER): POINTER is
 		-- pango_language_to_string (node at line 2416)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_language_to_string"
		}"
		end

	pango_language_from_string (a_language: POINTER): POINTER is
 		-- pango_language_from_string (node at line 2570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_language_from_string"
		}"
		end

	pango_language_get_scripts (a_language: POINTER; a_num_scripts: POINTER): POINTER is
 		-- pango_language_get_scripts (node at line 3902)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_language_get_scripts"
		}"
		end

	pango_language_get_type: NATURAL_64 is
 		-- pango_language_get_type (node at line 4479)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_language_get_type()"
		}"
		end

	pango_language_get_sample_string (a_language: POINTER): POINTER is
 		-- pango_language_get_sample_string (node at line 7358)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_language_get_sample_string"
		}"
		end

	pango_language_get_default: POINTER is
 		-- pango_language_get_default (node at line 7363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_language_get_default()"
		}"
		end

	pango_language_matches (a_language: POINTER; a_range_list: POINTER): INTEGER_32 is
 		-- pango_language_matches (node at line 7418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_language_matches"
		}"
		end

	pango_language_includes_script (a_language: POINTER; a_script: INTEGER): INTEGER_32 is
 		-- pango_language_includes_script (node at line 8168)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_language_includes_script"
		}"
		end


end -- class PANGO_LANGUAGE_EXTERNALS
